package com.community.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.bean.Club;
import com.community.util.DatePersThread;
import com.community.util.FilePropertiesUtil;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.bean.Comments;
import com.community.bean.News;
import com.community.service.interfaces.IClubService;
import com.community.service.interfaces.ICommentsService;
import com.community.service.interfaces.INewsService;
import com.community.util.PageBean;


@Controller
@RequestMapping("/news")
public class NewsAction {
	@Autowired
	private INewsService newsService;
	
	@Autowired
	IClubService clubService;
	
	@Autowired
	private ICommentsService commentsService;
	private String adminProjectName=FilePropertiesUtil.getString("project_name");
	private String adminProjectProt=FilePropertiesUtil.getString("admin_port");
	private String adminProjectHost=FilePropertiesUtil.getString("admin_host");

	@RequestMapping("/news.action")
	public String NewsView(){
		System.out.println("hhhh");
		return "forward:/front/news/news.jsp";
	}

	//获取新闻内容
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

	@RequestMapping(value = "newsById/{newsId}", method = RequestMethod.GET)
	public String newsById(@PathVariable("newsId")Integer newsId,HttpServletRequest request){
		String clubId =  request.getParameter("clubId");
		News news = newsService.queryNewsById(newsId);
		request.setAttribute("id", news.getId());
		request.setAttribute("collegeId", news.getCollegeId());
		request.setAttribute("title", news.getTitle());
		request.setAttribute("content",news.getContent());
		request.setAttribute("news",news);

		return "forward:/front/news/hotnewscontent.jsp";
	}

	//根据新闻id获取热门新闻内容
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

	//分页获取新闻
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
		Club clubById = clubService.getClubById(clubId);
		String clubName="";
		if(clubById!=null){
			clubName = clubService.getClubById(clubId).getClubName();
		}
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

			int readcount = news.getReadcount();
			int id = news.getId();
			int countByKey = DatePersThread.getCountByKey(id + "");
			//如果缓存有数据，直接取缓存数据
			if(countByKey>0){
				news.setReadcount(countByKey);
			}
			news.setReadcount(news.getReadcount()+1);
			DatePersThread.setCountByKey(id+"",readcount);
		}
		
		if(newList!=null && newList.size()!=0){
			News onenews = newList.get(0);
			request.setAttribute("newsId", onenews.getId());
			request.setAttribute("resultMap", queryAllComments(onenews.getId()));
		}
		
	
		request.setAttribute("pageNews", pageNews);
		//request.setAttribute("newsId", onenews.getId());
		request.setAttribute("collegeId", collegeId);
		request.setAttribute("clubId", clubId);
		request.setAttribute("clubName", clubName);
		//request.setAttribute("resultMap", queryAllComments(onenews.getId()));
		System.out.println(pageNews);
		return "forward:/front/news/newscontent.jsp";

	}

	//获取当前社团最近的六条新闻的图片链接和新闻链接
	@RequestMapping("queryNewsImgRecently.action")
	public ResponseEntity<Map> queryNewsImgRecently(HttpServletRequest request){
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

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<Map<String,String>> imglist=new ArrayList<>();
		if(clubId==null || clubId.length()>0){
			clubId="1010100";
		}

		try {
			List<News> newsList=newsService.queryNewsImgRecently(clubId);
			for (News new1:newsList) {
				String content = new1.getContent();
				//把图片的链接转成后台的图片链接
				content=replaceImageUrl(content);
				//获取图片的首个链接
				String urlImage = contentToImgUrlOne(content);
				Map<String,String > map=new HashMap<>();
				map.put("urlImage",urlImage);
				map.put("url",request.getContextPath()+"/news/newsById/"+new1.getId());
				imglist.add(map);
			}
			resultMap.put("resultFlag", 1);
			resultMap.put("imglist",imglist);
		} catch (Exception e) {
			resultMap.put("resultFlag", 0);
			resultMap.put("msg", "查询图片信息出错："+e.getMessage());
		}
		return ResponseEntity.ok(resultMap);

	}
	//获取当前社团最近的六条新闻的标题和链接
	@RequestMapping("queryNewsRecently.action")
	public ResponseEntity<Map> queryNewsRecently(HttpServletRequest request){

		String collegeId = (String) request.getSession().getAttribute("collegeId");
		String clubId =  request.getParameter("clubId");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<JSONObject> news=new ArrayList<>();
		if(clubId==null || clubId.length()>0){
			clubId="1010100";
		}

		try {
			List<News> newsList=newsService.queryNewsRecently(clubId);
			for (News new1:newsList) {
				JSONObject object=new JSONObject();
				object.put("url",request.getContextPath()+"/news/newsById/"+new1.getId());
				object.put("title",new1.getTitle());
				news.add(object);

			}
			resultMap.put("resultFlag", 1);
			resultMap.put("newslist",news);
		} catch (Exception e) {
			resultMap.put("resultFlag", 0);
			resultMap.put("msg", "查询图片信息出错："+e.getMessage());
		}
		return ResponseEntity.ok(resultMap);

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
	//由于调用的图片是后台的图片，所以地址不能写死，可以由后台进行配置
	public String replaceImageUrl(String content){
		return content.replaceAll("<img src=\"/[a-z]*/upload",
				"<img src=\"http://"+adminProjectHost+":"+adminProjectProt+"/"+adminProjectName+"/upload");
	}



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

	//图片链接获取
	@Test
	public void test2(){
		String str=" 1231<img src=\"/admin/upload/2c234de6e-3c21-4563-9db3-4243a690d32a.png\" alt=\"\" />213121212<img src=\"/admin/upload/c234de6e-3c21-4563-9db3-4243a690d32a.png\" alt=\"\" />";
		String substring = str.substring(str.indexOf("<img"));
		CharSequence charSequence = substring.subSequence(substring.indexOf("\"")+1, substring.indexOf("\"",substring.indexOf("\"")+1));
		System.out.println(charSequence.toString());
	}

	//把新闻内容转换成获取出里面的一个图片链接
	public String contentToImgUrlOne(String content){
		//获取图片标签开始的文本
		String substring = content.substring(content.indexOf("<img"));
		//裁剪图片标签后的链接
		CharSequence charSequence = substring.subSequence(substring.indexOf("\"")+1, substring.indexOf("\"",substring.indexOf("\"")+1));
		//System.out.println(charSequence.toString());
		return charSequence.toString();
	}
	
	
	//获取新闻评论数据
	/*@RequestMapping("/queryAllComments.action")
	@ResponseBody*/
	public Map<String,Object> queryAllComments(int newsId){
		
		//Integer newsId = Integer.parseInt(request.getParameter("newsId"));
		List<Map> dataList = new ArrayList<Map>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultFlag", 1);
		
		try {
			List<Comments> mainCommList = commentsService.queryAllComments(newsId);
			for(Comments commentBean:mainCommList){
				Map<String,Object> commentBlock = new HashMap<String,Object>(); 
				commentBlock.put("mainComment", commentBean);
				List<Comments> responseList = commentsService.queryResponseComments(commentBean.getComment_id());
				commentBlock.put("responseList", responseList);
				dataList.add(commentBlock);
			}
			resultMap.put("dataList", dataList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "获取评论信息出错");
			e.printStackTrace();
		}
		return resultMap;
	}

	//获取新闻评论数据
	@RequestMapping("/CommentsPl.action")
	@ResponseBody
	public Map<String,Object> CommentsPl(HttpServletRequest request){
		
		int newsId = Integer.parseInt(request.getParameter("newsId"));
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		String headImg = request.getParameter("headImg");
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultFlag", 1);
		
		Comments pl = new Comments();
		pl.setAuthor(author);
		pl.setContent(content);
		pl.setNews_id(newsId);
		pl.setResponseToCommentId(0);
		pl.setCreate_time(new Date());
		pl.setCommentHead(headImg);
		
		try {
			commentsService.addCommentPl(pl);
			resultMap.put("commentId", pl.getComment_id());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "保存评论信息失败");
			e.printStackTrace();
		}
		return resultMap;
		
	}

	//添加评论
	@RequestMapping("/CommentsHf.action")
	@ResponseBody
	public Map<String,Object> CommentsHf(HttpServletRequest request){
		int newsId = Integer.parseInt(request.getParameter("newsId"));
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		int responseToCommentId = Integer.parseInt(request.getParameter("responseToCommentId"));
		String responseTo = request.getParameter("responseTo");
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultFlag", 1);
		
		Comments hf = new Comments();
		hf.setAuthor(author);
		hf.setContent(content);
		hf.setNews_id(newsId);
		hf.setResponseToCommentId(responseToCommentId);
		hf.setResponseTo(responseTo);
		hf.setCreate_time(new Date());
		
		try {
			commentsService.addCommentPl(hf);
			resultMap.put("commentId", hf.getComment_id());
			resultMap.put("respToCom", responseToCommentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "保存评论信息失败");
			e.printStackTrace();
		}
		return resultMap;
	}

	//删除评论
	@RequestMapping("/deleteComment.action")
	@ResponseBody
	public Map<String,Object> deleteComment(HttpServletRequest request){
		
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		resultMap.put("resultFlag", 1);
		
		try {
			commentsService.deleteComment(commentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "删除评论失败");
		}
		return resultMap;

	}

	//点赞评论
	@RequestMapping("/CommentOnLike.action")
	@ResponseBody
	public Map<String,Object> CommentOnLike(HttpServletRequest request){
		
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		int zNum = Integer.parseInt(request.getParameter("zNum"));
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("resultFlag", 1);
		
		try {
			commentsService.updateCommentLike(commentId, zNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "系统出错");
			e.printStackTrace();
		}
		return resultMap;
	}
}
