package com.community.dao;

import org.apache.ibatis.annotations.Param;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 上午9:24:29
* @version 1.0 
* @desrciption		
*/
public interface GroupMemberDAO {
	public String getDepartmentId(@Param("stuNum")String stuNum,@Param("clubId")String clubId);
}
