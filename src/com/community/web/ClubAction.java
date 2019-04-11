package com.community.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.community.bean.Club;
import com.community.bean.Student;
import com.community.bean.User;
import com.community.bean.UserGroupData;
import com.community.util.CommonStatic;
import com.community.util.EntityToJsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.service.interfaces.IClubService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author zym
 *
 * 2018年12月27日
 */
@Controller
@RequestMapping("club")
public class ClubAction {
	
	@Autowired
	private IClubService clubService;
	
	public void getClubList(HttpServletRequest request){
		
	}
	//获取指定社团的信息
	@RequestMapping("/queryStudentClub.action")
	public ResponseEntity<Map> queryStudentClub(HttpServletRequest request, HttpSession session){
		Map map = new HashMap();;
		List<User> userList=new ArrayList<>();
		String hOpCode="";
		Club club=null;
		UserGroupData userGroupData=null;
		try {
			JSONObject ob = EntityToJsonUtil.getRequestPostJson(request);
			hOpCode=ob.getString("hOpCode");
			String clubId=ob.getString("userGroupId");
			/*if(CommonStatic.ADMIN_USER_ID.equals(tokenObj.getUserId())){
				stuList=studentService.getFriendListByAdmin();
			}*/
			club = clubService.queryUserGroup(clubId);
			userGroupData = studentToUser(club);
		}catch (Exception e){
			map.put("userGroup",userGroupData);
			map.put("hOpCode",0);
		}
		finally {
			map.put("userGroup",userGroupData);
			map.put("hOpCode",hOpCode);
		}
		return ResponseEntity.ok(map);
	}


	public UserGroupData studentToUser(Club club){
		UserGroupData userGroup=new UserGroupData();
		userGroup.setUserGroupId(club.getClubId());
		userGroup.setUserGroupName(club.getClubName());
		return userGroup;
	}
}
