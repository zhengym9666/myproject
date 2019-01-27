package com.community.dao;

import org.apache.ibatis.annotations.Param;

import com.community.bean.Student;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 下午12:04:23
* @version 1.0 
* @desrciption		
*/
public interface StudentDAO {
	public Student getStudentInfoById(@Param("stuNum")String stuNum);
	
	public Student getGeneralInfoByClubId(@Param("clubId")String clubId);
}
