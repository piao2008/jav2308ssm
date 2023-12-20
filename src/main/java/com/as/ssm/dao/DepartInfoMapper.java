package com.as.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.as.ssm.domain.DepartInfo;

/**
 * 部门的数据访问层接口
 * @author user
 *
 */
public interface DepartInfoMapper {

	/**
	 * 查询分页
	 * @param departInfo
	 * @param skip
	 * @param take
	 * @return
	 */
	public List<DepartInfo> select(@Param("departInfo")DepartInfo departInfo,@Param("skip")Integer skip,@Param("take")Integer take);
	
	/**
	 * 记录条数
	 * @return
	 */
	public int getRowCount(@Param("departInfo")DepartInfo departInfo);
	
	/**
	 * 主键删除
	 * @param departid
	 */
	public void deleteById(Integer departId);
	
	/**
	 * 批量删除
	 * @param departids
	 */
	public void deleteByIds(Integer[] departIds);
	
	
	/**
	 * 添加
	 * @param departInfo
	 */
	public void insert(DepartInfo departInfo);
	
	/**
	 * 主键修改
	 * @param departInfo
	 */
	public void updateById(DepartInfo departInfo);
	
	/**
	 * 主键修改
	 * @param departid
	 * @return
	 */
	public DepartInfo selectById(Integer departId);
	
	
	
	
}
