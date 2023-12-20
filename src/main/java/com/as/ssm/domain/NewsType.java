package com.as.ssm.domain;

import lombok.Data;

/**
 * 新闻类别
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/

@Data
public class NewsType {

    /**
     * 闻新类别id
     */
    private Integer newstypeid;

    /**
     * 添加时间
     */
    private String addtime;

    /**
     * 新闻类别名称
     */
    private String newsname;

    /**
     * 新闻类别描述
     */
    private String newsdesc;

}
