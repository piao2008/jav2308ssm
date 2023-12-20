package com.as.ssm.service;

import com.as.ssm.domain.Expense;
import com.as.ssm.domain.ExpenseType;
import com.as.ssm.util.Pages;

import java.util.List;

/**
 * 报销业务接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/15
 **/

public interface ExpenseService {

    /**
     * 报销添加
     * 1.主表
     * 2.明细表
     */
    public void append(Expense expense,Integer[] extypeids,Integer[] moneys,String[] costdescs);

    /**
     * 报销类别查询
     * @return
     */
    public List<ExpenseType> listType();

    /**
     * 分页信息
     * @param currPage
     * @param expense
     * @return
     */
    public Pages<Expense> list(Integer currPage,Expense expense);


    /**
     * 报销审批查询
     * @param currPage
     * @param expense
     * @return
     */
    public Pages<Expense> listExamine(Integer currPage,Expense expense);

    /**
     * 主键查询
     * @param expenseId
     * @return
     */
    public Expense getById(Integer expenseId);



    /**
     * 修改
     * @param expense
     * @param extypeids
     * @param moneys
     * @param costdescs
     */
    public void modifyById(Expense expense,Integer[] extypeids,Integer[] moneys,String[] costdescs);


    /**
     * 明细表的主键删除
     * @param id
     */
    public  void removeByIdDetail(Integer id);

    /**
     * 主键删除
     * @param expenseId
     */
    public void removeById(Integer expenseId);

    /**
     * 修改报销主表状态
     * @param state
     * @param expenseId
     */
    public  void updateState(Integer state,Integer expenseId);

    /**
     * 审批修改
     * @param expense
     */
    public  void updatesugState(Expense expense);


}
