package com.community.service.interfaces;

import com.community.bean.GroupMember;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����9:36:46
* @version 1.0 
* @desrciption		
*/
public interface IGroupMemberService {
	
	public String getDepartmentId(String stuNum,String clubId);
	
	
	public GroupMember queryMemberInfo(String stuNum,String clubId);
}
