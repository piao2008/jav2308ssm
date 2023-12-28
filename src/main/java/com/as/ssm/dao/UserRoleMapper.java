package com.as.ssm.dao;

import com.as.ssm.domain.UserRole;
import com.sun.javafx.tk.TKPulseListener;

import java.util.List;

/**
 * 用户角色表的数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/28
 **/

public interface UserRoleMapper {

    /**
     * 员工分配角色,实现默认选中
     * @param empId
     * @return
     */
    public List<UserRole> selectByEmpid(Integer empId);

    /**
     * 给用户批量添加角色
     * @param list
     */
    public  void inserts(List<UserRole> list);

    /**
     * 删除用户的角色
     * @param empId
     */
    public void deleteByEmpId(Integer empId);
}
