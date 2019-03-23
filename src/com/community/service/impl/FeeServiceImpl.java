package com.community.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Fee;
import com.community.dao.FeeDAO;
import com.community.service.interfaces.IFeeService;


/** 
* @author  作者 :zhengym
* @date 创建时间：2019年3月16日 下午3:13:09
* @version 1.0 
* @desrciption		
*/
@Service("feeService")
public class FeeServiceImpl implements IFeeService {
	
	@Autowired
	FeeDAO feeMapper;

	@Override
	public void updateTotalFee(String clubId, float totalFee) {
		// TODO Auto-generated method stub
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("clubId", clubId);
		params.put("totalFee", totalFee);
		feeMapper.updateTotalFee(params);
	}
	
	@Override
	public Fee getFeeInfoById(String clubId) {
		// TODO Auto-generated method stub
		return feeMapper.getFeeInfoById(clubId);
	}

}
