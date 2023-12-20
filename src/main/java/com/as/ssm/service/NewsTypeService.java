package com.as.ssm.service;

import com.as.ssm.domain.NewsType;
import com.as.ssm.util.Pages;

/**
 * 新闻类别业务层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/

public interface NewsTypeService {

    /**
     * 添加
     * @param news
     */
    public  void append(NewsType newsType);

    /**
     * 主键修改
     * @param news
     */
    public  void modifyById(NewsType newsType);

    /**
     * 主键删除
     * @param newsId
     */
    public  void removeById(Integer newsTypeId);

    /**
     * 主键查询
     *
     * @param newsId
     * @return
     */
    public  NewsType getById(Integer newsTypeId);


    /**
     * 分页信息
     * @param currPage
     * @param newsType
     * @return
     */
    public Pages<NewsType> list(Integer currPage,NewsType newsType);





}
