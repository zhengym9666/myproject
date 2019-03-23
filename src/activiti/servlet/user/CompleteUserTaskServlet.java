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
		/*��ȡ����id*/
		String taskId = request.getParameter("tid");
		
		String state = request.getParameter("state");
		
		/*��ȡ��������*/
		ProcessEngine pe = ProcessEngineUtils.getProcessEngine();
		
		/*��ȡTaskService�������ӿ�*/
		TaskService ts = pe.getTaskService();
		
		//��ȡ��ǰ���������ĸ�����
		Integer rank = Integer.parseInt((String) request.getSession().getAttribute("rank"));
		
		//��������id��ȡ��������Ϣ
		Receipt receiptInfo = receiptService.getReceiptByTaskId(taskId);
		
		Map<String, Object> params = new HashMap<>();
		if(rank==2){
			//�������������õڶ������ˣ��᳤��Ϊ���̱���
			params.put("second_autitor", receiptInfo.getSecond_autitor());
		}else if(rank==3){
			//�᳤����������õ��������ˣ�����Ϊ���̱���
			params.put("third_autitor", receiptInfo.getThird_autitor());
		}
	
		//�������֮ǰ��ȡ������id��Ӧ��ʵ��id
		String proc_inst_id = receiptService.getReceiptByTaskId(taskId).getProc_inst_id();
		
		/*�������*/
		ts.complete(taskId, params);//�������֮�󣬶�Ӧ��taskIdҲ���޸�		
		
		//�޸ı����������״̬������ʱ���taskId,taskId�Ǵ�act_ru_task���ж�̬��ȡ
		Integer nextState = Integer.parseInt(state)+1;
		Date lastaudit_time = new Date();
		receiptService.auditReceipt(nextState,proc_inst_id,lastaudit_time);
		
		if(rank==6){
			//����ǲ��������꣬��ʱ���»��
			FeeBudgetLog logInfo = new FeeBudgetLog();
			String clubId = (String)request.getSession().getAttribute("clubId");
			logInfo.setClubId(clubId);
			logInfo.setBudget_time(new Date());
			logInfo.setBudget_status(1);
			logInfo.setBudgeter(receiptInfo.getReceiptman_id());
			logInfo.setReason("�����");
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
