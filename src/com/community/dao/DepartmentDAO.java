package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.Department;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����10:29:30
* @version 1.0 
* @desrciption		
*/
public interface DepartmentDAO {
	public Department queryDepartmentById(@Param("departmentId")String departmentId);
}
