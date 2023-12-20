package com.as.ssm.service.impl;

import com.as.ssm.dao.DepartInfoMapper;
import com.as.ssm.domain.DepartInfo;
import com.as.ssm.service.DepartInfoService;
import com.as.ssm.util.Common;
import com.as.ssm.util.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**部门业务层实现类
 * 业务层依赖于数据访问层
 * 描述：
 * 创建人：飘
 * 创建时间：2023/11/29
 **/
@Service
//IOC(控制反转)
//@Service 注解:纳入容器管理bean(由spring容器帮我们自动创建DepartInfoServiceImpl类型的对象(bean))
public class DepartInfoServiceImpl implements DepartInfoService {
     //依赖注入(赋值:从spring容器中找查DepartInfoMapper类的bean,完成属性的赋值)
    //DI(依赖注入)
     @Autowired
    private DepartInfoMapper departInfoMapper;
    @Override
    public Pages<DepartInfo> list(Integer currPage, DepartInfo departInfo) {

//                            skip     take
//        select * from 表 limit (n-1)*5,5
        List<DepartInfo> list=this.departInfoMapper.select(departInfo, (currPage-1)* Common.PAGESIZE, Common.PAGESIZE);
        int rowCount = this.departInfoMapper.getRowCount(departInfo);
        Pages<DepartInfo> pages=new Pages<>(currPage, Common.PAGESIZE,rowCount,list );
        return pages;
    }

    @Override
    public void removeById(Integer departId) {
        this.departInfoMapper.deleteById(departId);
    }

    @Override
    public void removeByIds(Integer[] departIds) {
        this.departInfoMapper.deleteByIds(departIds);
    }

    @Override
    public void append(DepartInfo departInfo) {
        this.departInfoMapper.insert(departInfo);
    }

    @Override
    public void modifyById(DepartInfo departInfo) {

        this.departInfoMapper.updateById(departInfo);
    }

    @Override
    public DepartInfo getById(Integer departId) {
        return this.departInfoMapper.selectById(departId);
    }
}
