package com.community.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.ReceiptDetail;
import com.community.dao.ReceiptDetailDAO;
import com.community.service.interfaces.IReceiptDetailService;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月27日 上午12:03:25
* @version 1.0 
* @desrciption		
*/
@Service("receiptDetailService")
public class ReceiptDetailServiceImpl implements IReceiptDetailService {
	
	@Autowired
	ReceiptDetailDAO ReceiptDetailMapper;

	@Override
	public void saveReceiptDetail(List<ReceiptDetail> receiptList) {
		for(ReceiptDetail detailItem:receiptList){
			ReceiptDetailMapper.saveReceiptDetail(detailItem);
		}
	}

	@Override
	public List<ReceiptDetail> queryReceiptDetailByProcInstId(String procInstId) {
		// TODO Auto-generated method stub
		return ReceiptDetailMapper.queryReceiptDetailByProcInstId(procInstId);
	}

	@Override
	public void updateDetail(List<ReceiptDetail> detailList,String procInstId) {
		// TODO Auto-generated method stub
		for(ReceiptDetail detailItem:detailList){
			if(!("".equals(detailItem.getReceipt_item_id())&&null==detailItem.getReceipt_item_id())){
				ReceiptDetailMapper.updateDetailById(detailItem);
			}else{
				HashMap<String,Object> map = new HashMap<String,Object>();
				map.put("proc_inst_id", procInstId);
				map.put("spend_time", detailItem.getSpend_time());
				map.put("reason", detailItem.getReason());
				map.put("detail", detailItem.getDetail());
				map.put("cost", detailItem.getCost());
				ReceiptDetailMapper.addDetailByProcInstId(map);
			}
			
		}
	}
	
	
	
}
