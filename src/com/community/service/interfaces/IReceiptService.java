package com.community.service.interfaces;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.community.bean.Receipt;
import com.community.util.PageBean;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 下午2:35:22
* @version 1.0 
* @desrciption		
*/
public interface IReceiptService {
	
	public void insertReceipt(Receipt receiptBean);
	
	public PageBean queryReceiptByOneId(String clubId,String one_autitor,Integer state,int currentPage,int pageSize);
	
	public PageBean queryReceiptBySecondId(String clubId,String second_autitor,Integer state,int currentPage,int pageSize);
	
	public int queryTotalCountByOneId(String clubId,String one_autitor,Integer state);
	
	public int queryTotalCountBySecondId(String clubId,String second_autitor,Integer state);
	
	public int queryTotalCountByThirdId(String clubId,String third_autitor,Integer state);
	
	public PageBean queryCompletedAuditByOneId(String clubId,String one_autitor,int state,int currentPage,int pageSize);
	
	public PageBean queryCompletedAuditBySecondId(String clubId,String second_auditor,int state,int currentPage,int pageSize);
	
	public PageBean queryCompletedAuditByThirdId(String clubId,String third_autitor,int state,int currentPage,int pageSize);
	
	public int queryCompletedTotalCountByOneId(String clubId,String one_autitor,int state);
	
	public int queryCompletedTotalCountBySecondId(String clubId,String second_auditor,int state);
	
	public int queryCompletedTotalCountByThirdId(String clubId,String third_autitor,int state);
	
	public void auditReceipt(Integer state,String proc_inst_id,Date lastaudit_time);
	
	public Receipt getReceiptByTaskId(String taskId);
	
	public Receipt queryOneReceiptByProcInstId(String procInstId);
	
	public void updateOneReceiptByProcInstId(String receipt_reason,Float amount,Date revise_time,String proc_inst_id);

	public void revokeOneReceiptByProcInstId(Integer state,String procInstId);
	
	public void rejectOneReceiptByProcInstId(Integer state,String audit_suggest,String procInstId);
}
