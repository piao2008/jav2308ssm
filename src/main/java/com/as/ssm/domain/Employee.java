package com.as.ssm.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * 员工表的实体类
 * @author user
 *
 */
@Data
public class Employee {

	/**
	 * 员工id
	 */
	private Integer empid;
	
	/**
	 * 添加时间
	 */
	private String addtime;
	private String empname;
	private String gender;
	private String password;
	private Integer positionid;
	private String loginname;
	private String hiredate;
	private Integer departid;
	private String mobile;
	private String tel;
	private String familytel;
	private String birthday;
	private String address;
	private String picture;
	private String remark;
	private Integer state;
	
	/**
	 * 部门名称
	 */
	private String departname;

	/**
	 * 职位名称
	 */
	private String positionname;


}
