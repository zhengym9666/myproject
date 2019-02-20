package com.community.service.interfaces;

import java.util.HashMap;
import java.util.List;

import com.community.bean.ReceiptDetail;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��27�� ����12:00:40
* @version 1.0 
* @desrciption		
*/
public interface IReceiptDetailService {
	//���汨������
	public void saveReceiptDetail(List<ReceiptDetail> receiptList);
	
	//��������ʵ��id��ѯ��������
	public List<ReceiptDetail> queryReceiptDetailByProcInstId(String procInstId);
	
	//�޸ı�������
	public void updateDetail(List<ReceiptDetail> detailList,String procInstId);
}
