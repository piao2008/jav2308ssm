package com.as.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/20
 **/
@Controller
@RequestMapping("/cat")
public class CatController {

    public  void test()
    {
        System.out.println("cat..123");

        System.out.println("cat1..");
        System.out.println("cat2..");
        System.out.println("cat3..");
    }
}


