package com.as.ssm.controller;

import com.as.ssm.domain.DepartInfo;
import com.as.ssm.domain.Employee;
import com.as.ssm.domain.News;
import com.as.ssm.service.*;
import com.as.ssm.util.RandomValidateCode;
import com.as.ssm.vo.VOEmployee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/1
 **/

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeSerivce employeeSerivce;
    @Autowired
    private DepartInfoService departInfoService;
    @Autowired
    private PosService posService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private MenuService menuService;

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage, Employee employee,HttpServletRequest request)
    {

        //往后改成拦截器实现:功能
        ModelAndView mv =null;
        //得到session
        HttpSession session=request.getSession();

         mv = new ModelAndView("employee/list");
        mv.addObject("pages", this.employeeSerivce.list(currPage, employee));
        if (employee.getState() == null) employee.setState(-1);
        mv.addObject("employee", employee);
        mv.addObject("listDepart", this.departInfoService.list(-1, new DepartInfo()).getList());
        mv.addObject("listPos", this.posService.list());
        return mv;
    }

    @GetMapping("/append")
    public ModelAndView append()
    {
        ModelAndView mv=new ModelAndView("employee/append");
        mv.addObject("listDepart", this.departInfoService.list(-1,new DepartInfo()).getList());
        mv.addObject("listPos",this.posService.list());

        return mv;
    }

    @PostMapping("/append")
    public ModelAndView append(Employee employee, MultipartFile file, HttpServletRequest request)
    {
        ModelAndView mv=new ModelAndView("redirect:/employee/list");
        //添加
        this.employeeSerivce.append(file, employee, request);
        return mv;
    }

    @GetMapping("/test")
    public  ModelAndView test()
    {
        String name="admin";
        return  new ModelAndView("test");
    }
    @GetMapping("/removebyid")
    public  ModelAndView removeById(Integer empId)
    {
        ModelAndView mv=new ModelAndView("redirect:/employee/list");
        //
        this.employeeSerivce.removeById(empId);
        int t=100;
        t=2000;
        String pwd="ddd";
        return  mv;
    }
    @GetMapping("/removebyids")
    public  ModelAndView removeByIds(Integer[] empIds)
    {
        ModelAndView mv=new ModelAndView("redirect:/employee/list");
        this.employeeSerivce.removeByIds(empIds);
        return  mv;
    }

    @GetMapping("/edit")
    public ModelAndView getById(Integer empId)
    {

        ModelAndView mv=new ModelAndView("employee/edit");
        mv.addObject("employee", this.employeeSerivce.getById(empId));
        mv.addObject("listDepart", this.departInfoService.list(-1,new DepartInfo()).getList());
        mv.addObject("listPos",this.posService.list());
       //后-前ModelAndView Model request,map
        //前-后()
        return  mv;

    }

    @PostMapping("/modifybyid")
    public ModelAndView modifyById(Employee employee,MultipartFile file, HttpServletRequest request)
    {
        ModelAndView mv=new ModelAndView("redirect:/employee/list");
        this.employeeSerivce.modifyById(file, employee, request);
        return mv;
    }

    //用户登录页面
    @GetMapping("/login")
    public ModelAndView login()
    {
        ModelAndView mv=new ModelAndView("login");
        return  mv;
    }


    //登录处理
    @PostMapping("/login")
    public ModelAndView login(VOEmployee employee, HttpServletRequest request)
    {
        //设计模式
        //里氏替换原则
        //参数为父类类型,传参数能传上子类
        //参数为接口类型,传参数能传接口的实现类

        //登录成功
        //得到session
        HttpSession session=request.getSession();
        ModelAndView mv = null;
        Employee emp=null;
        //得到服务器产生的验证码
        String verCode2=session.getAttribute(RandomValidateCode.RANDOMCODEKEY).toString();
        //判断验证码是否相同.
        if(employee.getVerCode().equalsIgnoreCase(verCode2)) {
            //1--正常 2-加锁 4,验证码不对
            // ModelAndView mv=new ModelAndView("redirect:/employee/list");
            //ModelAndView mv=new ModelAndView("redirect:/employee/main");

           emp= this.employeeSerivce.login(employee);
            //判断
            if (emp.getState() == 1) {

                //session存登录用户信息
                session.setAttribute("loginEmp", emp);
                //存放用户登录成功后的权限信息
                session.setAttribute("menuList",this.menuService.selectByParentId(0));

              mv = new ModelAndView("redirect:/employee/main");


            } else {
                mv = new ModelAndView("redirect:/employee/login?msg=" + emp.getState());//2,3
            }
        }
        else
        {
            emp=new Employee();
            emp.setState(4);
            mv = new ModelAndView("redirect:/employee/login?msg=" + emp.getState());//4
        }

        return mv;
    }

    //登录退出
    @GetMapping("/exit")
    public ModelAndView exit(HttpServletRequest request)
    {
        HttpSession session=request.getSession();
        session.removeAttribute("loginEmp");
        ModelAndView mv=new ModelAndView("redirect:/employee/login");
        return  mv;
    }

    //主界面
    @GetMapping("/main")
    public ModelAndView main()
    {
        ModelAndView mv=new ModelAndView("main");
        //查询所有发布的闻新
        List<News> list=this.newsService.list(-1, new News()).getList();
        mv.addObject("list",list);
        return  mv;
    }


    //输出验证码图片
    @RequestMapping("/image")
    public void getCodeImage(HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("image/jpeg");//设置响应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
