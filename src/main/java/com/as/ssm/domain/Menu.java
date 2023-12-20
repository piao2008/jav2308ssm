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
    private Integer menuid;
    private String menuname;
    private String url;
    private Integer parentid;
    private String ico;

    /**
     * 员工id
     */
    private  Integer empid;
    /**
     * 上级对应下级 关系:1对多
     *
     */
    private List<Menu> list;

}
