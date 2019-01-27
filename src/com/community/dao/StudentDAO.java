package com.community.dao;

import org.apache.ibatis.annotations.Param;

import com.community.bean.Student;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����12:04:23
* @version 1.0 
* @desrciption		
*/
public interface StudentDAO {
	public Student getStudentInfoById(@Param("stuNum")String stuNum);
	
	public Student getGeneralInfoByClubId(@Param("clubId")String clubId);
}
