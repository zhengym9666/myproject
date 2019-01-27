package com.community.service.interfaces;

import com.community.bean.Student;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 下午12:08:17
* @version 1.0 
* @desrciption		
*/
public interface IStudentService {
	//根据学号获取学生信息
	public Student getStudentInfoById(String stuNum);
	
	//根据社团id获取会长信息
	public Student getGeneralInfoByClubId(String clubId);
}
