package activiti.servlet.user;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.bean.FeeBudgetLog;
import com.community.bean.Receipt;
import com.community.service.interfaces.IFeeBudgetLogService;
import com.community.service.interfaces.IFeeService;
import com.community.service.interfaces.IReceiptService;
import com.community.service.interfaces.ITaskService;

import activiti.common.ProcessEngineUtils;

/**
 * Servlet implementation class QueryUserTaskServlet
 */
@Controller
@RequestMapping("/activiti")
public class CompleteUserTaskServlet{
	
	@Autowired
	IReceiptService receiptService;
	
	@Autowired
	ITaskService taskService;
	
	@Autowired
	IFeeService feeService;
	
	@Autowired
	IFeeBudgetLogService feeBudgetLogService;
       
	@RequestMapping("/completeAudit.action")
	public void completeAudit(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
		/*获取任务id*/
		String taskId = request.getParameter("tid");
		
		String state = request.getParameter("state");
		
		/*获取流程引擎*/
		ProcessEngine pe = ProcessEngineUtils.getProcessEngine();
		
		/*获取TaskService任务服务接口*/
		TaskService ts = pe.getTaskService();
		
		//获取当前审批处于哪个级别
		Integer rank = Integer.parseInt((String) request.getSession().getAttribute("rank"));
		
		//根据任务id获取审批人信息
		Receipt receiptInfo = receiptService.getReceiptByTaskId(taskId);
		
		Map<String, Object> params = new HashMap<>();
		if(rank==2){
			//部长审批，设置第二审批人（会长）为流程变量
			params.put("second_autitor", receiptInfo.getSecond_autitor());
		}else if(rank==3){
			//会长审批完后，设置第三审批人（财务）为流程变量
			params.put("third_autitor", receiptInfo.getThird_autitor());
		}
	
		//完成任务之前获取该任务id对应的实例id
		String proc_inst_id = receiptService.getReceiptByTaskId(taskId).getProc_inst_id();
		
		/*完成任务*/
		ts.complete(taskId, params);//完成任务之后，对应的taskId也会修改		
		
		//修改报销表的审批状态和审批时间和taskId,taskId是从act_ru_task表中动态获取
		Integer nextState = Integer.parseInt(state)+1;
		Date lastaudit_time = new Date();
		receiptService.auditReceipt(nextState,proc_inst_id,lastaudit_time);
		
		if(rank==6){
			//如果是财务审批完，即时更新会费
			FeeBudgetLog logInfo = new FeeBudgetLog();
			String clubId = (String)request.getSession().getAttribute("clubId");
			logInfo.setClubId(clubId);
			logInfo.setBudget_time(new Date());
			logInfo.setBudget_status(1);
			logInfo.setBudgeter(receiptInfo.getReceiptman_id());
			logInfo.setReason("活动报销");
			logInfo.setBudget(receiptInfo.getAmount());
			logInfo.setFinancial((String)request.getSession().getAttribute("userId"));
			logInfo.setRemainMoney(feeService.getFeeInfoById(clubId).getTotalFee()-logInfo.getBudget());
			try {
				feeBudgetLogService.addBudgetLog(logInfo);
				feeService.updateTotalFee(clubId, logInfo.getRemainMoney());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		request.getRequestDispatcher("/activiti/queryUserTask.action").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/activiti/queryUserTask.action");
	}
}
