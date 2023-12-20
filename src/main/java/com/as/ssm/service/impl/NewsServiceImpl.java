package com.as.ssm.service.impl;

import com.as.ssm.dao.NewsMapper;
import com.as.ssm.domain.Employee;
import com.as.ssm.domain.News;
import com.as.ssm.service.NewsService;
import com.as.ssm.util.Common;
import com.as.ssm.util.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 新闻业务层实现
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 **/
//IOC
@Service
public class NewsServiceImpl implements NewsService {
    //DI
    @Autowired
    private NewsMapper newsMapper;
    @Autowired
    private HttpSession session;
    @Autowired
    private HttpServletRequest request;

    @Override
    public void append(News news) {

        System.out.println(request.getRequestURL());
        //HttpSession session=request.getSession();
        //得到当前登录的信息(员工)
        Employee emp=(Employee)session.getAttribute("loginEmp");
        news.setEmpid(emp.getEmpid());
        this.newsMapper.insert(news);
    }

    @Override
    public void modifyById(News news) {
        this.newsMapper.updateById(news);
    }

    @Override
    public void removeById(Integer newsId) {
        this.newsMapper.deleteById(newsId);
    }

    @Override
    public void removeByIds(Integer[] newsIds){
        this.newsMapper.deleteByIds(newsIds);
    }

    @Override
    public News getById(Integer newsId) {
        return this.newsMapper.selectById(newsId);
    }

    @Override
    public Pages<News> list(Integer currPage, News news) {

        List<News> list = this.newsMapper.select(news,(currPage - 1) * Common.PAGESIZE, Common.PAGESIZE);
        int rowCount = this.newsMapper.getRowCount(news);
        return new Pages<>(currPage, Common.PAGESIZE, rowCount, list);
    }

    @Override
    public void updateState(Integer newsId,Integer state) {
    this.newsMapper.updateState(newsId,state);
    }
}
