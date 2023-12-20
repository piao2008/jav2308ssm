package com.as.ssm.dao;

import com.as.ssm.domain.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 职员的数据访问层接口
 * @author user
 *
 */
public interface EmployeeMapper {

	/**
	 * 添加
	 * @param employee
	 */
	public void insert(Employee employee);
	
	/**
	 * 主键修改
	 * @param employee
	 */
	public void updateById(Employee employee);
	
	/**
	 * 主键删除
	 * @param empid
	 */
	public void deleteById(Integer empid);
	
	/**
	 * 主键批量删除
	 * @param empids
	 */
	public void deleteByIds(Integer[] empids);

	/**
	 * 主键查询
	 * @param empid
	 * @return
	 */
	public Employee selectById(Integer empid);

	/**
	 * 条件查询,分页
	 * @param employee
	 * @param skip
	 * @param take
	 * @return
	 */
	public List<Employee> select(@Param("employee") Employee employee,@Param("skip") Integer skip,@Param("take") Integer take);

	/**
	 * 记录条数
	 * @param employee
	 * @return
	 */
	public  int getRowCount(@Param("employee") Employee employee);

	/**
	 * 用户登录
	 * @param employee
	 * @return
	 */
	public  Employee login(Employee employee);

	public  Employee login2(@Param("name") String loginname,@Param("pwd") String password);
}
