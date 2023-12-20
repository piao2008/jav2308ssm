package com.as.ssm.controller;

import com.as.ssm.domain.DepartInfo;
import com.as.ssm.service.DepartInfoService;
import com.as.ssm.util.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 部门的控制层
 * 控制层依赖于业务层
 * 描述：
 * 创建人：飘
 * 创建时间：2023/11/29
 **/

@Controller
//@Controller 注解:纳入容器管理bean(由spring容器帮我们自动创建DepartInfoController类型的对象(bean))
@RequestMapping("/departinfo")
public class DepartInfoController {

    //依赖注入
    @Autowired
    private DepartInfoService departInfoService;

    //get/post请求
    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "currPage",required=true,defaultValue = "1") Integer currPage,DepartInfo departInfo)
    {
        ModelAndView mv=new ModelAndView("depart/list");

        Pages<DepartInfo> pages=departInfoService.list(currPage,departInfo);
        mv.addObject("departInfo", departInfo);
        mv.addObject("pages", pages);
        //转发
        return  mv;
    }
    //get请求
    @GetMapping("/removebyid")
    public  ModelAndView removeById(Integer departId)
    {
        //页面重定向
        ModelAndView mv=new ModelAndView("redirect:/departinfo/list");
        this.departInfoService.removeById(departId);
        return mv;
    }

    @GetMapping("/removebyids")
    public  ModelAndView removeByIds(Integer[] departIds)
    {
        //页面重定向
        ModelAndView mv=new ModelAndView("redirect:/departinfo/list");
        this.departInfoService.removeByIds(departIds);
        return mv;
    }

    //get请求
    @GetMapping("/edit")
    public  ModelAndView edit(Integer departId)
    {
        ModelAndView mv=new ModelAndView("depart/edit");
        mv.addObject("departInfo", this.departInfoService.getById(departId));
        return mv;
    }

    //get
    //post

    @PostMapping("/modifybyid")
    public  ModelAndView modifyById(DepartInfo departInfo)
    {
        //页面重定向
        ModelAndView mv=new ModelAndView("redirect:/departinfo/list");
        this.departInfoService.modifyById(departInfo);
        return mv;
    }


    //显示添加页面
    @GetMapping("/append")
    public  ModelAndView append()
    {

        ModelAndView mv=new ModelAndView("depart/append");
        return mv;
    }
    //处理添加
    @PostMapping("/append")
    public  ModelAndView append(DepartInfo departInfo)
    {

        //页面重定向
        ModelAndView mv=new ModelAndView("redirect:/departinfo/list");
        //调用方法
        this.departInfoService.append(departInfo);
        return mv;
    }

}
