package com.as.ssm.service.impl;

import com.as.ssm.dao.ExpenseDetailMapper;
import com.as.ssm.dao.ExpenseMapper;
import com.as.ssm.dao.ExpenseTypeMapper;
import com.as.ssm.domain.Employee;
import com.as.ssm.domain.Expense;
import com.as.ssm.domain.ExpenseDetail;
import com.as.ssm.domain.ExpenseType;
import com.as.ssm.service.ExpenseService;
import com.as.ssm.util.Common;
import com.as.ssm.util.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/15
 **/
@Service
public class ExpenseServiceImpl implements ExpenseService {
    @Autowired
    private ExpenseMapper expenseMapper;
    @Autowired
    private ExpenseDetailMapper expenseDetailMapper;
    @Autowired
    private ExpenseTypeMapper expenseTypeMapper;
    @Autowired
    private HttpSession session;
    @Override
    public void append(Expense expense, Integer[] extypeids, Integer[] moneys, String[] costdescs) {

        //1>添加主表
        Employee emp=(Employee)session.getAttribute("loginEmp");
        //empid(在session中),total,reason,confirmperson
        expense.setEmpid(emp.getEmpid());
        this.expenseMapper.insert(expense);
        //2>添加明细表
        List<ExpenseDetail> list=new ArrayList<>();
        for(int i=0;i<extypeids.length;i++)
        {
            ExpenseDetail detail=new ExpenseDetail();
            //expenseid,extypeid,money,costdesc
            detail.setExtypeid(expense.getExpenseid());
            detail.setExtypeid(extypeids[i]);
            detail.setMoney(moneys[i]);
            detail.setCostdesc(costdescs[i]);
            detail.setExpenseid(expense.getExpenseid());
            //添加到list中
            list.add(detail);
        }
        this.expenseDetailMapper.inserts(list);



    }

    @Override
    public List<ExpenseType> listType() {
        return this.expenseTypeMapper.select();
    }

    @Override
    public Pages<Expense> list(Integer currPage, Expense expense) {

        Employee emp=(Employee)session.getAttribute("loginEmp");
        //empid(在session中),total,reason,confirmperson
        expense.setEmpid(emp.getEmpid());

        int rowCount = this.expenseMapper.getRowCount(expense);
        List<Expense> list = this.expenseMapper.select(expense, (currPage - 1) * Common.PAGESIZE, Common.PAGESIZE);
        return new Pages<Expense>(currPage, Common.PAGESIZE, rowCount, list);
    }

    @Override
    public Pages<Expense> listExamine(Integer currPage, Expense expense) {
        Employee emp=(Employee)session.getAttribute("loginEmp");
        //empid(在session中),total,reason,confirmperson
        expense.setConfirmperson(emp.getEmpid());//2 --审批人的员工id
        expense.setState(2);//查询已提交的

        int rowCount = this.expenseMapper.getRowCount(expense);
        List<Expense> list = this.expenseMapper.select(expense, (currPage - 1) * Common.PAGESIZE, Common.PAGESIZE);
        return new Pages<Expense>(currPage, Common.PAGESIZE, rowCount, list);
    }

    @Override
    public Expense getById(Integer expenseId) {
        Expense expense=new Expense();
        Employee emp=(Employee)session.getAttribute("loginEmp");
        //empid(在session中),total,reason,confirmperson
        //expense.setEmpid(emp.getEmpid());
        expense.setExpenseid(expenseId);

        Expense expense1=this.expenseMapper.select(expense,-1,1).get(0);
        return expense1;
    }



    @Override
    public void modifyById(Expense expense, Integer[] extypeids, Integer[] moneys, String[] costdescs) {
//        #修改
//        #1>修改主表
//        update expense set total=0,reason=0,confirmperson=0 where expenseid=0
        this.expenseMapper.updateById(expense);
//        #2>修改明细表
//        delete from  expensedetail where expenseid=0
            this.expenseDetailMapper.deleteByExpenseId(expense.getExpenseid());
//
//        insert into expensedetail(expenseid,extypeid,money,costdesc)
//        values(1,1,200,'吃饭'),(1,2,300,'打车');

        //2>添加明细表
        List<ExpenseDetail> list=new ArrayList<>();
        for(int i=0;i<extypeids.length;i++)
        {
            ExpenseDetail detail=new ExpenseDetail();
            //expenseid,extypeid,money,costdesc
            detail.setExtypeid(expense.getExpenseid());
            detail.setExtypeid(extypeids[i]);
            detail.setMoney(moneys[i]);
            detail.setCostdesc(costdescs[i]);
            detail.setExpenseid(expense.getExpenseid());
            //添加到list中
            list.add(detail);
        }
        this.expenseDetailMapper.inserts(list);


    }

    @Override
    public void removeByIdDetail(Integer id) {
        this.expenseDetailMapper.deleteById(id);
    }

    @Override
    public void removeById(Integer expenseId) {
//        #删除
//        #1>删除主表信息
//        delete from expense where expenseid=0
        this.expenseMapper.deleteById(expenseId);
//        #2>删除明细
//        delete from expensedetail where expenseid=0
        this.expenseDetailMapper.deleteByExpenseId(expenseId);
    }

    @Override
    public void updateState(Integer state, Integer expenseId) {

        Expense expense=new Expense();
        expense.setExpenseid(expenseId);
        expense.setState(state);
        //
        this.expenseMapper.updateById(expense);
    }

    @Override
    public void updatesugState(Expense expense) {
        expense.setSugtime("2023");
        this.expenseMapper.updateById(expense);
    }
}
