package com.as.ssm.controller;

import com.as.ssm.domain.*;
import com.as.ssm.service.*;
import com.fasterxml.jackson.databind.annotation.JsonAppend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;

    @Autowired
    private EmployeeSerivce employeeSerivce;

    @Autowired
    private DepartInfoService departInfoService;

    @Autowired
    private RolePermissionService rolePermissionService;
    @Autowired
    private  PosService posService;
    @Autowired
    private  UserRoleService userRoleService;


    @GetMapping("/list")
    public ModelAndView list()
    {
        ModelAndView mv=new ModelAndView("role/list");
        mv.addObject("list", this.roleService.list());
        return  mv;
    }

    @GetMapping("/append")
    public ModelAndView append()
    {
        ModelAndView mv=new ModelAndView("role/append");
        return  mv;
    }

    @PostMapping("/append")
    public ModelAndView append(Role role)
    {
        ModelAndView mv=new ModelAndView("redirect:/role/list");
        this.roleService.append(role);
        return  mv;
    }

    @GetMapping("/removebyid")
    public ModelAndView removeById(Integer roleId)
    {
        ModelAndView mv=new ModelAndView("redirect:/role/list");
        this.roleService.removeById(roleId);
        return  mv;
    }




    @GetMapping("/edit")
    public ModelAndView getById(Integer roleId)
    {
        ModelAndView mv=new ModelAndView("role/edit");
        mv.addObject("role", this.roleService.getById(roleId));

        return  mv;
    }



    @PostMapping("/modifybyid")
    public ModelAndView modifyById(Role role)
    {
        ModelAndView mv=new ModelAndView("redirect:/role/list");
        this.roleService.modifyById(role);
        return  mv;
    }

    //////////////角色权限分配相关
    @GetMapping("/power")
    public ModelAndView power()
    {
        ModelAndView mv=new ModelAndView("role/power");
        mv.addObject("list", this.roleService.list());
        return  mv;
    }

    @GetMapping("/showpower")
    public ModelAndView showPower(Integer roleid)
    {
        ModelAndView mv=new ModelAndView("role/showpower");
        mv.addObject("roleId", roleid);
        List<Menu> list=this.menuService.list(0);
        mv.addObject("listMenu", list);

        return  mv;
    }

    //ajax方法
    //得到角色的权限菜单
    @ResponseBody
    @GetMapping("/getbyroleid")
    public List<RolePermission> getByRoleId(Integer roleId)
    {
        return  this.rolePermissionService.getByRoleId(roleId);
    }

    @GetMapping("modifybyroleid")
    public ModelAndView modifyByRoleId(Integer[] menuids,Integer roleId)
    {
        ModelAndView mv=new ModelAndView("redirect:/role/power");
        this.rolePermissionService.modifyByRolId(menuids, roleId);
        return  mv;
    }


    //下面是完成给用户分配角色
    @RequestMapping("/userrolelist")
    public ModelAndView UserROleList(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage, Employee employee, HttpServletRequest request)
    {

        //往后改成拦截器实现:功能
        ModelAndView mv =null;
        //得到session
        HttpSession session=request.getSession();

        mv = new ModelAndView("userrole/list");
        mv.addObject("pages", this.employeeSerivce.list(currPage, employee));
        if (employee.getState() == null) employee.setState(-1);
        mv.addObject("employee", employee);
        mv.addObject("listDepart", this.departInfoService.list(-1, new DepartInfo()).getList());
        mv.addObject("listPos", this.posService.list());
        return mv;
    }

    @GetMapping("/rolelist")
    public ModelAndView roleList(Integer empId)
    {
        ModelAndView mv=new ModelAndView("userrole/rolelist");
        mv.addObject("rolelist", this.roleService.list());
        mv.addObject("empId", empId);
        return  mv;
    }

    //ajax
    //当前用户实现默认选中
    @GetMapping("/getbyempid")
    @ResponseBody
    public  List<UserRole> getByEmpId(Integer empId)
    {
        return  this.userRoleService.getByEmpid(empId);
    }
    //分配用户的角色
    @GetMapping("/save")
    public  ModelAndView save(Integer[] roleIds,Integer empId)
    {
        ModelAndView mv=new ModelAndView("redirect:/role/userrolelist");
        this.userRoleService.append(roleIds, empId);
        return  mv;
    }
}
