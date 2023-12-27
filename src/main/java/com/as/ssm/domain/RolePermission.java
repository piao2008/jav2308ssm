package com.as.ssm.domain;

import lombok.Data;

/**
 * 角色权限表
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/

@Data
public class RolePermission {

    /**
     * 主键id
     */
    private Integer id;

    /**
     * 角色id
     */
    private Integer roleid;

    /**
     * 菜单 id
     */
    private Integer menuid;

    /**
     * 分配权限的人
     */
    private String createuser;

}
