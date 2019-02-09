package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.GroupMember;
import com.community.dao.GroupMemberDAO;
import com.community.service.interfaces.IGroupMemberService;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 上午9:37:59
* @version 1.0 
* @desrciption		
*/
@Service("groupMemberService")
public class GroupMemberServiceImpl implements IGroupMemberService {

	@Autowired
	GroupMemberDAO groupMemberMapper;
	
	@Override
	public String getDepartmentId(String stuNum, String clubId) {
		// TODO Auto-generated method stub
		return groupMemberMapper.getDepartmentId(stuNum, clubId);
	}

	@Override
	public GroupMember queryMemberInfo(String stuNum, String clubId) {
		// TODO Auto-generated method stub
		return groupMemberMapper.queryMemberInfo(stuNum, clubId);
	}

}
