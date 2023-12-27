package com.as.ssm.service.impl;

import com.as.ssm.dao.RoleMapper;
import com.as.ssm.domain.Role;
import com.as.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色业务层实现
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> list() {
        return this.roleMapper.select();
    }

    @Override
    public void removeById(Integer roleId) {
        this.roleMapper.deleteById(roleId);
    }

    @Override
    public void modifyById(Role role) {
        this.roleMapper.updateById(role);
    }

    @Override
    public void append(Role role) {
        this.roleMapper.insert(role);
    }

    @Override
    public Role getById(Integer roleId) {
        return this.roleMapper.selectById(roleId);
    }
}
