package com.community.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.community.bean.News;
import com.community.service.interfaces.INewsService;
import com.community.util.PageBean;


@Controller
@RequestMapping("/news")
public class NewsAction {
	@Autowired
	private INewsService newsService;
		
	@RequestMapping("/news.action")
	public String NewsView(){
		System.out.println("hhhh");
		return "forward:/front/news/news.jsp";
	}
	
	@RequestMapping("/newscontent.action")
	public String NewsContentView(HttpServletRequest request){

		request.setAttribute("id", request.getParameter("id"));	
		request.setAttribute("head", request.getParameter("head"));
		request.setAttribute("collegeId", request.getParameter("collegeId"));
		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("content",request.getParameter("content"));
		
//		社团id
		String name = (String) request.getAttribute("id");
		String head = (String) request.getAttribute("head");
//		学院id
		String collegeId = (String) request.getAttribute("collegeId");
//		标题
		String title = (String) request.getAttribute("title");
//		内容
		String content = (String) request.getAttribute("content");
			
		System.out.println("head:"+head+"id:"+name+"collegeId:"+collegeId+"title:"+title+"content:"+content);
		return "forward:/front/news/newscontent.jsp";
	}

	@RequestMapping(value = "/{newsId}", method = RequestMethod.GET)
	public ResponseEntity<News> queryNewsById(@PathVariable("newsId")Integer newsId){
		//int id = Integer.parseInt(request.getParameter("id"));
		try {
			News news = newsService.queryNewsById(newsId);
			return ResponseEntity.ok(news);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//返回500
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	@RequestMapping("queryNewsPage.action")
	public String queryNewsPage(HttpServletRequest request){
		String collegeId = (String) request.getSession().getAttribute("collegeId");
		String clubId =  request.getParameter("clubId");
		String currentPage0 = request.getParameter("currentPage");
//		获取社团名称作为新闻头
		String clubName = request.getParameter("clubname");
		int currentPage;
		if(currentPage0==null || currentPage0.equals("")){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(currentPage0);
		}
		int pageSize = 1;
		PageBean pageNews = newsService.queryPageNews(collegeId, clubId, currentPage, pageSize);
		
		request.setAttribute("pageNews", pageNews);
		request.setAttribute("collegeId", collegeId);
		request.setAttribute("clubId", clubId);
		request.setAttribute("clubName", clubName);
		System.out.println(pageNews);
		return "forward:/front/news/newscontent.jsp";
		
	}
}
