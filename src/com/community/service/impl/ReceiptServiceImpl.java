package com.community.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Receipt;
import com.community.dao.ReceiptDAO;
import com.community.service.interfaces.IReceiptService;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����2:36:27
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
