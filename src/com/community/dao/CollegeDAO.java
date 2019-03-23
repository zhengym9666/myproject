package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.College;

/**
 * 
 * @author zym
 *
 */

public interface CollegeDAO {
	public College queryCollegeById(@Param("id")String collegeId);
	
	public List<College> queryAllCollege();
}
