package com.as.ssm.domain;

import lombok.Data;

import java.util.List;

/**
 * 报销主表实体类
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/14
 **/

@Data
public class Expense {

    private Integer expenseid;
    private String addtime;
    private Integer empid;
    private Integer total;
    private String reason;
    /**
     * 审批人员工id
     */
    private Integer confirmperson;
    private Integer state;
    private Integer sugstate;
    private String suggestion;
    private String sugtime;

    /**
     * 报销管理查询开始时间
     */
    private String begintime;

    /**
     *  报销管理查询结束时间
     */
    private String endtime;

    /**
     * 审批管理查询开始时间
     */
    private String beginsugtime;

    /**
     * 审批管理查询结束时间
     */
    private String endsugtime;


    /**
     * 员工名称
     */
    private String empname;

    /**
     * 领导名称
     */
    private String leadername;
    /**
     * 部门名称
     */
    private String departname;

    /**
     * 职位名称
     */
    private  String positionname;

    /**
     * 1中添加多的集合属性
     *
     */
    private List<ExpenseDetail> list;

}
