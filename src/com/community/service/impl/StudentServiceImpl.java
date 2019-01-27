package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Student;
import com.community.dao.StudentDAO;
import com.community.service.interfaces.IStudentService;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����12:09:33
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
