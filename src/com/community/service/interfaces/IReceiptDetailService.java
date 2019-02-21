package com.community.service.interfaces;

import java.util.HashMap;
import java.util.List;

import com.community.bean.ReceiptDetail;

/** 
* @author  ä½œè€… :zhengym
* @date åˆ›å»ºæ—¶é—´ï¼š2019å¹´1æœˆ27æ—¥ ä¸Šåˆ12:00:40
* @version 1.0 
* @desrciption		
*/
public interface IReceiptDetailService {
	//ä¿å­˜æŠ¥é”€è¯¦æƒ…
	public void saveReceiptDetail(List<ReceiptDetail> receiptList);
	
	//¸ù¾İÁ÷³ÌÊµÀıid²éÑ¯µ¥¸ö±¨Ïú
	public List<ReceiptDetail> queryReceiptDetailByProcInstId(String procInstId);
	
	//ĞŞ¸Ä±¨ÏúÏêÇé
	public void updateDetail(List<ReceiptDetail> detailList,String procInstId);
}
