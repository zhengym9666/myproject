package com.community.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.ReceiptDetail;

/** 
* @author   作者 :zhengym
* @version 1.0
* @desrciption		
*/
public interface ReceiptDetailDAO {
	
	public void saveReceiptDetail(ReceiptDetail detailItem);
	
	public List<ReceiptDetail> queryReceiptDetailByProcInstId(@Param("procInstId")String procInstId);
	
	public void updateDetailById(ReceiptDetail detailItem);
	
	public void addDetailByProcInstId(HashMap<String,Object> params);
}
