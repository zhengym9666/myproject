package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Task;
import com.community.dao.TaskDAO;
import com.community.service.interfaces.ITaskService;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��2��9�� ����12:09:25
* @version 1.0 
* @desrciption		
*/

@Service("TaskService")
public class TaskServiceImpl implements ITaskService {
	
	@Autowired
	TaskDAO TaskMapper;

	@Override
	public String getTaskId(String taskId) {
		// TODO Auto-generated method stub
		return TaskMapper.getTaskId(taskId);
	}

}
