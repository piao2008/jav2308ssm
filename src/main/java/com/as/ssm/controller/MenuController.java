package com.as.ssm.controller;

import com.as.ssm.domain.DepartInfo;
import com.as.ssm.domain.Employee;
import com.as.ssm.domain.Menu;
import com.as.ssm.domain.UsersMenu;
import com.as.ssm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/12
 **/

@Controller
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuService menuService;
    @Autowired
    private UsersMenuService usersMenuService;
    @Autowired
    private EmployeeSerivce employeeSerivce;
    @Autowired
    private DepartInfoService  departInfoService;
    @Autowired
    private PosService posService;

//    @ResponseBody
//    @RequestMapping("/list")
//    public List<Menu> selectByEmpId()
//    {
//        return this.menuService.selectByParentId(0);
//    }

    @GetMapping("/showmenu")
    public ModelAndView showMenu(Integer empId)
    {
        ModelAndView mv=new ModelAndView("menu/showmenu");
        mv.addObject("listMenu", this.menuService.list(0));
        mv.addObject("empid", empId);
        return mv;
    }

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage, Employee employee, HttpServletRequest request)
    {

        ModelAndView mv =new ModelAndView("menu/list");
            mv.addObject("pages", this.employeeSerivce.list(currPage, employee));
            if (employee.getState() == null) employee.setState(-1);
            mv.addObject("employee", employee);
            mv.addObject("listDepart", this.departInfoService.list(-1, new DepartInfo()).getList());
            mv.addObject("listPos", this.posService.list());
        return mv;
    }

    //ajax方法
    //得到用户的权限菜单
    @ResponseBody
    @GetMapping("/getbyempid")
    public List<UsersMenu> getByEmpId(Integer empId)
    {
        return  this.usersMenuService.getByEmpId(empId);
    }


    @GetMapping("/modifybyid")
    public ModelAndView modifyById(Integer[] menuids,Integer empId)
    {
        ModelAndView mv=new ModelAndView("redirect:/menu/list");
        this.usersMenuService.modifyById(empId, menuids);
        return mv;
    }
}
