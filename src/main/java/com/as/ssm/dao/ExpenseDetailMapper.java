package com.as.ssm.dao;

import com.as.ssm.domain.ExpenseDetail;

import javax.swing.border.CompoundBorder;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/14
 **/

public interface ExpenseDetailMapper {

    /**
     * 批量添加
     * @param expenseDetails
     */
    public  void inserts(List<ExpenseDetail> expenseDetails);

    /**
     * 按销主表id删除明细
     * @param expenseid
     */
    public  void deleteByExpenseId(Integer expenseid);

    /**
     * 按报销主表id查询明细
     * @param expenseid
     * @return
     */
    public  List<ExpenseDetail> selectByExpenseId(Integer expenseid);

    /**
     * 主键删除
     * @param id
     */
    public  void deleteById(Integer id);
}
