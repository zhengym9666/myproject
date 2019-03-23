package com.community.service.interfaces;

import com.community.bean.Student;
import com.community.bean.User;

import java.util.List;

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

	//根据学生名获取信息
	public Student getUserByName(String username);

    List<Student> getFriendList(String userGroupIopId);

    List<Student> getFriendListByStudentId(List<String> studentIds);

	//查询该系统所有学生,因为是管理员所以是所有人的好友
	public List<Student> getFriendListByAdmin();
	
	 public void saveStudentInfo(Student studentInfo);

}
