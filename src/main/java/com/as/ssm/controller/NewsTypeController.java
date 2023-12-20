package com.as.ssm.controller;

import com.as.ssm.domain.News;
import com.as.ssm.domain.NewsType;
import com.as.ssm.service.NewsService;
import com.as.ssm.service.NewsTypeService;
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
 **/
@Controller
@RequestMapping("/newstype")
public class NewsTypeController {
    @Autowired
    private NewsTypeService newsTypeService;

    @GetMapping("/append")
    public ModelAndView append()
    {
        ModelAndView mv=new ModelAndView("newstype/append");

        return  mv;
    }


    @PostMapping("/append")
    public ModelAndView append(NewsType newsType)
    {
        ModelAndView mv=new ModelAndView("redirect:/newstype/list");
        this.newsTypeService.append(newsType);
        return  mv;
    }

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage,NewsType newsType)
    {
        ModelAndView mv=new ModelAndView("newstype/list");
        mv.addObject("pages", this.newsTypeService.list(currPage,newsType));
        mv.addObject("newstype", newsType);
        return  mv;
    }

    @GetMapping("/edit")
    public ModelAndView getById(Integer newsTypeId)
    {
        ModelAndView mv=new ModelAndView("newstype/edit");
        mv.addObject("newsType", this.newsTypeService.getById(newsTypeId));
        return  mv;
    }

    @PostMapping("/modifybyid")
    public ModelAndView modifyById(NewsType newsType)
    {
        ModelAndView mv=new ModelAndView("redirect:/newstype/list");
        this.newsTypeService.modifyById(newsType);
        return  mv;
    }

    @GetMapping("/removebyid")
    public ModelAndView removeById(Integer newsTypeId)
    {
        ModelAndView mv=new ModelAndView("redirect:/newstype/list");
        this.newsTypeService.removeById(newsTypeId);
        return  mv;
    }

}
