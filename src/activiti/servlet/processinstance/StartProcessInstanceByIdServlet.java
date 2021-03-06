package activiti.servlet.processinstance;

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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.bean.*;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.TaskQuery;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.service.interfaces.IClubService;
import com.community.service.interfaces.IDepartmentService;
import com.community.service.interfaces.IGroupMemberService;
import com.community.service.interfaces.IReceiptDetailService;
import com.community.service.interfaces.IReceiptOperLogService;
import com.community.service.interfaces.IReceiptService;
import com.community.service.interfaces.IStudentService;
import com.community.service.interfaces.ITaskService;

import activiti.common.ProcessEngineUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class StartProcessInstanceById
 */
@Controller
@RequestMapping("/process")
public class StartProcessInstanceByIdServlet{
    private static transient Log log = LogFactory.getLog(StartProcessInstanceByIdServlet.class);
	@Autowired
	IGroupMemberService groupMemberService;
	
	@Autowired
	IDepartmentService deparmentService;
	
	@Autowired
	IStudentService studentService;
	
	@Autowired
	IReceiptService receiptService;
	
	@Autowired
	IClubService clubService;
	
	@Autowired
	IReceiptDetailService receiptDetailService;
	
	@Autowired
	ITaskService taskService;

	@Autowired
	IReceiptOperLogService receiptOperLogService;
	
	@RequestMapping("/startprocess.action")
	@ResponseBody
	public Map<String, String>  StartProcess(HttpServletRequest request, HttpServletResponse response) throws Exception{

		/** 接收流程定义id */
		String pdId = request.getParameter("pdId");
		String receiptman_id = (String) request.getSession().getAttribute("userId");
		String receiptman_name = (String) request.getSession().getAttribute("userName");
		String clubId = (String) request.getSession().getAttribute("clubId");
		Float amount = Float.parseFloat(request.getParameter("amount"));
		String receipt_reason = request.getParameter("reason");
		String receiptObj = request.getParameter("receiptObj");
		JSONArray jsonArray = JSONArray.fromObject(receiptObj);
		JSONObject jsonObject;
		List<ReceiptDetail> receiptList = new ArrayList<ReceiptDetail>();
		SimpleDateFormat df = new SimpleDateFormat( "yyyy-MM-dd");
		for(int i = 0;i<jsonArray.size();i++){
			jsonObject = jsonArray.getJSONObject(i);
			String jsonString = jsonObject.toString();
			if(!(jsonString.equals("{}"))){
				ReceiptDetail receiptItem = new ReceiptDetail();
				String spendTimeStr = jsonArray.getJSONObject(i).getString("spendTime");
				Float cost = Float.parseFloat(jsonArray.getJSONObject(i).getString("cost"));
				String reason = jsonArray.getJSONObject(i).getString("reason");
				String detail = jsonArray.getJSONObject(i).getString("detail");
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
				receiptList.add(receiptItem);
			}
		}

		//获取社员所在部门
		String departmentId = groupMemberService.getDepartmentId(receiptman_id, clubId);

		//获取部门id获取部长（rank为2）学号作为第一审批人
        GroupMember auditor = groupMemberService.getAuditor(departmentId, clubId, 2);
        String one_autitor=null;
        if(auditor!=null){
            one_autitor = auditor.getStuNum();
        }else {
            log.error("获取部门id获取部长（rank为2）学号作为第一审批人 失败");
        }
		//会长学号（rank为3）作为第二审批人
        GroupMember auditor2 = groupMemberService.getAuditor("", clubId, 3);
        String second_autitor=null;
        if(auditor2!=null){
            second_autitor = auditor2.getStuNum();
        }else {
            log.error("获取部会长学号（rank为3）作为第二审批人 失败");
        }
		
		//财务学号作为第三审批人
        GroupMember auditor3 = groupMemberService.getAuditor("", clubId, 6);
        String third_autitor=null;
        if(auditor3!=null){
            third_autitor = auditor3.getStuNum();
        }else{
            log.error("获取财务学号作为第三审批人 失败");
        }

		Date submit_time = new Date();
		
		Receipt receiptBean = new Receipt();
		receiptBean.setReceiptman_id(receiptman_id);
		receiptBean.setReceiptman_name(receiptman_name);
		receiptBean.setClubId(clubId);
		receiptBean.setAmount(amount);
		receiptBean.setOne_autitor(one_autitor);
		receiptBean.setSecond_autitor(second_autitor);
		receiptBean.setThird_autitor(third_autitor);
		receiptBean.setSubmit_time(submit_time);
		receiptBean.setReason(receipt_reason);
		receiptBean.setState(0);


		/** 获取流程引擎 */
		ProcessEngine pe = ProcessEngineUtils.getProcessEngine();
		/** 获取RuntimeService */
		RuntimeService rs = pe.getRuntimeService();

		//设置流程变量
		Map<String, Object> map = new HashMap<String,Object>();


		//第一个节点流程变量需要启动时就要设置
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("one_autitor",one_autitor);

		/**设置邮件相关的流程变量 */
	/*	params.put("to", "z1039230702@163.com");
		params.put("from", "fkjava8888@163.com");
		params.put("subject", "订单审核-通知");*/
		params.put("status", 2);

		/** 根据流程定义id开启流程实例 */
		ProcessInstance pi = rs.startProcessInstanceById(pdId,params);
		System.out.println(pi);
		String taskId = taskService.getTaskId(pi.getId());
		receiptBean.setTaskId(taskId);
		receiptBean.setProc_inst_id(pi.getId());
		receiptService.insertReceipt(receiptBean);
		//保存报销单明细
		receiptDetailService.saveReceiptDetail(receiptList);
		
		//保存操作日志
		ReceiptOperLog OperLogInfo = new ReceiptOperLog();
		OperLogInfo.setProc_inst_id(pi.getId());
		OperLogInfo.setOper_name(receiptman_name);
		OperLogInfo.setOper_time(new Date());
		OperLogInfo.setOper_type(0);
		OperLogInfo.setReceipt_type(receipt_reason);
		receiptOperLogService.saveOperInfo(OperLogInfo);

		//第二个节点可以启动好之后设置流程变量
		//rs.setVariable(pi.getId(), "one_autitor", "1515200005");

		/*获取流程变量*/
		//System.out.println(rs.getVariable(pi.getId(), "userId"));
		//System.out.println(rs.getVariables(pi.getId()));
		
		//request.setAttribute("reqpiId", pi.getId());
		//返回报销实例id和审批人姓名
		String oneAutName = studentService.getStudentInfoById(one_autitor).getStuName();
		String secAuName = studentService.getStudentInfoById(second_autitor).getStuName();
		
		Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("piId", pi.getId());
		resultMap.put("oneAutName", oneAutName);
		resultMap.put("secAuName", secAuName);
		
		return resultMap;

		/** 转发到查看流程图 */
		//response.sendRedirect(request.getContextPath()+"/seeProcessdiagram.action?piId="+pi.getId());
/*		request.getRequestDispatcher("seeProcessdiagram.action").forward(request, response);*/
	}
	

}
