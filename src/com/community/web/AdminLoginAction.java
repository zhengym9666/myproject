package com.community.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.bean.GroupMember;
import com.community.service.interfaces.IGroupMemberService;

import net.sf.json.JSONArray;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年3月12日 下午10:34:37
* @version 1.0 
* @desrciption		
*/
@Controller
@RequestMapping("/admin")
public class AdminLoginAction {
	
	@Autowired
	IGroupMemberService groupMemberService;
	
	@RequestMapping("/LoginAction.action")
	@ResponseBody
	public Map<String,Object> adminLogin(HttpServletRequest request,HttpSession session) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		
		String stuId = request.getParameter("stuId");
		String collegeId = request.getParameter("collegeId");
		String clubId = request.getParameter("clubId");
		String password = request.getParameter("password");
		Map<String,Object> resultMap = new HashMap<String,Object>();
		if(!("000000").equals(password)){
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "密码错误");
			return resultMap;
		}
		GroupMember memInfo = groupMemberService.queryMemberInfo(stuId, clubId);
		//保存用户登录信息到session
		session.setAttribute("stuNum", stuId);
		session.setAttribute("clubId", clubId);
		session.setAttribute("memInfo", memInfo);
		if(memInfo==null){
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "该用户不存在");
			return resultMap;
		}
		
		resultMap.put("resultFlag", 1);
		resultMap.put("stuNum", stuId);
		resultMap.put("clubId", clubId);
		resultMap.put("collegeId", collegeId);
		resultMap.put("memInfo", memInfo);
		resultMap.put("adminUrl", "http://localhost:8080/admin-web/admin/loginAction.action");
		
		return resultMap;
		
	}
	
	@RequestMapping("/SuperLoginAction.action")
	@ResponseBody
	public Map<String,Object> SuperLoginAction(HttpServletRequest request){
		
		String adminName = request.getParameter("adminName");
		String password = request.getParameter("password");
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		if(!("admin".equals(adminName) && ("admin").equals(password))){
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "用户名或密码错误");
		}else{
			resultMap.put("resultFlag", 1);
			resultMap.put("adminUrl", "http://localhost:8080/admin-web/index2.jsp");
		}
		return resultMap;
	}
}
