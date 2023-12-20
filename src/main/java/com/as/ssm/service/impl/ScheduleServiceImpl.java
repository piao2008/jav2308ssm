package com.as.ssm.service.impl;

import com.as.ssm.dao.ScheduleMapper;
import com.as.ssm.domain.Employee;
import com.as.ssm.domain.Schedule;
import com.as.ssm.service.ScheduleService;
import com.as.ssm.util.Common;
import com.as.ssm.util.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/8
 **/

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Autowired
    private HttpSession session;
    @Override
    public void append(Schedule schedule) {
        Employee emp=(Employee)session.getAttribute("loginEmp");
        schedule.setEmpid(emp.getEmpid());
        this.scheduleMapper.insert(schedule);
    }

    @Override
    public void modifyById(Schedule schedule) {
        Employee emp=(Employee)session.getAttribute("loginEmp");
        schedule.setEmpid(emp.getEmpid());
        this.scheduleMapper.updateById(schedule);
    }

    @Override
    public void removeById(Integer scheduleId) {
        this.scheduleMapper.deleteById(scheduleId);
    }

    @Override
    public Schedule getById(Integer scheduleId) {
        return this.scheduleMapper.selectById(scheduleId);
    }

    @Override
    public List<Schedule> list(Schedule schedule) {

        Employee emp=(Employee)session.getAttribute("loginEmp");
        schedule.setEmpid(emp.getEmpid());
        return this.scheduleMapper.select(schedule);
    }
}
