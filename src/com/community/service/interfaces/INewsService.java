package com.community.service.interfaces;

import com.community.bean.News;
import com.community.util.PageBean;
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
}
