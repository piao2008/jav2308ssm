package com.as.ssm.service;

import com.as.ssm.domain.UsersMenu;

import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/13
 **/

public interface UsersMenuService {


    /**
     * 分配权限
     * @param empid
     * @param menuid
     */
    public void modifyById(Integer empid,Integer[] menuids);

    /**
     * 查询要分配权限的用户当前具有的权限实现默认选中
     * @param empId
     * @return
     */
    public List<UsersMenu> getByEmpId(Integer empId);
}
