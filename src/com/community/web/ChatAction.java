package com.community.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author zym
 *
 * 2018年12月23日
 */

@Controller
@RequestMapping("/community")
public class ChatAction {
	@RequestMapping("/chat.action")
	public String ChatView(){
		System.out.println("hhhh");
		return "forward:/front/chat/chat.jsp";
	}
}
