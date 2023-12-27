package com.as.ssm.domain;

import lombok.Data;

/**
 * 用户角色表
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/

@Data
public class UserRole {

    /**
     * 主键id
     */
    private Integer id;
    /**
     * 添加时间
     */
    private String addtime;

    /**
     * 员工id
     */
    private Integer empid;

    /**
     * 角色id
     */
    private Integer roleid;

}
