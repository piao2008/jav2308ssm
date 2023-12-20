package com.as.ssm.dao;

import com.as.ssm.domain.News;
import com.as.ssm.domain.NewsType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 新闻数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/

public interface NewsTypeMapper {

    /**
     * 添加
     * @param news
     */
    public  void insert(NewsType newsType);

    /**
     * 主键修改
     * @param news
     */
    public  void updateById(NewsType newsType);

    /**
     * 主键删除
     * @param newsId
     */
    public  void deleteById(Integer newsTypeId);

    /**
     *主键查询
     * @param newsId
     * @return
     */
    public  NewsType selectById(Integer newsTypeId);

    /**
     * 分页查询
     * @param news
     * @param skip
     * @param take
     * @return
     */
    public List<NewsType> select(@Param("newsType") NewsType newsType,@Param("skip") Integer skip,@Param("take") Integer take);

    /**
     * 得到记录条数
     * @param news
     * @return
     */
    public int getRowCount(@Param("newsType") NewsType newsType);




}
