package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.community.dao.TaskDAO;
import com.community.service.interfaces.ITaskService;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��2��9�� ����12:09:25
* @version 1.0 
* @desrciption		
*/
public class TaskServiceImpl implements ITaskService {
	
	@Autowired
	TaskDAO TaskMapper;

	@Override
	public String getTaskId(String inst_id) {
		// TODO Auto-generated method stub
		return TaskMapper.getTaskId(inst_id);
	}

}
