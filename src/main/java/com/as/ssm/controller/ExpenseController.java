package com.as.ssm.controller;

import com.as.ssm.domain.Expense;
import com.as.ssm.domain.News;
import com.as.ssm.domain.NewsType;
import com.as.ssm.service.EmployeeSerivce;
import com.as.ssm.service.ExpenseService;
import com.as.ssm.service.NewsService;
import com.as.ssm.service.NewsTypeService;
import com.as.ssm.vo.VONews;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/
@Controller
@RequestMapping("/expense")
public class ExpenseController {
    @Autowired
    private ExpenseService expenseService;
    @Autowired
    private EmployeeSerivce employeeSerivce;


    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage,Expense expense)
    {
        ModelAndView mv=new ModelAndView("expense/list");
        mv.addObject("pages", this.expenseService.list(currPage,expense));
        if(expense.getState()==null) expense.setState(-1);
        if(expense.getSugstate()==null) expense.setSugstate(-1);
        mv.addObject("expense", expense);
        return  mv;
    }



    @PostMapping("/append")
    public ModelAndView append(Expense expense, Integer[] extypeids, Integer[] moneys, String[] costdescs)
    {
        ModelAndView mv=new ModelAndView("redirect:/expense/list");
        this.expenseService.append(expense, extypeids, moneys, costdescs);
        return  mv;
    }


    @GetMapping("/append")
    public ModelAndView append()
    {
        ModelAndView mv=new ModelAndView("expense/append");
        //报销类别
        mv.addObject("listType", this.expenseService.listType());
        //查询所有职位为经理
        mv.addObject("positionList",this.employeeSerivce.selectByPosition(1));
        mv.addObject("time", LocalDate.now().toString());

        return  mv;
    }


    @GetMapping("/removebyid")
    public ModelAndView removebyid(Integer expenseId)
    {
        ModelAndView mv=new ModelAndView("redirect:/expense/list");
        this.expenseService.removeById(expenseId);
        return  mv;
    }


    @GetMapping("/updatestate")
    public ModelAndView updatestate(Integer expenseId)
    {
        ModelAndView mv=new ModelAndView("redirect:/expense/list");
        //state-1-2
        this.expenseService.updateState(2,expenseId);
        return  mv;
    }



    @GetMapping("/detail")
    public ModelAndView getById(Integer expenseId)
    {
        ModelAndView mv=new ModelAndView("expense/detail");
        mv.addObject("expense", this.expenseService.getById(expenseId));
        //查询所有职位为经理
        mv.addObject("positionList",this.employeeSerivce.selectByPosition(1));
        //报销类别
        mv.addObject("listType", this.expenseService.listType());
        return  mv;
    }


    @PostMapping("/modifybyid")
    public ModelAndView modifyById(Expense expense, Integer[] extypeids, Integer[] moneys, String[] costdescs)
    {
        ModelAndView mv=new ModelAndView("redirect:/expense/list");
        this.expenseService.modifyById(expense, extypeids, moneys, costdescs);
        return  mv;
    }


    @ResponseBody
    @GetMapping("/deletebyiddetail")
    public String deleteByIdDetail(Integer detailId)
    {
        this.expenseService.removeByIdDetail(detailId);
        return "ok";
    }

    ///////////////下面为报销审批//////////////////
    @RequestMapping("/myconfirm")
    public ModelAndView listExamine(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage,Expense expense)
    {
        ModelAndView mv=new ModelAndView("expense/myconfirm");
        expense.setSugtime("2023");
        mv.addObject("pages", this.expenseService.listExamine(currPage,expense));
        if(expense.getSugstate()==null) expense.setSugstate(-1);
        mv.addObject("expense", expense);
        return  mv;
    }

    //报销审批显示页面
    @GetMapping("/getbyexamineid")
    public ModelAndView getByExamineId(Integer expenseId)
    {
        ModelAndView mv=new ModelAndView("expense/examine");
        mv.addObject("expense", this.expenseService.getById(expenseId));
        return  mv;
    }
    //报销审批修改
    //
    @PostMapping("/modifybyexamineid")
    public ModelAndView modifyByexamineId(Expense expense)
    {
        ModelAndView mv=new ModelAndView("redirect:/expense/myconfirm");
        this.expenseService.updatesugState(expense);
        return  mv;
    }

}
