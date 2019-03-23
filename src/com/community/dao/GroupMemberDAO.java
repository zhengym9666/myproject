package com.community.dao;

import com.community.model.base.User;
import org.apache.ibatis.annotations.Param;

import com.community.bean.GroupMember;

import java.util.List;

/**
 * @author  作者 :zhengym
 * @date 创建时间：2019年1月25日 上午9:24:29* @version 1.0
* @desrciption		
*/
public interface GroupMemberDAO {
	
	public String getDepartmentId(@Param("stuNum")String stuNum,@Param("clubId")String clubId);
	
	public GroupMember queryMemberInfo(@Param("stuNum")String stuNum,@Param("clubId")String clubId);

    User getUserByName(String userName);

    List<GroupMember> queryMemberListByClubId(String clubId);
    
    public void saveMemberInfo(GroupMember memberInfo);
}
