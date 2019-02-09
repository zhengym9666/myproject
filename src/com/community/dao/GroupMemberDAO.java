package com.community.dao;

import org.apache.ibatis.annotations.Param;

import com.community.bean.GroupMember;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����9:24:29
* @version 1.0 
* @desrciption		
*/
public interface GroupMemberDAO {
	
	public String getDepartmentId(@Param("stuNum")String stuNum,@Param("clubId")String clubId);
	
	public GroupMember queryMemberInfo(@Param("stuNum")String stuNum,@Param("clubId")String clubId);
}
