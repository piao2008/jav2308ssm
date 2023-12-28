package com.as.ssm.interceptor;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/14
 **/

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //得到session
        HttpSession session= request.getSession();
        if(session.getAttribute("loginEmp")==null)
        {
            String url=request.getRequestURI();
            System.out.println(url);
            //页面重定向
            response.sendRedirect(request.getContextPath()+"/employee/login");
            return  false;//拦截
        }
        else
        {
            //
            String url=request.getRequestURI();
            System.out.println("用户请求的地址:"+url);
            //
            return true;//放行
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
