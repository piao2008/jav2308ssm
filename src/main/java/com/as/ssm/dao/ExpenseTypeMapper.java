package com.as.ssm.dao;

import com.as.ssm.domain.ExpenseType;

import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/15
 **/

public interface ExpenseTypeMapper {

    public List<ExpenseType> select();
}
