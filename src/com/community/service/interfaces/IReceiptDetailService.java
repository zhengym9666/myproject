package com.community.service.interfaces;

import java.util.List;

import com.community.bean.ReceiptDetail;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月27日 上午12:00:40
* @version 1.0 
* @desrciption		
*/
public interface IReceiptDetailService {
	//保存报销详情
	public void saveReceiptDetail(List<ReceiptDetail> receiptList);
}
