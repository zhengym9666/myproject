package com.community.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// @Controller注解：用于标记普通的java类，作为控制器
@Controller
@RequestMapping(value="/community")
public class CollegeAction{

	// ModelAndView：模型和视图，用于设置响应的模型数据，用户设置响应的视图
	// @RequestMapping注解：配置请求的url
	@RequestMapping("/mathBuild.action")
	//数学建模页面
	public ModelAndView mathBuild(){
		// 1.创建ModelAndView对象
		ModelAndView mav = new ModelAndView();

		// 2.设置响应的模型数据
		//addObject方法：设置相应的模型数据
		// 参数一：模型的名称（hello）
		// 参数二：模型数据
		mav.addObject("hello", "springmvc!!!");
		// 3.设置响应的视图
		// setViewName方法：设置响应的视图
		// 参数：视图名称（jsp页面的物理路径）
		mav.setViewName("/front/index.jsp");

		return mav;
	}

}
