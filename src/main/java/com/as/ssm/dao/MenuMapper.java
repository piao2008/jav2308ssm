package com.as.ssm.dao;

import com.as.ssm.domain.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/12
 **/

public interface MenuMapper {

    /**
     * 查询当前用户的权限菜单
     * @param empid
     * @param parentid
     * @return
     */
    public List<Menu> selectByParentId(@Param("mid") Integer empid, @Param("parentid") Integer parentid);


    /**
     * 查询所有菜单
     * @param parentid
     * @return
     */
    public List<Menu> select(Integer parentid);

    /**
     * 查询当前登录用户的所有菜单,用于权限判断
     * @param empId
     * @return
     */
    public List<Menu> selectByEmpId(Integer empId);
}
