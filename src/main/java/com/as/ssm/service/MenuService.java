package com.as.ssm.service;

import com.as.ssm.domain.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/12
 **/

public interface MenuService {

    /**
     * 查询用户的权限菜单
     * @param parentid
     * @return
     */
    public List<Menu> selectByParentId(Integer parentid);


    /**
     * 查询所有菜单
     * @param parentId
     * @return
     */
    public List<Menu> list(Integer parentId);


}
