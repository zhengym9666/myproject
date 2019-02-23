package com.community.dao;

import com.community.bean.User;
import org.apache.ibatis.annotations.Param;

import com.community.bean.Student;

import java.util.List;

/** 
* @author  作者 :zhengym
* @version 1.0
* @desrciption		
*/
public interface StudentDAO {
	public Student getStudentInfoById(@Param("stuNum")String stuNum);
	
	public Student getGeneralInfoByClubId(@Param("clubId")String clubId);

    Student getUserByName(String username);

    List<Student> getFriendList(String userGroupIopId);

    List<Student> getFriendListByStudentId(List<String> studentIds);

    List<Student> getFriendListByAdmin();

}
