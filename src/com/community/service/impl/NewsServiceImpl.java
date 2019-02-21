package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.News;
import com.community.dao.NewsDAO;
import com.community.service.interfaces.INewsService;
import com.community.util.PageBean;

/**
 * 
 * @author zym
 *
 * 2018年12月24日
 */
@Service("newsService")
public class NewsServiceImpl implements INewsService {
	
	@Autowired
	private NewsDAO newsMapper;
	
	@Override
	public News queryNewsById(int id) {
		// TODO Auto-generated method stub
		return newsMapper.queryNewsById(id);
	}
	
	@Override
	public PageBean queryPageNews(String collegeId,String clubId,int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		PageBean pageBean = new PageBean();
		int start = (currentPage-1)*pageSize;
		int size = pageSize;
		pageBean.setData(newsMapper.queryPageNews(collegeId,clubId,start, size));
		pageBean.setCurrentPage(currentPage);
		
//		总记录数
		pageBean.setTotalCount(queryTotalCount(collegeId,clubId));
//		每页显示记录数
		pageBean.setPageSize(pageSize);
		
//		首页    
		pageBean.setFirstPage(1);
		
		return pageBean;
	}

	@Override
	public int queryTotalCount(String collegeId, String clubId) {
		// TODO Auto-generated method stub
		return newsMapper.queryTotalCount(collegeId, clubId);
	}
}
