package com.community.web;

import com.alibaba.fastjson.JSONObject;
import com.community.bean.Student;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author lyb
 * 调用接口发送短信,不需要使用，失败的代码
 * 2018年12月23日
 */

@Controller
@RequestMapping("/community")
public class ChatAction {
//	private static transient Log log = LogFactory.getLog(ChatAction.class);
//	@RequestMapping("/chat.action")
//	public String ChatView(){
//		System.out.println("hhhh");
//		return "forward:/front/chat/chat.jsp";
//	}
//	//HttpServletRequest request, HttpSession session,
//
//	/***
//	 * @Author linyb3
//	 * @Title: var data = {
//	 *                 "wsOpCode": 5,
//	 *                 "chatContent": chatContent,
//	 *                 "toType": toType,
//	 *                 "toTypeId": toTypeId
//	 *             };
//	 * @Description:
//	 * @Date 2019/2/22 16:04
//	 * @param
//	 * @return
//	 */
//	//fromStudnetid 发送者学生ID
//	//toStudentId:接收者的学生ID
//	//chatContent：发送的内容
//	@RequestMapping("sendmsg.action")
//	public ResponseEntity<Map> sendMsg(@PathVariable("fromStudnetid")String fromStudnetid,
//									   @PathVariable("toStudentId")String toStudentId,
//									   @PathVariable("chatContent")String chatContent){
//		Map map = new HashMap();
//		Map chatDate=new HashMap();
//		try {
//			chatDate.put("wsOpCode",5);
//			chatDate.put("chatContent",chatContent);
//			chatDate.put("toType",1);//1:表示用户  2：群组
//			chatDate.put("toTypeId",toStudentId);//接收者ID
//
//		} catch (Exception e) {
//			map.put("msg","发送消息失败");
//			map.put("status",0);
//			log.error("发送消息失败",e);
//		} finally {
//			map.put("msg","发送消息成功");
//			return ResponseEntity.ok(map);
//		}
//	}
//
//
//	/** 如果发送的消息包含图片需要进行转换，如<span>12312<img src="arclist/5.gif"><img src="arclist/26.gif"></span>
//	 * 正则表达式：<img src="arclist/([0-9]*).gif">
//	 *     替换表达式：[em_$1]
//	 *     替换结果：<span>12312[em_5][em_26]</span>
//	 */
//	public static String replace_htmlToEm(String str){
//		str = str.replaceAll("<img src=\"arclist/([0-9]*).gif\">", "[em_$1]");
//		return str;
//	}
//
//	public static void main(String[] args) {
//		String str="<span>12312<img src=\"arclist/5.gif\"><img src=\"arclist/26.gif\"></span>";
//		System.out.println(replace_htmlToEm(str));
//
//	}
}
