package com.as.ssm.controller;

import com.as.ssm.domain.Menu;
import com.as.ssm.domain.Role;
import com.as.ssm.domain.RolePermission;
import com.as.ssm.domain.UsersMenu;
import com.as.ssm.service.MenuService;
import com.as.ssm.service.RolePermissionService;
import com.as.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
    private RolePermissionService rolePermissionService;

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
}
