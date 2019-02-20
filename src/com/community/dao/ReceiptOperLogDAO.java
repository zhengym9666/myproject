package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.ReceiptOperLog;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��2��14�� ����4:33:17
* @version 1.0 
* @desrciption		
*/
public interface ReceiptOperLogDAO {
	
	public List<ReceiptOperLog> queryAllOperInfo(@Param("receiptman_id")String receiptman_id,@Param("clubId")String clubId,@Param("start")int start,@Param("size")int size);
	
	public void saveOperInfo(ReceiptOperLog OperLogInfo);
	
	public int queryTotalCount(@Param("receiptman_id")String receiptman_id,@Param("clubId")String clubId);
	
}
