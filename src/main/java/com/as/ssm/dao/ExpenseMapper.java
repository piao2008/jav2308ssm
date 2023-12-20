package com.as.ssm.dao;

import com.as.ssm.domain.Expense;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 报销主表数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/14
 **/

public interface ExpenseMapper {

    /**
     * 添加
     * @param expense
     */
    public  void insert(Expense expense);

    /**
     * 条件查询
     * @param expense
     * @param skip
     * @param take
     * @return
     */
    public List<Expense> select(@Param("expense") Expense expense,@Param("skip") Integer skip,@Param("take") Integer take);

    /**
     * 记录条数
     * @param expense
     * @return
     */
    public  int getRowCount(@Param("expense") Expense expense);

    /**
     * 主键删除
     * @param expenseid
     */
    public  void deleteById(Integer expenseid);

    /**
     * 修改
     * @param state
     * @param expenseid
     */
    public  void updateById(Expense expense);
}
