package com.community.service.impl;

import com.community.util.MybatisUtil;
import org.springframework.stereotype.Service;

import com.community.bean.News;
import com.community.dao.NewsDAO;
import com.community.service.interfaces.INewsService;
import com.community.util.PageBean;

import java.util.List;

/**
 * 
 * @author zym
 *
 * 2018年12月24日
 */
@Service("newsService")
public class NewsServiceImpl extends AbsServiceImpl<NewsDAO> implements INewsService {
	

	@Override
	public News queryNewsById(int id) {
		// TODO Auto-generated method stub
		return mapper.queryNewsById(id);
	}
	
	@Override
	public PageBean queryPageNews(String collegeId,String clubId,int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		PageBean pageBean = new PageBean();
		int start = (currentPage-1)*pageSize;
		int size = pageSize;
		pageBean.setData(mapper.queryPageNews(collegeId,clubId,start, size));
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
		return mapper.queryTotalCount(collegeId, clubId);
	}

	@Override
	public List<News> queryNewsImgRecently(String clubId) {
		return mapper.queryNewsImgRecently(clubId);
	}

	@Override
	public List<News> queryNewsRecently(String clubId) {
		return mapper.queryNewsRecently(clubId);
	}

	@Override
	public void updateReadcount(String key, Integer count) {
		mapper.updateReadcount(key,count);
	}

	public static void main(String[] args) throws Exception {
		MybatisUtil mybatisUtil=new MybatisUtil();
		NewsServiceImpl service = mybatisUtil.getMapperServiceImplObject(NewsDAO.class, NewsServiceImpl.class);
		List<News>  lists= service.queryNewsRecently("1010100");

		//service.updateReadcount("2000002",200);

		System.out.println(lists);
	}
}
