package com.community.dao;

import org.apache.ibatis.annotations.Param;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年2月8日 下午11:58:53
* @version 1.0 
* @desrciption		
*/
public interface TaskDAO {
	
	public String getTaskId(@Param("inst_id")String inst_id);

}
