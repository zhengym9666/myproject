package com.community.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// @Controllerע�⣺���ڱ����ͨ��java�࣬��Ϊ������
@Controller
@RequestMapping(value="/community")
public class CollegeAction{

	// ModelAndView��ģ�ͺ���ͼ������������Ӧ��ģ�����ݣ��û�������Ӧ����ͼ
	// @RequestMappingע�⣺���������url
	@RequestMapping("/mathBuild.action")
	//��ѧ��ģҳ��
	public ModelAndView mathBuild(){
		// 1.����ModelAndView����
		ModelAndView mav = new ModelAndView();

		// 2.������Ӧ��ģ������
		//addObject������������Ӧ��ģ������
		// ����һ��ģ�͵����ƣ�hello��
		// ��������ģ������
		mav.addObject("hello", "springmvc!!!");
		// 3.������Ӧ����ͼ
		// setViewName������������Ӧ����ͼ
		// ��������ͼ���ƣ�jspҳ�������·����
		mav.setViewName("/front/index.jsp");

		return mav;
	}

}
