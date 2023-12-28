package com.as.ssm.service.impl;

import com.as.ssm.dao.UserRoleMapper;
import com.as.ssm.domain.UserRole;
import com.as.ssm.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/28
 **/

@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Override
    public List<UserRole> getByEmpid(Integer empId) {
        return this.userRoleMapper.selectByEmpid(empId);
    }

    @Transactional
    @Override
    public void append(Integer[] roleIds, Integer empId) {

//        #给用户分配多角色
//        #删除当前要分配角色用户对应角色
//        delete from userrole where empid=0
        this.userRoleMapper.deleteByEmpId(empId);
//        #批量添加
//        insert into userrole(empid,roleid) values(),()
        List<UserRole> list=new ArrayList<>();
        for(Integer roleid :roleIds)
        {
            UserRole userRole=new UserRole();
            userRole.setRoleid(roleid);
            userRole.setEmpid(empId);
            //
            list.add(userRole);
        }
        this.userRoleMapper.inserts(list);
    }
}
