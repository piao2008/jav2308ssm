package com.as.ssm.service;

import com.as.ssm.domain.Role;

import java.util.List;

/**
 * 角色业务层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/

public interface RoleService {
    public List<Role> list();

    public  void removeById(Integer roleId);

    public  void modifyById(Role role);

    public  void append(Role role);
    public  Role getById(Integer roleId);
}
