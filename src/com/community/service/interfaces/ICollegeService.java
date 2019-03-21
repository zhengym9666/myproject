package com.community.service.interfaces;

import java.util.List;

import com.community.bean.College;

/**
 * 
 * @author zym
 *
 * 2018年12月28日
 */

public interface ICollegeService {
	public College queryCollegeById(String collegeId);
	
	public List<College> queryAllCollege();
}
