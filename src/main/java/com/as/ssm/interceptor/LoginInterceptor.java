package com.as.ssm.interceptor;

import com.as.ssm.domain.Employee;
import com.as.ssm.domain.Menu;
import com.as.ssm.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登录拦截器
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/14
 **/

public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    private MenuService menuService;
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
            //得到当前登录的用户id
           Employee employee=(Employee) session.getAttribute("loginEmp");
            //得到给请求的地址
            String url=request.getRequestURI();
            System.out.println("用户请求的地址:"+url);
            //得到当前用户所有的地址
            List<Menu> listMenu=this.menuService.getByEmpId(employee.getEmpid());
            int f=-1;
            for(Menu menu:listMenu)
            {
                //判断当址地中否包含url
                if(!menu.getUrl().equals("") && url.contains(menu.getUrl()))
                {
                    f=1;
                    break;
                }

            }

            if(f!=-1)
            {
                return true;//放行
            }
            else
            {
                //转发
                request.getRequestDispatcher(request.getContextPath()+"/WEB-INF/jsp/no.jsp").forward(request,response);
                return  false;//拦截
            }


            //

        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
