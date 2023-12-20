package com.as.ssm.service.impl;

import com.as.ssm.dao.NewsTypeMapper;
import com.as.ssm.domain.NewsType;
import com.as.ssm.service.NewsTypeService;
import com.as.ssm.util.Common;
import com.as.ssm.util.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 新闻类别业务层接口实现
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/
@Service
public class NewsTypeServiceImpl implements NewsTypeService {
    @Autowired
    private NewsTypeMapper newsTypeMapper;

    @Override
    public void append(NewsType newsType) {
        this.newsTypeMapper.insert(newsType);
    }

    @Override
    public void modifyById(NewsType newsType) {
        this.newsTypeMapper.updateById(newsType);
    }

    @Override
    public void removeById(Integer newsTypeId) {
        this.newsTypeMapper.deleteById(newsTypeId);
    }

    @Override
    public NewsType getById(Integer newsTypeId) {
        return this.newsTypeMapper.selectById(newsTypeId);
    }

    @Override
    public Pages<NewsType> list(Integer currPage, NewsType newsType) {
//        List<News> list = this.newsTypeMapper.select(newsType, (currPage - 1) * Common.PAGESIZE, Common.PAGESIZE);
//        int rowCount = this.newsTypeMapper.getRowCount(newsType);
//        return new Pages<>(currPage, Common.PAGESIZE, rowCount, list);
        return  new Pages<>(
                currPage,
                Common.PAGESIZE,
                this.newsTypeMapper.getRowCount(newsType),
                this.newsTypeMapper.select(newsType, (currPage - 1) * Common.PAGESIZE, Common.PAGESIZE)
        );
    }
}
