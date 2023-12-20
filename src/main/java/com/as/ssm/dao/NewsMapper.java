package com.as.ssm.dao;

import com.as.ssm.domain.News;
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 新闻数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/

public interface NewsMapper {

    /**
     * 添加
     * @param news
     */
    public  void insert(News news);

    /**
     * 主键修改
     * @param news
     */
    public  void updateById(News news);

    /**
     * 主键删除
     * @param newsId
     */
    public  void deleteById(Integer newsId);

    /**
     * 主键批量删除
     * @param newsIds
     */
    public  void deleteByIds(Integer[] newsIds);
    /**
     *主键查询
     * @param newsId
     * @return
     */
    public  News selectById(Integer newsId);

    /**
     * 分页查询
     * @param news
     * @param skip
     * @param take
     * @return
     */
    public List<News> select(@Param("news") News news,@Param("skip") Integer skip,@Param("take") Integer take);

    /**
     * 得到记录条数
     * @param news
     * @return
     */
    public int getRowCount(@Param("news") News news);

    /**
     * 状态修改
     * @param newsId
     * @param state
     */
    public  void updateState(@Param("id") Integer newsId,@Param("st") Integer state);


}
