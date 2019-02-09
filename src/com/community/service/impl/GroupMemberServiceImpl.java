package com.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.GroupMember;
import com.community.dao.GroupMemberDAO;
import com.community.service.interfaces.IGroupMemberService;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����9:37:59
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
