package com.as.ssm.domain;

import lombok.Data;

/**
 * 日程实体类
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/8
 **/

@Data
public class Schedule {
    /**
     * 日程id
     */
    private Integer scheduleid;

    /**
     * 日程添加时间
     */
    private String addtime;

    /**
     * 日程标题
     */
    private String title;

    /**
     * 员工id
     */
    private Integer empid;

    /**
     * 日程开始时间
     */
    private String begintime;

    /**
     * 条件查询结时间
     */
    private String end_time;

    /**
     * 日程结束时间
     */
    private String endtime;

    /**
     * 日程内容
     */
    private String content;

    /**
     * 日程联系人
     */
    private String concatname;

    /**
     * 地址
     */
    private String address;

    /**
     * 电话
     */
    private String tel;

    /**
     * 备注
     */
    private String demo;

    /**
     * 是否公开
     * 1 私有 2公开
     */
    private Integer ifprivate;

    /**
     * 状态
     * 状态日程状态 1 未完成 2完成 3进行中
     */
    private Integer state;
    /**
     * 员工姓名
     */
    private String empname;

}
