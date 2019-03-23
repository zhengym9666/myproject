package com.community.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.FeeBudgetLog;
import com.community.dao.FeeBudgetLogDAO;
import com.community.service.interfaces.IFeeBudgetLogService;


/** 
* @author  作者 :zhengym
* @date 创建时间：2019年3月16日 下午5:00:42
* @version 1.0 
* @desrciption		
*/
@Service("feeBudgetLogService")
public class FeeBudgetLogServiceImpl implements IFeeBudgetLogService {
	
	@Autowired
	FeeBudgetLogDAO feeBudgetLogMapper;

	@Override
	public void addBudgetLog(FeeBudgetLog logInfo) {
		// TODO Auto-generated method stub
		feeBudgetLogMapper.addBudgetLog(logInfo);
	}

}
