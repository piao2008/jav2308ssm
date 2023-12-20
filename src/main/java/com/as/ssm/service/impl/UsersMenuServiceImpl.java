package com.as.ssm.service.impl;

import com.as.ssm.dao.UsersMenuMapper;
import com.as.ssm.domain.UsersMenu;
import com.as.ssm.service.UsersMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/13
 **/

@Service
public class UsersMenuServiceImpl implements UsersMenuService {
    @Autowired
    UsersMenuMapper usersMenuMapper;


    @Override
    public void modifyById(Integer empid, Integer[] menuids) {
        //1>删除用户对应的权限
        this.usersMenuMapper.deleteByEmpid(empid);
        //2>批量添加权限
        //
        List<UsersMenu> list=new ArrayList<>();
        //
        for (Integer menuid:menuids )
        {
            UsersMenu usersMenu=new UsersMenu();
            usersMenu.setEmpid(empid);
            usersMenu.setMenuid(menuid);
            //把users添加到list集合中
            list.add(usersMenu);
        }
        this.usersMenuMapper.inserts(list);


    }

    @Override
    public List<UsersMenu> getByEmpId(Integer empId) {
        return this.usersMenuMapper.selectByEmpId(empId);
    }
}
