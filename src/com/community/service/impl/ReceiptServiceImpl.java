package com.community.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Receipt;
import com.community.dao.ReceiptDAO;
import com.community.service.interfaces.IReceiptService;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 下午2:36:27
* @version 1.0 
* @desrciption		
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

}
