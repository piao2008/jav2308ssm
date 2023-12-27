package com.as.ssm.domain;

import lombok.Data;

import java.util.List;

/**
 * 菜单实体类
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/12
 **/

@Data
public class Menu {

    /**
     * 菜单 id
     */
    private Integer menuid;

    /**
     * 菜单 名称
     */
    private String menuname;

    /**
     * 菜单映射地址
     */
    private String url;

    /**
     * 菜单上级id
     */
    private Integer parentid;

    /**
     * 菜单图标样式
     */
    private String ico;

    /**
     * 员工id
     */
    private Integer empid;
    /**
     * 上级对应下级 关系:1对多
     */
    private List<Menu> list;


    /**
     * 菜单排序
     */
    private Integer sort;

    /**
     * 是否为菜单项 0不是 1是
     */
    private Integer isMenu;


}
