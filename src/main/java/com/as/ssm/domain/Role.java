package com.as.ssm.domain;

import lombok.Data;

/**
 * 角色表
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/27
 **/
@Data
public class Role {
    /**
     * 角色id
     */
    private Integer roleid;

    /**
     * 添加时间
     */
    private String addtime;

    /**
     * 角色名称
     */
    private String rolename;

    /**
     * 角色描述
     */
    private String roledesc;

}
