package com.as.ssm.service.impl;

import com.as.ssm.dao.RolePermissionMapper;
import com.as.ssm.domain.Employee;
import com.as.ssm.domain.RolePermission;
import com.as.ssm.domain.UsersMenu;
import com.as.ssm.service.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/
@Service
public class RolePermissionServiceImpl implements RolePermissionService {
    @Autowired
    private RolePermissionMapper rolePermissionMapper;
    @Autowired
    private HttpSession session;

    @Override
    public void removeByRoleId(Integer roleId) {
        this.rolePermissionMapper.deleteByRoleId(roleId);
    }



    @Override
    public List<RolePermission> getByRoleId(Integer roleid) {
        return this.rolePermissionMapper.selectByRoleId(roleid);
    }

    @Override
    public void modifyByRolId(Integer[] menuids, Integer roleId) {
        Employee emp=(Employee)session.getAttribute("loginEmp");
        //1>删除角以对应的权限
        this.rolePermissionMapper.deleteByRoleId(roleId);
        //2>批量添加权限
        //
        List<RolePermission> list=new ArrayList<>();
        //
        for (Integer menuid:menuids )
        {
            RolePermission rolePermission=new RolePermission();
           // usersMenu.setEmpid(empid);
            //usersMenu.setMenuid(menuid);
            //把users添加到list集合中
            rolePermission.setMenuid(menuid);
            rolePermission.setRoleid(roleId);
            rolePermission.setCreateuser(emp.getEmpname());

            list.add(rolePermission);
        }
        //this.usersMenuMapper.inserts(list);
        this.rolePermissionMapper.inserts(list);

    }
}
