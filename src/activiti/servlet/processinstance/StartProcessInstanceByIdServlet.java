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

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.bean.Department;
import com.community.bean.Receipt;
import com.community.bean.ReceiptDetail;
import com.community.bean.Student;
import com.community.service.interfaces.IClubService;
import com.community.service.interfaces.IDepartmentService;
import com.community.service.interfaces.IGroupMemberService;
import com.community.service.interfaces.IReceiptDetailService;
import com.community.service.interfaces.IReceiptService;
import com.community.service.interfaces.IStudentService;

import activiti.common.ProcessEngineUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class StartProcessInstanceById
 */
@Controller
@RequestMapping("/process")
public class StartProcessInstanceByIdServlet{
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
	
       
	@RequestMapping("/startprocess.action")
	public void StartProcess(HttpServletRequest request, HttpServletResponse response){

		
		/** 接收流程定义id */
		String pdId = request.getParameter("pdId");
		String receiptman_id = request.getParameter("receiptman_id");
		String receiptman_name = request.getParameter("receiptman_name");
		String clubId = request.getParameter("clubId");
		Integer amount = Integer.parseInt(request.getParameter("amount"));
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
				Integer cost = Integer.parseInt(jsonArray.getJSONObject(i).getString("cost"));
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
		
		//根据部门编号获取部门信息
		Department deptInfo = deparmentService.queryDepartmentById(departmentId);
		
		//获取部长名字作为第一审批人
		String one_autitor = deptInfo.getMinister_name();
		
		//获取社团会长编号
		//String generalId = clubService.getGeneralIdByClubId(clubId);	
		
		//获取会长信息
		//Student generalInfo = studentService.getStudentInfoById(generalId);
		Student generalInfo = studentService.getGeneralInfoByClubId(clubId);
		//将会长名字作为第二审批人
		String second_autitor = generalInfo.getStuName();
		
		Date submit_time = new Date();
		
		Receipt receiptBean = new Receipt();
		receiptBean.setReceiptman_id(receiptman_id);
		receiptBean.setReceiptman_name(receiptman_name);
		receiptBean.setClubId(clubId);
		receiptBean.setAmount(amount);
		receiptBean.setOne_autitor(one_autitor);
		receiptBean.setSecond_autitor(second_autitor);
		receiptBean.setSubmit_time(submit_time);
		
		//receiptService.insertReceipt(receiptBean);
		receiptDetailService.saveReceiptDetail(receiptList);
		
				
		/** 获取流程引擎 */
		ProcessEngine pe = ProcessEngineUtils.getProcessEngine();
		/** 获取RuntimeService */
		RuntimeService rs = pe.getRuntimeService();
		
		//设置流程变量
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("day", 3);
		
		//第一个节点流程变量需要启动时就要设置
		Map<String, Object> params = new HashMap<String,Object>();
		//params.put("userId1", "test2");
		
		/**设置邮件相关的流程变量 */
	/*	params.put("to", "z1039230702@163.com");
		params.put("from", "fkjava8888@163.com");
		params.put("subject", "订单审核-通知");*/
		params.put("status", 2);
		
		/** 根据流程定义id开启流程实例 */
		/*ProcessInstance pi = rs.startProcessInstanceById(pdId);
		System.out.println(pi);
		*/
		//第二个节点可以启动好之后设置流程变量
		//rs.setVariable(pi.getId(), "userId2", "test4");
		
		/*获取流程变量*/
		//System.out.println(rs.getVariable(pi.getId(), "userId"));
		//System.out.println(rs.getVariables(pi.getId()));
		
		//request.setAttribute("reqpiId", pi.getId());
		
		/*Map<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("result", pi.getId());
		
		PrintWriter writer = response.getWriter();
		try {
			writer.print(JSONObject.fromObject(resultMap));
			writer.flush();
			writer.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		/** 转发到查看流程图 */
		//response.sendRedirect(request.getContextPath()+"/seeProcessdiagram.action?piId="+pi.getId());
/*		request.getRequestDispatcher("seeProcessdiagram.action").forward(request, response);*/
	}
	

}
