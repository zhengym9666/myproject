package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.ReceiptDetail;
import com.community.dao.ReceiptDetailDAO;
import com.community.service.interfaces.IReceiptDetailService;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��27�� ����12:03:25
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

}
