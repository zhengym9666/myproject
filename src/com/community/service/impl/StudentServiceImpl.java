package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Student;
import com.community.dao.StudentDAO;
import com.community.service.interfaces.IStudentService;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 下午12:09:33
* @version 1.0 
* @desrciption		
*/
@Service("studentService")
public class StudentServiceImpl implements IStudentService {
	
	@Autowired
	StudentDAO studentMapper;

	@Override
	public Student getStudentInfoById(String stuNum) {
		// TODO Auto-generated method stub
		return studentMapper.getStudentInfoById(stuNum);
	}

	@Override
	public Student getGeneralInfoByClubId(String clubId) {
		// TODO Auto-generated method stub
		return studentMapper.getGeneralInfoByClubId(clubId);
	}

	

}
