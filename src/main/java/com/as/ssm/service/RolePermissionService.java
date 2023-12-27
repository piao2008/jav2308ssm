package com.as.ssm.service;

import com.as.ssm.dao.RolePermissionMapper;
import com.as.ssm.domain.RolePermission;

import java.util.List;

/**
 * 角色权限分配的业务层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/

public interface RolePermissionService {
    /**
     * 删除当前角色的权限
     * @param roleId
     */
    public  void removeByRoleId(Integer roleId);



    public  List<RolePermission> getByRoleId(Integer roleid);

    /**
     * 角色权限的修改
     * @param menusid
     * @param roleId
     */
    public  void modifyByRolId(Integer[] menuids,Integer roleId);
}
