package com.as.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/11/28
 **/

@Controller
@RequestMapping("/test")
public class TestController {


    //ajax
    @ResponseBody
    @RequestMapping("/test")
    public String test()
    {
        return "ok";
    }

    @RequestMapping("/index")
    public ModelAndView index()
    {
        ModelAndView mv=new ModelAndView("index");
        return mv;
    }
}
