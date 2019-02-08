package activiti.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.bean.GroupMember;
import com.community.bean.Student;
import com.community.service.interfaces.IGroupMemberService;
import com.community.service.interfaces.IStudentService;

/**
 * Servlet implementation class LoginServlet
 */
@Controller
@RequestMapping("/login")
public class LoginServlet{
	
	@Autowired
	IStudentService studentService;
	
	@Autowired
	IGroupMemberService groupMemberService;
       
	@RequestMapping("/LoginAction.action")
	public void LoginAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("password");
		String clubId = request.getParameter("clubId");
		
		Student student = studentService.getStudentInfoById(userId);
		/**
		 * 把用户存入session
		 */
		request.getSession().setAttribute("userId", userId);
		request.getSession().setAttribute("userName", student.getStuName());
		request.getSession().setAttribute("clubId", clubId);
		
		GroupMember memberInfo = groupMemberService.queryMemberInfo(userId, clubId);
		request.getSession().setAttribute("rank", memberInfo.getRank());
		/**
		 * 重定向到查询用户任务的Servlet
		 */
		response.sendRedirect(request.getContextPath()+"/front/index.jsp");
		//request.getRequestDispatcher("/activiti/queryUserTask.action").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/activiti/queryUserTask.action");
	}

}
