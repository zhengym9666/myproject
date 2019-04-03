package com.community.service.interfaces;

import com.community.bean.News;
import com.community.util.PageBean;

import java.util.List;

/**
 * 
 * @author zym
 *
 * 2018年12月24日
 */

public interface INewsService {
	public News queryNewsById(int id);
	
	public PageBean queryPageNews(String collegeId,String clubId,int currentPage,int pageSize);
	
	public int queryTotalCount(String collegeId,String clubId);

    List<News> queryNewsImgRecently(String clubId);

	List<News> queryNewsRecently(String clubId);

    void updateReadcount(String key, Integer count);
}
