package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.community.dao.TaskDAO;
import com.community.service.interfaces.ITaskService;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年2月9日 上午12:09:25
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
