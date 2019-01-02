package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.College;
import com.community.dao.CollegeDAO;
import com.community.service.interfaces.ICollegeService;

@Service("collegeService")
public class CollegeServiceImpl implements ICollegeService {
	
	@Autowired
	private CollegeDAO collegeMapper;
	
	@Override
	public College queryCollegeById(String collegeId) {
		// TODO Auto-generated method stub
		return collegeMapper.queryCollegeById(collegeId);
	}

}
