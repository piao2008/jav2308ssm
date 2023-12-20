package com.as.ssm.domain;

import lombok.Data;

/**
 * 报销明细实体类
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/14
 **/
@Data
public class ExpenseDetail {
    private Integer id;
    private String addtime;
    private Integer expenseid;
    private Integer extypeid;
    private Integer money;
    private String costdesc;

    /**
     * 报销类别名称
     */
    private  String extypename;

}
