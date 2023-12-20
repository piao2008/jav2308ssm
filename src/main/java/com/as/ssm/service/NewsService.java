package com.as.ssm.service;

import com.as.ssm.domain.Menu;
import com.as.ssm.domain.News;
import com.as.ssm.util.Pages;

import java.util.List;

/**
 * 新闻业务层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/

public interface NewsService {
    /**
     * 添加
     *
     * @param news
     */
    public  void append(News news);

    /**
     * 主键修改
     * @param news
     */
    public  void modifyById(News news);

    /**
     * 主键删除
     * @param newsId
     */
    public  void removeById(Integer newsId);

    /**
     * 批量删除
     * @param newsIds
     */
    public  void removeByIds(Integer[] newsIds);
    /**
     *主键查询
     * @param newsId
     * @return
     */
    public  News getById(Integer newsId);

    /**
     * 分页信息
     * @param currPage 当前页
     * @param news 查询条件
     * @return
     */
    public Pages<News> list(Integer currPage, News news);


    /**
     * 状态修改
     * @param newsId
     * @param state
     */
    public  void updateState(Integer newsId,Integer state);


}
