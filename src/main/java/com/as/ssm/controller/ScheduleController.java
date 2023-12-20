package com.as.ssm.controller;

import com.as.ssm.domain.Schedule;
import com.as.ssm.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/8
 **/

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
    @Autowired
    private ScheduleService scheduleService;


    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "currPage",required = true,defaultValue = "1") Integer currPage,Schedule schedule)
    {
        ModelAndView mv=new ModelAndView("schedule/list");
       // mv.addObject("pages", this.scheduleService.list(currPage, schedule));
        mv.addObject("schedule", schedule);
        return  mv;
    }

    //ajax方法
    @ResponseBody
    @GetMapping("/getschedulelist")
    public List<Schedule> getScheduleList(Schedule schedule)
    {
        return this.scheduleService.list(schedule);
    }

    @GetMapping("/append")
    public ModelAndView append()
    {
        ModelAndView mv=new ModelAndView("schedule/append");
        return  mv;
    }

    @PostMapping("/append")
    public ModelAndView append(Schedule schedule)
    {
        ModelAndView mv=new ModelAndView("redirect:/schedule/list");
        this.scheduleService.append(schedule);
        return  mv;
    }

    @GetMapping("/edit")
    public ModelAndView getById(Integer scheduleId)
    {
        ModelAndView mv=new ModelAndView("schedule/detail");
        mv.addObject("schedule", this.scheduleService.getById(scheduleId));
        return  mv;
    }

    @PostMapping("/modifybyid")
    public ModelAndView modifyById(Schedule schedule)
    {
        ModelAndView mv=new ModelAndView("redirect:/schedule/list");
        this.scheduleService.modifyById(schedule);
        return  mv;
    }
    @GetMapping("/removebyid")
    public ModelAndView removeById(Integer scheduleId)
    {
        ModelAndView mv=new ModelAndView("redirect:/schedule/list");
        this.scheduleService.removeById(scheduleId);
        return  mv;
    }


}
