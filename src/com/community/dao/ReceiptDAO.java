package com.community.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.Receipt;

/** 
* @author   作者 :zhengym
* @version 1.0
* @desrciption		
*/
public interface ReceiptDAO {
	public void insertReceipt(Receipt receiptBean);
	
	public List<Receipt> queryReceiptByOneId(HashMap<String, Object> params);

	public List<Receipt> queryReceiptBySecondId(HashMap<String, Object> params);
	
	public List<Receipt> queryReceiptByThirdId(HashMap<String, Object> params);
	
	public int queryTotalCountByOneId(HashMap<String, Object> params);
	
	public int queryTotalCountBySecondId(HashMap<String, Object> params);
	
	public int queryTotalCountByThirdId(HashMap<String, Object> params);
	
	public void auditReceipt(HashMap<String, Object> params);
	
	public Receipt getReceiptByTaskId(@Param("taskId")String taskId);
	
	public List<Receipt> queryCompletedAuditByOneId(HashMap<String, Object> params);
	
	public List<Receipt> queryCompletedAuditBySecondId(HashMap<String, Object> params);
	
	public List<Receipt> queryCompletedAuditByThirdId(HashMap<String, Object> params);
	
	public int queryCompletedTotalCountByOneId(HashMap<String, Object> params);
	
	public int queryCompletedTotalCountBySecondId(HashMap<String, Object> params);
	
	public int queryCompletedTotalCountByThirdId(HashMap<String, Object> params);
		
	public int queryTotalCount(@Param("clubId")String clubId,@Param("receiptman_id")String receiptman_id);
	
	public Receipt queryOneReceiptByProcInstId(@Param("procInstId")String procInstId);
	
	public void updateOneReceiptByProcInstId(HashMap<String,Object>params);
	
	public void revokeOneReceiptByProcInstId(HashMap<String,Object> params);
	
	public void rejectOneReceiptByProcInstId(HashMap<String,Object> params);
}
