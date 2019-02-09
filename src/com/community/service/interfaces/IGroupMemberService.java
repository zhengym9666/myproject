package com.community.service.interfaces;

import com.community.bean.GroupMember;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 上午9:36:46
* @version 1.0 
* @desrciption		
*/
public interface IGroupMemberService {
	
	public String getDepartmentId(String stuNum,String clubId);
	
	
	public GroupMember queryMemberInfo(String stuNum,String clubId);
}
