package com.community.dao;

import org.apache.ibatis.annotations.Param;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��2��8�� ����11:58:53
* @version 1.0 
* @desrciption		
*/
public interface TaskDAO {
	
	public String getTaskId(@Param("inst_id")String inst_id);

}
