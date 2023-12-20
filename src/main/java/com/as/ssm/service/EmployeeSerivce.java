package com.as.ssm.service;

import com.as.ssm.domain.Employee;
import com.as.ssm.util.Pages;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 员工管理业务层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/1
 **/

public interface EmployeeSerivce {

    /**
     * 添加
     * @param file
     * @param employee
     * @param request
     */
    public void append(MultipartFile file, Employee employee, HttpServletRequest request);

    /**
     * 主键修改
     * @param employee
     */
    public void modifyById(MultipartFile file, Employee employee, HttpServletRequest request);

    /**
     * 主键删除
     * @param empid
     */
    public void removeById(Integer empid);

    /**
     * 主键批量删除
     * @param empids
     */
    public void removeByIds(Integer[] empids);

    /**
     * 主键查询
     * @param empid
     * @return
     */
    public Employee getById(Integer empid);


    /**
     * 分页信息
     * @param currPage
     * @param employee
     * @return
     */
    public Pages<Employee> list(Integer currPage,Employee employee);

    /**
     * 用户登录
     * @param employee
     * @return
     */
    public  Employee login(Employee employee);

    /**
     * 查询职位为经理
     * @param positionId
     * @return
     */
    public  List<Employee> selectByPosition(Integer positionId);

}
