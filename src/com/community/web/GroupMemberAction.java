package com.community.web;

import com.alibaba.fastjson.JSONObject;
import com.community.bean.*;
import com.community.service.interfaces.IClubService;
import com.community.service.interfaces.IGroupMemberService;
import com.community.util.EntityToJsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
@RequestMapping("groupMember")
public class GroupMemberAction {
	
	@Autowired
	private IGroupMemberService clubService;
	
	public void getClubList(HttpServletRequest request){
		
	}
//	//获取用户所在社团的好友
//	@RequestMapping("/queryFriendClubList.action")
//	public ResponseEntity<Map> queryFriendList(HttpServletRequest request, HttpSession session) throws IOException {
//		Map map = new HashMap();;
//		List<User> userList=new ArrayList<>();
//		JSONObject ob = EntityToJsonUtil.getRequestPostJson(request);
//		String hOpCode=ob.getString("hOpCode");
//		try {
//			String collectionId=ob.getString("userGroupTopId");
//
//			List<GroupMember> groupMembers = clubService.queryMemberListByClubId(collectionId);
//			if (userList != null) {
//				for (int i = 0; i < stuList.size(); i++) {
//					Student student = stuList.get(i);
//					User user = studentToUser(student);
//					userList.add(user);
//				}
//			}
//
//		}catch (Exception e){
//			map.put("user",userList);
//			map.put("hOpCode",0);
//		}
//		finally {
//			map.put("user",userList);
//			map.put("hOpCode",hOpCode);
//		}
//		return ResponseEntity.ok(map);
//	}

	public UserGroupData studentToUser(Club club){
		UserGroupData userGroup=new UserGroupData();
		userGroup.setUserGroupId(club.getClubId());
		userGroup.setUserGroupName(club.getClubName());
		return userGroup;
	}
}
