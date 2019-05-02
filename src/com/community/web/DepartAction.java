package com.community.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.community.bean.Club;
import com.community.bean.Department;
import com.community.bean.Student;
import com.community.bean.User;
import com.community.bean.UserGroupData;
import com.community.util.CommonStatic;
import com.community.util.EntityToJsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.community.service.interfaces.IClubService;
import com.community.service.interfaces.IDepartmentService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author zym
 *
 * 2019年5月2日
 */
@Controller
@RequestMapping("/depart")
public class DepartAction {
	
	@Autowired
	IDepartmentService departmentService;
	
	@Autowired
	IClubService clubService;
	
	@RequestMapping("getDepartList.action")
	public String getDepartList(HttpServletRequest request){
		String clubId = request.getParameter("clubId");
		List<Department> departList = departmentService.queryDepartmentByClubId(clubId);
		Club club = clubService.getClubById(clubId);
		String clubName = null;
		if(club!=null){
			clubName = club.getClubName();
		}
		request.setAttribute("clubId", clubId);
		request.setAttribute("clubName", clubName);
		request.setAttribute("departList", departList);
		
		return "forward:/front/news/departIntro.jsp";
	}
}
