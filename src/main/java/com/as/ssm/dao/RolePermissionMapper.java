package com.as.ssm.dao;

import com.as.ssm.domain.RolePermission;

import java.util.List;

/**
 * 角色权限的数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/

public interface RolePermissionMapper {

    /**
     * 删除当前角色的权限
     * @param roleId
     */
    public  void deleteByRoleId(Integer roleId);

    /**
     * 角色权限批量添加
     * @param list
     */
    public  void inserts(List<RolePermission> list);

    /**
     * 查询角色对应的权限
     * @param roleid
     * @return
     */
    public  List<RolePermission> selectByRoleId(Integer roleid);


}
