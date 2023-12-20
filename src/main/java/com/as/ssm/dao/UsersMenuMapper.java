package com.as.ssm.dao;

import com.as.ssm.domain.UsersMenu;

import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/13
 **/

public interface UsersMenuMapper {


    /**
     * 删除指定员工的权限
     * @param empid
     */
    public  void deleteByEmpid(Integer empid);


    /**
     * 批量添加员工的权限
     * @param list
     */
    public  void inserts(List<UsersMenu> list);

    /**
     * 查询要分配权限的用户当前具有的权限实现默认选中
     * @param empId
     * @return
     */
    public List<UsersMenu> selectByEmpId(Integer empId);

}
