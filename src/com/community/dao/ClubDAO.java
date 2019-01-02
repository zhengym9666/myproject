package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.Club;

/**
 * 
 * @author zym
 *
 * 2018年12月27日
 */

public interface ClubDAO {
//	根据学院id获取社团列表
	public List<Club> queryClubBycollegeId(@Param("collegeId")String collegeId);
	
}
