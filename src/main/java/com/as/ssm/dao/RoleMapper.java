package com.as.ssm.dao;

import com.as.ssm.domain.Role;

import java.util.List;

/**
 * 角色数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/

public interface RoleMapper {

    public List<Role> select();

    public  void deleteById(Integer roleId);

    public  void updateById(Role role);

    public  void insert(Role role);
    public  Role selectById(Integer roleId);


}
