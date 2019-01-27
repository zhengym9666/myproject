package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Department;
import com.community.dao.DepartmentDAO;
import com.community.service.interfaces.IDepartmentService;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����10:48:36
* @version 1.0 
* @desrciption		
*/
@Service("departmentService")
public class DepartmentServiceImpl implements IDepartmentService {
	
	@Autowired
	DepartmentDAO departmentMapper;
	
	@Override
	public Department queryDepartmentById(String departmentId) {
		// TODO Auto-generated method stub
		return departmentMapper.queryDepartmentById(departmentId);
	}

}
