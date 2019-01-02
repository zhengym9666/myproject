package com.community.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.bean.Club;
import com.community.bean.College;
import com.community.service.interfaces.IClubService;
import com.community.service.interfaces.ICollegeService;

// @Controller注解：用于标记普通的java类，作为控制器
@Controller
@RequestMapping(value="/community")
public class CollegeAction{
	
	@Autowired
	IClubService clubService;
	
	@Autowired
	ICollegeService collegeService;
	
	// ModelAndView：模型和视图，用于设置响应的模型数据，用户设置响应的视图
	// @RequestMapping注解：配置请求的url
	@RequestMapping("/mathBuild.action")
	//数学建模页面
	public String mathBuild(HttpServletRequest request,HttpSession session){
		// 1.创建ModelAndView对象
		ModelAndView mav = new ModelAndView();
		String collegeId = request.getParameter("collegeId");
		session.setAttribute("collegeId", collegeId);
//		获取学院的社团列表，放入session
		List clublist = new ArrayList<Club>();
		clublist = clubService.queryClubBycollegeId(collegeId);
		session.setAttribute("clublist", clublist);
//		获取学院名和id，放入session
		College collegeinfo = collegeService.queryCollegeById(collegeId);
		session.setAttribute("collegeName", collegeinfo.getAbbr());
		session.setAttribute("collegeId", collegeinfo.getId());
		System.out.println(clublist);
		
		// 2.设置响应的模型数据
		//addObject方法：设置相应的模型数据
		// 参数一：模型的名称（hello）
		// 参数二：模型数据
		mav.addObject("hello", "springmvc!!!");
		System.out.println("呵呵呵呵呵");
		// 3.设置响应的视图
		// setViewName方法：设置响应的视图
		// 参数：视图名称（jsp页面的物理路径）
		//mav.setViewName("/front/index.jsp");
		return "redirect:/front/index.jsp";

		//return mav;
	}

}
