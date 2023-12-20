package com.as.ssm.service;

import com.as.ssm.domain.Schedule;
import com.as.ssm.util.Pages;

import java.util.List;

/**
 * 日程的业务层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/8
 **/

public interface ScheduleService {

    /**
     * 添加
     * @param schedule
     */
    public  void append(Schedule schedule);

    /**
     * 修改
     * @param schedule
     */
    public  void modifyById(Schedule schedule);

    /**
     * 主键删除
     * @param scheduleId
     */
    public  void removeById(Integer scheduleId);


    /**
     * 主键查询
     * @param scheduleId
     * @return
     */
    public  Schedule getById(Integer scheduleId);

    /**
     * 查询分页
     *
     * @param skip
     * @param take
     * @param schedule
     * @return
     */
    public List<Schedule> list(Schedule schedule);

}
