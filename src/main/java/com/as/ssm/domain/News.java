package com.as.ssm.domain;

import lombok.Data;

/**
 * 新闻实体类
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/
@Data
public class News {
//    ctrl+alt+l格式化
    /**
     * 新闻id
     */
    private Integer newsid;

    /**
     * 添加时间
     */
    private String addtime;

    /**
     * 新闻类别id
     */
    private Integer newstypeid;

    /**
     * 新闻标题
     */
    private String newstitle;

    /**
     * 新闻内容
     */
    private String newscontent;

    /**
     * 员工id
     */
    private Integer empid;

    /**
     * 发布时间
     */
    private String publishtime;

    /**
     * 新闻状态
     */
    private Integer state;

    /**
     * 员工姓名
     */
    private String empname;

    /**
     * 新闻类别名称
     */
    private String newsname;

    /**
     * 用户头像
     */
    private String picture;

}
