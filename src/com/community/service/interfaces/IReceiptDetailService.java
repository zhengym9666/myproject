package com.community.service.interfaces;

import java.util.HashMap;
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
	
	//根据流程实例id查询单个报销
	public List<ReceiptDetail> queryReceiptDetailByProcInstId(String procInstId);
	
	//修改报销详情
	public void updateDetail(List<ReceiptDetail> detailList,String procInstId);
}
