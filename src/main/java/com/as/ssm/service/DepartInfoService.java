package com.as.ssm.service;

import com.as.ssm.domain.DepartInfo;
import com.as.ssm.util.Pages;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 描述：部门的业务层接口
 * 创建人：飘
 * 创建时间：2023/11/29
 **/

public interface DepartInfoService {

    /**
     * 分页信息
     * @param currPage
     * @param departInfo
     * @return
     */
    public Pages<DepartInfo> list(Integer currPage, DepartInfo departInfo);



    /**
     * 主键删除
     * @param departid
     */
    public void removeById(Integer departId);

    /**
     * 批量删除
     * @param departids
     */
    public void removeByIds(Integer[] departIds);


    /**
     * 添加
     * @param departInfo
     */
    public void append(DepartInfo departInfo);

    /**
     * 主键修改
     * @param departInfo
     */
    public void modifyById(DepartInfo departInfo);


    /**
     * 主键查询
     * @param departId
     * @return
     */
    public DepartInfo getById(Integer departId);
}
