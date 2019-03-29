package com.community.service.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Receipt;
import com.community.dao.ReceiptDAO;
import com.community.service.interfaces.IReceiptService;
import com.community.util.PageBean;

/**
 * 
 * @author zym
 *
 * 2019年3月28日
 */
@Service("receiptService")
public class ReceiptServiceImpl implements IReceiptService {
	
	@Autowired
	ReceiptDAO receiptMapper;
	
	@Override
	public void insertReceipt(Receipt receiptBean) {
		// TODO Auto-generated method stub
		receiptMapper.insertReceipt(receiptBean);
	}
	
	//根据第一审批人学号查询所有待审批报销
	@Override
	public PageBean queryReceiptByOneId(String clubId,String one_autitor,Integer state,int currentPage,int pageSize) {
		
		int start = (currentPage-1)*pageSize;
		int size = pageSize;
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		HashMap<String, Object> map = new HashMap<>();
		map.put("clubId", clubId);
		map.put("one_autitor", one_autitor);
		map.put("state", state);
		map.put("start", start);
		map.put("size", size);
		List<Receipt> receiptList = receiptMapper.queryReceiptByOneId(map);
		pageBean.setData(receiptList);
		pageBean.setTotalCount(queryTotalCountByOneId(clubId, one_autitor, state));
		pageBean.setFirstPage(1);
		return pageBean;
	}

	@Override
	public PageBean queryReceiptBySecondId(String clubId, String second_autitor, Integer state,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		int start = (currentPage-1)*pageSize;
		int size = pageSize;
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		HashMap<String, Object> map = new HashMap<>();
		map.put("clubId", clubId);
		map.put("second_autitor", second_autitor);
		map.put("state", state);
		map.put("start", start);
		map.put("size", size);
		List<Receipt> receiptList = receiptMapper.queryReceiptBySecondId(map);
		pageBean.setData(receiptList);
		pageBean.setTotalCount(queryTotalCountBySecondId(clubId, second_autitor, state));
		pageBean.setFirstPage(1);
		return pageBean;
	}
	
	

	@Override
	public void auditReceipt(Integer state, String proc_inst_id,Date lastaudit_time) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("state", state);
		map.put("proc_inst_id", proc_inst_id);
		map.put("lastaudit_time", lastaudit_time);
		receiptMapper.auditReceipt(map);
	}

	@Override
	public Receipt getReceiptByTaskId(String taskId) {
		// TODO Auto-generated method stub
		return receiptMapper.getReceiptByTaskId(taskId);
	}

	@Override
	public Receipt queryOneReceiptByProcInstId(String procInstId) {
		// TODO Auto-generated method stub
		return receiptMapper.queryOneReceiptByProcInstId(procInstId);
	}

	@Override
	public void updateOneReceiptByProcInstId(String receipt_reason, Float amount,Date revise_time, String proc_inst_id) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("receipt_reason", receipt_reason);
		map.put("amount", amount);
		map.put("proc_inst_id", proc_inst_id);
		map.put("revise_time", revise_time);
		receiptMapper.updateOneReceiptByProcInstId(map);
	}

	@Override
	public void revokeOneReceiptByProcInstId(Integer state, String procInstId) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("state", state);
		map.put("procInstId", procInstId);
		receiptMapper.revokeOneReceiptByProcInstId(map);
	}

	@Override
	public void rejectOneReceiptByProcInstId(Integer state, String audit_suggest, String procInstId) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("state", state);
		map.put("proc_inst_id", procInstId);
		map.put("audit_suggest", audit_suggest);
		receiptMapper.rejectOneReceiptByProcInstId(map);
	}

	@Override
	public PageBean queryCompletedAuditByOneId(String clubId,String one_autitor,int state,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		int start = (currentPage-1)*pageSize;
		int size = pageSize;
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		HashMap<String, Object> map = new HashMap<>();
		map.put("clubId", clubId);
		map.put("one_autitor", one_autitor);
		map.put("state", state);
		map.put("start", start);
		map.put("size", size);
		List<Receipt> receiptList = receiptMapper.queryCompletedAuditByOneId(map);
		pageBean.setData(receiptList);
		pageBean.setTotalCount(queryCompletedTotalCountByOneId(clubId, one_autitor, state));
		pageBean.setFirstPage(1);
		return pageBean;
	}

	@Override
	public PageBean queryCompletedAuditBySecondId(String clubId,String second_auditor,int state,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		int start = (currentPage-1)*pageSize;
		int size = pageSize;
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		HashMap<String, Object> map = new HashMap<>();
		map.put("clubId", clubId);
		map.put("second_auditor", second_auditor);
		map.put("state", state);
		map.put("start", start);
		map.put("size", size);
		List<Receipt> receiptList = receiptMapper.queryCompletedAuditBySecondId(map);
		pageBean.setData(receiptList);
		pageBean.setTotalCount(queryCompletedTotalCountBySecondId(clubId, second_auditor, state));
		pageBean.setFirstPage(1);
		return pageBean;
	}

	@Override
	public PageBean queryCompletedAuditByThirdId(String clubId,String third_autitor,int state,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		int start = (currentPage-1)*pageSize;
		int size = pageSize;
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		HashMap<String, Object> map = new HashMap<>();
		map.put("clubId", clubId);
		map.put("third_autitor", third_autitor);
		map.put("state", state);
		map.put("start", start);
		map.put("size", size);
		List<Receipt> receiptList = receiptMapper.queryCompletedAuditByThirdId(map);
		pageBean.setData(receiptList);
		pageBean.setTotalCount(queryCompletedTotalCountByThirdId(clubId, third_autitor, state));
		pageBean.setFirstPage(1);
		return pageBean;
	}

	@Override
	public int queryTotalCountByOneId(String clubId, String one_autitor, Integer state) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("clubId", clubId);
		map.put("one_autitor", one_autitor);
		map.put("state", state);
		return receiptMapper.queryTotalCountByOneId(map);
	}

	@Override
	public int queryTotalCountBySecondId(String clubId, String second_autitor, Integer state) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("clubId", clubId);
		map.put("second_autitor", second_autitor);
		map.put("state", state);
		return receiptMapper.queryTotalCountBySecondId(map);
	}

	@Override
	public int queryTotalCountByThirdId(String clubId, String third_autitor, Integer state) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("clubId", clubId);
		map.put("third_autitor", third_autitor);
		map.put("state", state);
		return receiptMapper.queryTotalCountByThirdId(map);
	}

	@Override
	public int queryCompletedTotalCountByOneId(String clubId, String one_autitor, int state) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("clubId", clubId);
		map.put("one_autitor", one_autitor);
		map.put("state", state);
		return receiptMapper.queryCompletedTotalCountByOneId(map);
	}

	@Override
	public int queryCompletedTotalCountBySecondId(String clubId, String second_auditor, int state) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("clubId", clubId);
		map.put("second_auditor", second_auditor);
		map.put("state", state);
		return receiptMapper.queryCompletedTotalCountBySecondId(map);
	}

	@Override
	public int queryCompletedTotalCountByThirdId(String clubId, String third_autitor, int state) {
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("clubId", clubId);
		map.put("third_autitor", third_autitor);
		map.put("state", state);
		return receiptMapper.queryCompletedTotalCountByThirdId(map);
	} 

}
