package com.community.service.impl;

import com.community.bean.User;
import com.community.util.MybatisUtil;
import com.community.web.StudentAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Student;
import com.community.dao.StudentDAO;
import com.community.service.interfaces.IStudentService;

import java.util.ArrayList;
import java.util.List;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 下午12:09:33
* @version 1.0 
* @desrciption		
*/
@Service("studentService")
public class StudentServiceImpl extends AbsServiceImpl<StudentDAO> implements IStudentService {
	
	@Override
	public Student getStudentInfoById(String stuNum) {
		return mapper.getStudentInfoById(stuNum);
	}

	@Override
	public Student getGeneralInfoByClubId(String clubId) {
		return mapper.getGeneralInfoByClubId(clubId);
}

	@Override
	public Student getUserByName(String username) {
		return mapper.getUserByName(username);
	}

	@Override
	public List<Student> getFriendList(String collectionId) {
		return mapper.getFriendList(collectionId);
	}

	@Override
	public List<Student> getFriendListByStudentId(List<String> studentIds) {
		return mapper.getFriendListByStudentId(studentIds);
	}


	//查询该系统所有学生,因为是管理员所以是所有人的好友
	public List<Student> getFriendListByAdmin() {
		return mapper.getFriendListByAdmin();
	}

	public static void main(String[] args) throws Exception {
		MybatisUtil mybatisUtil=new MybatisUtil();
		StudentServiceImpl service = mybatisUtil.getMapperServiceImplObject(StudentDAO.class, StudentServiceImpl.class);
		List<String> students=new ArrayList<String>();
		students.add("123");
		students.add("124");
//		List<Student> friendListByStudentId = service.getFriendListByStudentId(students);
		List<Student> friendListByAdmin = service.getFriendListByAdmin();
		System.out.println(friendListByAdmin.size());
		Student adminStudent = service.getStudentInfoById(StudentAction.ADMIN_USER_ID);
		System.out.println(adminStudent);
		mybatisUtil.commit();
	}

	@Override
	public void saveStudentInfo(Student studentInfo) {
		// TODO Auto-generated method stub
		mapper.saveStudentInfo(studentInfo);
	}
}
