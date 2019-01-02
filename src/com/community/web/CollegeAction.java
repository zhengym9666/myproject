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

// @Controllerע�⣺���ڱ����ͨ��java�࣬��Ϊ������
@Controller
@RequestMapping(value="/community")
public class CollegeAction{
	
	@Autowired
	IClubService clubService;
	
	@Autowired
	ICollegeService collegeService;
	
	// ModelAndView��ģ�ͺ���ͼ������������Ӧ��ģ�����ݣ��û�������Ӧ����ͼ
	// @RequestMappingע�⣺���������url
	@RequestMapping("/mathBuild.action")
	//��ѧ��ģҳ��
	public String mathBuild(HttpServletRequest request,HttpSession session){
		// 1.����ModelAndView����
		ModelAndView mav = new ModelAndView();
		String collegeId = request.getParameter("collegeId");
		session.setAttribute("collegeId", collegeId);
//		��ȡѧԺ�������б�����session
		List clublist = new ArrayList<Club>();
		clublist = clubService.queryClubBycollegeId(collegeId);
		session.setAttribute("clublist", clublist);
//		��ȡѧԺ����id������session
		College collegeinfo = collegeService.queryCollegeById(collegeId);
		session.setAttribute("collegeName", collegeinfo.getAbbr());
		session.setAttribute("collegeId", collegeinfo.getId());
		System.out.println(clublist);
		
		// 2.������Ӧ��ģ������
		//addObject������������Ӧ��ģ������
		// ����һ��ģ�͵����ƣ�hello��
		// ��������ģ������
		mav.addObject("hello", "springmvc!!!");
		System.out.println("�ǺǺǺǺ�");
		// 3.������Ӧ����ͼ
		// setViewName������������Ӧ����ͼ
		// ��������ͼ���ƣ�jspҳ�������·����
		//mav.setViewName("/front/index.jsp");
		return "redirect:/front/index.jsp";

		//return mav;
	}

}
