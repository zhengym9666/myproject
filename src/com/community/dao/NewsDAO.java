package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.News;

/**
 * 
 * @author zym
 *
 * 2018年12月24日
 */
public interface NewsDAO {
//	根据新闻id获取新闻信息
	public News queryNewsById(@Param("id")int id);
	
//	分页获取新闻信息
	public List<News> queryPageNews(@Param("collegeId")String collegeId,@Param("clubId")String clubId,@Param("start")int start,@Param("size")int size);
	
//	获取新闻总记录数
	public int queryTotalCount(@Param("collegeId")String collegeId,@Param("clubId")String clubId);
}
