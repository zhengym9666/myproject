package com.community.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.service.interfaces.IClubService;

/**
 * 
 * @author zym
 *
 * 2018Äê12ÔÂ27ÈÕ
 */
@Controller
@RequestMapping("club.action")
public class ClubAction {
	
	@Autowired
	private IClubService clubService;
	
	public void getClubList(HttpServletRequest request){
		
	}
}
