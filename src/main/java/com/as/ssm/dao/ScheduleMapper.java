package com.as.ssm.dao;

import com.as.ssm.domain.Schedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 日程的数据访问层接口
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/8
 **/

public interface ScheduleMapper {

    /**
     * 添加
     * @param schedule
     */
    public  void insert(Schedule schedule);

    /**
     * 修改
     * @param schedule
     */
    public  void updateById(Schedule schedule);

    /**
     * 主键删除
     * @param scheduleId
     */
    public  void deleteById(Integer scheduleId);


    /**
     * 主键查询
     * @param scheduleId
     * @return
     */
    public  Schedule selectById(Integer scheduleId);

    /**
     * 查询分页
     * @param schedule
     * @param skip
     * @param take
     * @return
     */
    public List<Schedule> select(@Param("schedule") Schedule schedule);



}
