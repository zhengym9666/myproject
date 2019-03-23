package com.community.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.bean.Fee;
import com.community.service.interfaces.IFeeService;


/** 
* @author  作者 :zhengym
* @date 创建时间：2019年3月19日 下午1:25:18
* @version 1.0 
* @desrciption		
*/
@Controller
@RequestMapping("/fee")
public class feeAction {
	
	@Autowired
	IFeeService feeService;
	
	@RequestMapping("/queryCode.action")
	@ResponseBody
	public Map<String,Object> queryCode(HttpServletRequest request){
		
		request.getSession().setAttribute("clubId", "1010100");
		String clubId = (String) request.getSession().getAttribute("clubId");
		Fee feeInfo = feeService.getFeeInfoById(clubId);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("wechatCode", feeInfo.getWechatCode());
		resultMap.put("apayCode", feeInfo.getApayCode());
		return resultMap;
		
	}
	
}
