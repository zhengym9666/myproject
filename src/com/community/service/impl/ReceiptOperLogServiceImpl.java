package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.ReceiptOperLog;
import com.community.dao.ReceiptDAO;
import com.community.dao.ReceiptOperLogDAO;
import com.community.service.interfaces.IReceiptOperLogService;
import com.community.util.PageBean;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年2月14日 下午4:41:42
* @version 1.0 
* @desrciption		
*/
@Service("receiptOperLogService")
public class ReceiptOperLogServiceImpl implements IReceiptOperLogService {
	
	@Autowired
	ReceiptOperLogDAO receiptOperLogMapper;
	
	@Autowired
	ReceiptDAO receiptMapper;

	@Override
	public PageBean queryAllOperInfo(String receiptman_id, String clubId,int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		int start = (currentPage-1)*pageSize;
		int size = pageSize;
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		List<ReceiptOperLog> ReceiptOperLogList = receiptOperLogMapper.queryAllOperInfo(receiptman_id, clubId, start, size);
		//根据日志表报销实例获取相应报销单实例
		for(ReceiptOperLog operLogItem:ReceiptOperLogList){
			operLogItem.setReceipt_state(receiptMapper.queryOneReceiptByProcInstId(operLogItem.getProc_inst_id()).getState());
		}
		pageBean.setData(ReceiptOperLogList);
		pageBean.setTotalCount(queryTotalCount(receiptman_id, clubId));
		pageBean.setFirstPage(1);
		return pageBean;
	}
	
	@Override
	public void saveOperInfo(ReceiptOperLog OperLogInfo) {
		// TODO Auto-generated method stub
		receiptOperLogMapper.saveOperInfo(OperLogInfo);
	}
	
	@Override
	public int queryTotalCount(String receiptman_id, String clubId) {
		// TODO Auto-generated method stub
		return receiptOperLogMapper.queryTotalCount(receiptman_id, clubId);
	}

}
