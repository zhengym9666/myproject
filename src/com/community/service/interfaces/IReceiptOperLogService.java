package com.community.service.interfaces;

import java.util.List;

import com.community.bean.ReceiptOperLog;
import com.community.util.PageBean;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��2��14�� ����4:39:59
* @version 1.0 
* @desrciption		
*/
public interface IReceiptOperLogService {
	
	public PageBean queryAllOperInfo(String receiptman_id,String clubId,int currentPage,int pageSize);
	
	public void saveOperInfo(ReceiptOperLog OperLogInfo);
	
	public int queryTotalCount(String receiptman_id,String clubId);
}
