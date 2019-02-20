package com.community.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.bean.Receipt;
import com.community.bean.ReceiptDetail;
import com.community.bean.ReceiptOperLog;
import com.community.service.interfaces.IClubService;
import com.community.service.interfaces.IReceiptDetailService;
import com.community.service.interfaces.IReceiptOperLogService;
import com.community.service.interfaces.IReceiptService;
import com.community.service.interfaces.IStudentService;
import com.community.util.PageBean;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��2��14�� ����10:36:05
* @version 1.0 
* @desrciption		
*/
@Controller
@RequestMapping("/receipt")
public class ReceiptAction {
	
	@Autowired
	IReceiptOperLogService ReceiptOperLogService;
	
	@Autowired
	IClubService clubService;
	
	@Autowired
	IReceiptService receiptService;
	
	@Autowired
	IReceiptDetailService receiptDetailService;
	
	@Autowired
	IStudentService studentService;
	
	@RequestMapping("/queryAllReceipt.action")
	public String queryAllReceipt(HttpServletRequest request,HttpServletResponse response) throws Exception, IOException{
		
		String clubId = (String) request.getSession().getAttribute("clubId");
		String receiptman_id = (String) request.getSession().getAttribute("userId");
		String currentPage0 = request.getParameter("currentPage");
		int currentPage;
		
		if("".equals(currentPage0)||null==currentPage0){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(currentPage0);
		}
		
		int pageSize = 4;
		
		//��ȡ��������
		String clubName = clubService.getClubById(clubId).getName();
		
		PageBean PageOperLog = ReceiptOperLogService.queryAllOperInfo(receiptman_id, clubId,currentPage,pageSize);
		
		request.setAttribute("PageOperLog", PageOperLog);
		request.setAttribute("clubName", clubName);
		
		return "forward:/front/receipt/receiptInfo.jsp";
	}
	
	@RequestMapping("/lookOneReceipt.action")
	public void LookOneReceipt(HttpServletRequest request,HttpServletResponse response) throws Exception, IOException{
		
		String  procInstId = request.getParameter("procInstId");
		int backPageId = Integer.parseInt(request.getParameter("backPage"));
		
		//��ȡ������Ϣ
		Receipt oneReceiptInfo = receiptService.queryOneReceiptByProcInstId(procInstId);
		HashMap<String,Object> oneReceiptMap = new HashMap<String,Object>();
		
		//����state�ж���һ������
		String next_autitor = null;
		Integer state = oneReceiptInfo.getState();
		if(state==0){
			next_autitor = studentService.getStudentInfoById(oneReceiptInfo.getOne_autitor()).getStuName();
		}else if(state==1 || state==-1){
			next_autitor = studentService.getStudentInfoById(oneReceiptInfo.getSecond_autitor()).getStuName();
		}else if(state==2 || state==-2){
			next_autitor = studentService.getStudentInfoById(oneReceiptInfo.getThird_autitor()).getStuName();
		}
		
		//��ȡ��������
		String clubName = clubService.getClubById(oneReceiptInfo.getClubId()).getName();
		
		//��Ϸ��ر�������Ϣ
		oneReceiptMap.put("stuNum", oneReceiptInfo.getReceiptman_id());
		oneReceiptMap.put("stuName", oneReceiptInfo.getReceiptman_name());
		oneReceiptMap.put("clubName", clubName);
		oneReceiptMap.put("reason", oneReceiptInfo.getReason());
		oneReceiptMap.put("amount", oneReceiptInfo.getAmount());
		oneReceiptMap.put("state", oneReceiptInfo.getState());
		oneReceiptMap.put("next_autitor", next_autitor);
		oneReceiptMap.put("one_autitor", studentService.getStudentInfoById(oneReceiptInfo.getOne_autitor()).getStuName());
		oneReceiptMap.put("second_autitor", studentService.getStudentInfoById(oneReceiptInfo.getSecond_autitor()).getStuName());
		oneReceiptMap.put("third_autitor", studentService.getStudentInfoById(oneReceiptInfo.getThird_autitor()).getStuName());
		oneReceiptMap.put("procInstId", procInstId);
		oneReceiptMap.put("audit_suggest", oneReceiptInfo.getAudit_suggest());
	
		//��ȡ������ϸ
		List<ReceiptDetail> detailList = receiptDetailService.queryReceiptDetailByProcInstId(procInstId);
		
		request.setAttribute("oneReceiptMap", oneReceiptMap);
		request.setAttribute("detailList", detailList);
		request.setAttribute("backPageId", backPageId);
		request.getRequestDispatcher("/front/receipt/lookReceipt.jsp").forward(request, response);
	}
	
	@RequestMapping("/reviseOneReceipt.action")
	public void ReviseOneReceipt(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		
		String procInstId = request.getParameter("procInstId");
		
		//��ȡ������Ϣ
		Receipt oneReceiptInfo = receiptService.queryOneReceiptByProcInstId(procInstId);
		
		//��ȡ������ϸ
		List<ReceiptDetail> detailList = receiptDetailService.queryReceiptDetailByProcInstId(procInstId);
		
		request.setAttribute("oneReceiptInfo", oneReceiptInfo);
		request.setAttribute("detailList", detailList);
		request.setAttribute("procInstId", procInstId);
		request.getRequestDispatcher("/front/receipt/reviseReceipt.jsp").forward(request, response);
		
	}
	
	@RequestMapping("/submitReviseReceipt.action")
	public void submitReviseReceipt(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		String procInstId = request.getParameter("procInstId");
		Integer amount = Integer.parseInt(request.getParameter("amount"));
		String receipt_reason = request.getParameter("reason");
		String receiptObj = request.getParameter("receiptObj");
		JSONArray jsonArray = JSONArray.fromObject(receiptObj);
		JSONObject jsonObject;
		List<ReceiptDetail> detailList = new ArrayList<ReceiptDetail>();
		SimpleDateFormat df = new SimpleDateFormat( "yyyy-MM-dd");
		//�޸�ʱ��
		Date revise_time = new Date();
		for(int i = 0;i<jsonArray.size();i++){
			jsonObject = jsonArray.getJSONObject(i);
			String jsonString = jsonObject.toString();
			if(!(jsonString.equals("{}"))){
				ReceiptDetail receiptItem = new ReceiptDetail();
				String spendTimeStr = jsonArray.getJSONObject(i).getString("spendTime");
				Integer cost = Integer.parseInt(jsonArray.getJSONObject(i).getString("cost"));
				String reason = jsonArray.getJSONObject(i).getString("reason");
				String detail = jsonArray.getJSONObject(i).getString("detail");
				Integer receiptItemId = Integer.parseInt(jsonArray.getJSONObject(i).getString("receiptItemId"));
				Date spendTime = new Date();
				try {
					spendTime = df.parse(spendTimeStr);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				receiptItem.setSpend_time(spendTime);
				receiptItem.setCost(cost);
				receiptItem.setReason(reason);
				receiptItem.setDetail(detail);
				receiptItem.setReceipt_item_id(receiptItemId);
				detailList.add(receiptItem);
			}
		}
		
		//���±�����
		receiptService.updateOneReceiptByProcInstId(receipt_reason, amount,revise_time,procInstId);
		
		//���±��������
		receiptDetailService.updateDetail(detailList, procInstId);
		
		//��Ӳ�����־
		//��ȡ����������
		ReceiptOperLog operLogInfo = new ReceiptOperLog();
		String oper_name = receiptService.queryOneReceiptByProcInstId(procInstId).getReceiptman_name();
		operLogInfo.setOper_name(oper_name);
		operLogInfo.setOper_time(new Date());
		operLogInfo.setOper_type(4);
		operLogInfo.setProc_inst_id(procInstId);
		operLogInfo.setReceipt_type(receipt_reason);
		ReceiptOperLogService.saveOperInfo(operLogInfo);
		
		//�����޸ĳɹ���Ϣ
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//������һ�����˼���һ������
		String oneAuditor = studentService.getStudentInfoById(receiptService.queryOneReceiptByProcInstId(procInstId).getOne_autitor()).getStuName();
		resultMap.put("amount", amount);
		resultMap.put("oneAuditor", oneAuditor);
		resultMap.put("piId", procInstId);
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		try {
			writer.print(JSONObject.fromObject(resultMap));
			writer.flush();
			writer.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/revokeReceipt.action")
	public void revokeReceipt(HttpServletRequest request,HttpServletResponse response) throws Exception, IOException{
		
		String procInstId = request.getParameter("procInstId");
		
		//�޸ı���������״̬
		receiptService.revokeOneReceiptByProcInstId(4, procInstId);
		
		//��Ӳ�����־��
		ReceiptOperLog operLogInfo = new ReceiptOperLog();
		String oper_name = receiptService.queryOneReceiptByProcInstId(procInstId).getReceiptman_name();
		String receipt_reason = receiptService.queryOneReceiptByProcInstId(procInstId).getReason();
		operLogInfo.setOper_name(oper_name);
		operLogInfo.setOper_time(new Date());
		operLogInfo.setOper_type(5);
		operLogInfo.setProc_inst_id(procInstId);
		operLogInfo.setReceipt_type(receipt_reason);
		ReceiptOperLogService.saveOperInfo(operLogInfo);
		
		request.getRequestDispatcher("/receipt/queryAllReceipt.action").forward(request, response);
	}
	
	@RequestMapping("/rejectReceipt.action")
	public void RejectReceipt(HttpServletRequest request,HttpServletResponse response) throws Exception, IOException{
		
		String procInstId = request.getParameter("procInstId");
		String audit_suggest = request.getParameter("audit_suggest");
		
		//�жϵ�ǰ���������ڼ�������
		Receipt receiptInfo = receiptService.queryOneReceiptByProcInstId(procInstId);
		Integer state = receiptInfo.getState();
		String oper_name = null;
		int oper_type = 0;
		if(state==0){
			state = -1;
			oper_name = studentService.getStudentInfoById(receiptInfo.getOne_autitor()).getStuName();
			oper_type = -1;
		}else if(state==1){
			state = -2;
			oper_name = studentService.getStudentInfoById(receiptInfo.getSecond_autitor()).getStuName();
			oper_type = -2;
		}else if(state==2){
			state = -3;
			oper_name = studentService.getStudentInfoById(receiptInfo.getThird_autitor()).getStuName();
			oper_type = -3;
		}
		
		//�޸ı�����״̬
		receiptService.rejectOneReceiptByProcInstId(state, audit_suggest, procInstId);
		
		//��Ӳ�����־��
		ReceiptOperLog operLogInfo = new ReceiptOperLog();
		String receipt_reason = receiptService.queryOneReceiptByProcInstId(procInstId).getReason();
		operLogInfo.setOper_name(oper_name);
		operLogInfo.setOper_type(oper_type);
		operLogInfo.setOper_time(new Date());
		operLogInfo.setProc_inst_id(procInstId);
		operLogInfo.setReceipt_type(receipt_reason);
		
		ReceiptOperLogService.saveOperInfo(operLogInfo);
		
		request.getRequestDispatcher("/activiti/queryUserTask.action").forward(request, response);
		
	}
}
