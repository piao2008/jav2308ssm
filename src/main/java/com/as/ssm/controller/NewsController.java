package com.as.ssm.controller;

import com.as.ssm.domain.News;
import com.as.ssm.domain.NewsType;
import com.as.ssm.service.NewsService;
import com.as.ssm.service.NewsTypeService;
import com.as.ssm.vo.VONews;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/5
 *
 *
 **/
@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private NewsTypeService newsTypeService;

    /**
     * 查询
     * @param currPage
     * @param news
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage, News news)
    {
        ModelAndView mv=new ModelAndView("news/list");
        if(news.getNewstypeid()==null) news.setNewstypeid(-1);
        if(news.getState()==null) news.setState(-1);

        mv.addObject("pages",this.newsService.list(currPage,news));
        mv.addObject("news", news);
        mv.addObject("listNewsType", this.newsTypeService.list(-1,new NewsType()).getList());
        return  mv;
    }

    /**
     * 主键删除
     * @param newsId
     * @return
     */
    @GetMapping("/removebyid")
    public ModelAndView removeById(Integer newsId,Integer flag)
    {
        //${pageContext.request.contextPath}/news/removebyid?newsId= 没有flag 对应news/list.jsp删除
        //${pageContext.request.contextPath}/news/removebyid?flag=1&newsId=" 对应employee/main.jsp删除

        ModelAndView mv=null;
        if (flag!=null && flag==1) {
             mv = new ModelAndView("redirect:/employee/main");
        }
        else
        {
            mv = new ModelAndView("redirect:/news/list");
        }
        this.newsService.removeById(newsId);
        return  mv;
    }

//    @GetMapping("/removebyid2")
//    public ModelAndView removeById2(Integer newsId)
//    {
//        ModelAndView mv=new ModelAndView("redirect:/employee/main");
//        this.newsService.removeById(newsId);
//        return  mv;
//    }
    /**
     * 主键批量删除
     * @param newsIds
     * @return
     */
    @GetMapping("/removebyids")
    public ModelAndView removeById(Integer[] newsIds)
    {
        ModelAndView mv=new ModelAndView("redirect:/news/list");
        this.newsService.removeByIds(newsIds);
        return  mv;
    }
    /**
     * 编辑
     * @param newsId
     * @return
     */
    @GetMapping("/edit")
    public ModelAndView getById(Integer newsId,Integer flag)
    {
        //${pageContext.request.contextPath}/news/edit?newsId= 没有flag 对应news/edit.jsp编辑
        //${pageContext.request.contextPath}/news/eidt?flag=1&newsId=" 对应employee/main.jsp编辑

        ModelAndView mv=new ModelAndView("news/edit");
        //链式写法
      mv.addObject("news", this.newsService.getById(newsId))
         .addObject("listNewsType", this.newsTypeService.list(-1,new NewsType()).getList())
              .addObject("flag",flag);
      return  mv;
    }

    /**
     * 修改
     * @param news
     * @return
     */
    @PostMapping("/modifybyid")
    public ModelAndView modifyById(VONews news)
    {
//         <input type="text" name="flag" value="${flag}"> flag值是否为空
        ModelAndView mv=null;
        if(news.getFlag()==null) {
            mv = new ModelAndView("redirect:/news/list");
        }
        else
        {
            mv = new ModelAndView("redirect:/employee/main");
        }
        this.newsService.modifyById(news);
        return  mv;
    }


    /**
     * 修改状态
     * @param newsId
     * @return
     */
    @GetMapping("/updatestate")
    public ModelAndView updateState(Integer newsId)
    {
        ModelAndView mv=new ModelAndView("redirect:/news/list");
        //已审核 1
        //未审核 0
       this.newsService.updateState(newsId,1);
        return  mv;
    }


    /**
     * 显示添加页面
     * @param newsId
     * @return
     */
    @GetMapping("/append")
    public ModelAndView append()
    {
        ModelAndView mv=new ModelAndView("news/append");
        mv.addObject("listNewsType", this.newsTypeService.list(-1,new NewsType()).getList());
        return  mv;
    }

    @PostMapping("/append")
    public ModelAndView append(News news, HttpServletRequest request)
    {
        ModelAndView mv=new ModelAndView("redirect:/news/list");
        this.newsService.append(news);
        return  mv;
    }
}
