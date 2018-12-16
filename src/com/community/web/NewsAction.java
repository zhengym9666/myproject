package com.community.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class NewsAction {
	
	@RequestMapping("/news.action")
	public String NewsView(){
		System.out.println("hhhh");
		return "forward:/front/news/news.jsp";
	}
}
