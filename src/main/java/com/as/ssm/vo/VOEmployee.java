package com.as.ssm.vo;

import com.as.ssm.domain.Employee;
import lombok.Data;

/**
 * vo --View Object
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/2
 **/

@Data
public class VOEmployee extends Employee {
    private String verCode;
}
