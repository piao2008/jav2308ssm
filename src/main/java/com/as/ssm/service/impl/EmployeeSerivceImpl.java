package com.as.ssm.service.impl;

import com.as.ssm.dao.EmployeeMapper;
import com.as.ssm.domain.Employee;
import com.as.ssm.service.EmployeeSerivce;
import com.as.ssm.util.Common;
import com.as.ssm.util.Pages;
import com.as.ssm.util.UploadFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 员工管理业务层接口实现类
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/1
 **/

@Service
public class EmployeeSerivceImpl implements EmployeeSerivce {

    @Autowired
    private EmployeeMapper employeeMapper;


    @Override
    public void append(MultipartFile file, Employee employee,HttpServletRequest request) {
        //调用文件上传文件,得到上传后的文件名
        String fileName= UploadFile.fileUp(file,request);
        //赋给picture属性
        employee.setPicture(fileName);
        this.employeeMapper.insert(employee);
    }

    @Override
    public void modifyById(MultipartFile file, Employee employee, HttpServletRequest request) {
        //调用文件上传文件,得到上传后的文件名
        String fileName= UploadFile.fileUp(file,request);
        //赋给picture属性
        employee.setPicture(fileName);
        this.employeeMapper.updateById(employee);
    }

    @Override
    public void removeById(Integer empid) {
        this.employeeMapper.deleteById(empid);
    }

    @Override
    public void removeByIds(Integer[] empids) {
        this.employeeMapper.deleteByIds(empids);
    }

    @Override
    public Employee getById(Integer empid) {
        return this.employeeMapper.selectById(empid);
    }

    @Override
    public Pages<Employee> list(Integer currPage, Employee employee) {

        return new Pages<>(
                currPage,
                Common.PAGESIZE,
                this.employeeMapper.getRowCount(employee),
                this.employeeMapper.select(employee,(currPage-1)*Common.PAGESIZE,Common.PAGESIZE)
                );
    }

    @Override
    public Employee login(Employee employee) {
        Employee emp=this.employeeMapper.login(employee);
        if(emp==null)
        {
            emp=new Employee();
            emp.setState(3);//帐号或密码不对
        }

        return emp;//1--正常 2-加锁 4,验证码不对
    }

    @Override
    public List<Employee> selectByPosition(Integer positionId) {
        Employee employee=new Employee();
        employee.setPositionid(positionId);
        return this.employeeMapper.select(employee,-1,1);
    }
}
