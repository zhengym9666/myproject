package com.community.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.community.util.FilePropertiesUtil;
import org.junit.Test;
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
	private String adminProjectName=FilePropertiesUtil.getString("project_name");
	private String adminProjectProt=FilePropertiesUtil.getString("admin_port");
	private String adminProjectHost=FilePropertiesUtil.getString("admin_host");

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
		//后台的项目名
		if(adminProjectName==null){
			adminProjectName="admin";
		}
		if(adminProjectProt==null){
			//adminProjectProt="8081";
		}
		if(adminProjectHost==null){
			//adminProjectHost="localhost";
		}

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
		PageBean<News> pageNews = newsService.queryPageNews(collegeId, clubId, currentPage, pageSize);
		List<News> newList = pageNews.getData();
		//替换新闻内容的图片链接
		for(News news :newList){
			String content = news.getContent();
			news.setContent(replaceImageUrl(content));
		}


		request.setAttribute("pageNews", pageNews);
		request.setAttribute("collegeId", collegeId);
		request.setAttribute("clubId", clubId);
		request.setAttribute("clubName", clubName);
		System.out.println(pageNews);
		return "forward:/front/news/newscontent.jsp";
		
	}

	//由于调用的图片是后台的图片，所以地址不能写死，可以由后台进行配置
	public String replaceImageUrl(String content){
		return content.replaceAll("<img src=\"/[a-z]*/upload",
				"<img src=\"http://"+adminProjectHost+":"+adminProjectProt+"/"+adminProjectName+"/upload");
	}


	/***
	 *原新闻内容
	 * <div style="text-align:center;">
	 * 	<img src="/admin/upload/2c234de6e-3c21-4563-9db3-4243a690d32a.png" alt="" />
	 * 213121212<img src="/admin/upload/c234de6e-3c21-4563-9db3-4243a690d32a.png" alt="" />213121212
	 * </div>
	 *
	 * 正在表达式：<img src="/[a-z]*\/upload
	 * 替换文本：<img src="http:localhost:xx/asb/upload
	 * 替换结果：
	 *
	 * <div style="text-align:center;">
	 * 	<img src="http:localhost:xx/asb/upload/2c234de6e-3c21-4563-9db3-4243a690d32a.png" alt="" />
	 * 213121212<img src="http:localhost:xx/asb/upload/c234de6e-3c21-4563-9db3-4243a690d32a.png" alt="" />213121212
	 * </div>
	 */
	//替换图片项目名
	@Test
	public void test(){
		String content=" \n" +
				"<div style=\"text-align:center;\">\n" +
				"\t<img src=\"/admin/upload/c234de6e-3c21-4563-9db3-4243a690d32a.png\" alt=\"\" />213121212" +
				"<img src=\"/admin/upload/c234de6e-3c21-4563-9db3-4243a690d32a.png\" alt=\"\" />213121212\n" +
				"</div>";
		content = content.replaceAll("<img src=\"/[a-z]*/upload", "<img src=\"http://localhost:xx/asb/upload");
		System.out.println(content);
	}
}
