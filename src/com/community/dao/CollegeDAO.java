package com.community.dao;

import org.apache.ibatis.annotations.Param;

import com.community.bean.College;

/**
 * 
 * @author zym
 *
 * 2018��12��28��
 */

public interface CollegeDAO {
	public College queryCollegeById(@Param("id")String collegeId);
}
