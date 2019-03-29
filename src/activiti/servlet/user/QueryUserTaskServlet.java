package activiti.servlet.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.bean.Audit;
import com.community.bean.Receipt;
import com.community.service.interfaces.IDepartmentService;
import com.community.service.interfaces.IGroupMemberService;
import com.community.service.interfaces.IReceiptService;
import com.community.util.PageBean;

import activiti.common.ProcessEngineUtils;

/**
 * Servlet implementation class QueryUserTaskServlet
 */
@Controller
@RequestMapping("/activiti")
public class QueryUserTaskServlet{
	
	@Autowired
	IReceiptService receiptService;
	
	@Autowired
	IGroupMemberService groupMemberService;
	
	@Autowired
	IDepartmentService departmentService;

    @RequestMapping("/queryUserTask.action")
	public void queryUserTask(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = (String) request.getSession().getAttribute("userId");
		String clubId = (String) request.getSession().getAttribute("clubId");
		String currentPage0 = request.getParameter("currentPage");
		int currentPage;
		
		if("".equals(currentPage0)||null==currentPage0){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(currentPage0);
		}
		
		int pageSize = 5;
		/*获取流程引擎*/
		ProcessEngine pe = ProcessEngineUtils.getProcessEngine();
		
		/*获取TaskService任务服务接口*/
		TaskService ts = pe.getTaskService();
		
		/*创建任务查询对象*/
		TaskQuery tq = ts.createTaskQuery();
		
		/*根据任务处理来查询任务*/
		List<Task> taskList = tq.taskAssignee(userId).//添加任务处理人作为查询条件
		list();
		
		//查看审批人级别
		Integer rank = (Integer) request.getSession().getAttribute("rank");
		PageBean pageAudit = new PageBean();
		if(rank==2){
			pageAudit = receiptService.queryReceiptByOneId(clubId,userId,0,currentPage,pageSize);
		}else if(rank==3){
			pageAudit = receiptService.queryReceiptBySecondId(clubId, userId,1,currentPage,pageSize);
		}
		
		//根据审批人id查询所有待审批报销
		//List<Receipt> allAuditList = receiptService.queryReceiptByOneId(one_autitor);
		
		ArrayList<Object> auditList = new ArrayList<>();
		List<Receipt> receiptList = pageAudit.getData();
		for(Receipt item:receiptList){
			Audit auditBean = new Audit();
			auditBean.setTaskId(item.getTaskId());
			auditBean.setAuditNum(item.getReceiptman_id());
			auditBean.setAuditName(item.getReceiptman_name());
			String department  = departmentService.queryDepartmentById(groupMemberService.getDepartmentId(item.getReceiptman_id(), item.getClubId())).getName();
			auditBean.setDepartment(department);
			auditBean.setTime(item.getSubmit_time());
			auditBean.setReason(item.getReason());
			auditBean.setTotal(item.getAmount());
			auditBean.setState(item.getState());
			auditBean.setProcInstId(item.getProc_inst_id());
			auditList.add(auditBean);
		}
		request.setAttribute("auditList", auditList);
		request.setAttribute("pageAudit", pageAudit);
		request.getRequestDispatcher("/front/receipt/auditPage.jsp").forward(request, response);;
		
	}
    
    @RequestMapping("queryCompletedAuditTask.action")
    public void queryCompletedAuditTask(HttpServletRequest request,HttpServletResponse response) throws Exception, IOException{
    	String userId = (String) request.getSession().getAttribute("userId");
		String clubId = (String) request.getSession().getAttribute("clubId");
		String currentPage0 = request.getParameter("currentPage");
		int currentPage;
		
		if("".equals(currentPage0)||null==currentPage0){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(currentPage0);
		}
		
		int pageSize = 5;
		
		
		//通过审批人的不同级别查看已完成的审批单
		Integer rank = (Integer) request.getSession().getAttribute("rank");
		PageBean pageCompletedAudit = new PageBean();
		if(rank==2){ 
			pageCompletedAudit = receiptService.queryCompletedAuditByOneId(clubId, userId, 1,currentPage,pageSize);
		}else if(rank==3){
			pageCompletedAudit = receiptService.queryCompletedAuditBySecondId(clubId, userId,2,currentPage,pageSize);
		}
		ArrayList<Object> auditedList = new ArrayList<>();
		List<Receipt> completedAuditList = pageCompletedAudit.getData();
		for(Receipt item:completedAuditList){
			Audit completedAuditBean = new Audit();
			completedAuditBean.setAuditNum(item.getReceiptman_id());
			completedAuditBean.setAuditName(item.getReceiptman_name());
			String department = departmentService.queryDepartmentById(groupMemberService.getDepartmentId(item.getReceiptman_id(), item.getClubId())).getName();
			completedAuditBean.setDepartment(department);
			completedAuditBean.setTime(item.getSubmit_time());
			completedAuditBean.setReason(item.getReason());
			completedAuditBean.setTotal(item.getAmount());
			if(null==item.getAudit_suggest()){
				
			}else{
				completedAuditBean.setAudit_suggest(item.getAudit_suggest());
			}
			completedAuditBean.setState(item.getState());
			auditedList.add(completedAuditBean);
		}
		request.setAttribute("auditedList", auditedList);
		request.setAttribute("pageCompletedAudit", pageCompletedAudit);
		request.getRequestDispatcher("/front/receipt/auditedPage.jsp").forward(request, response);
    }
}
