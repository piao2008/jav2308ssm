package com.as.ssm.service;

import com.as.ssm.domain.UserRole;

import java.util.List;

/**
 * 用户角色表的业务层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/28
 **/

public interface UserRoleService {

    public List<UserRole> getByEmpid(Integer empId);

    /**
     * 给员工分配角色
     * @param roleIds
     * @param empId
     */
    public void append(Integer[] roleIds,Integer empId);

}
