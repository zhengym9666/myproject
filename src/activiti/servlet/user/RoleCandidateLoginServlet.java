package activiti.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/roleCandidateLogin.action")
public class RoleCandidateLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		String pwd = request.getParameter("password");
		
		/**
		 * 把用户存入session
		 */
		request.getSession().setAttribute("session_user", userId);
		
		/**
		 * 重定向到查询用户任务的Servlet
		 */
		response.sendRedirect(request.getContextPath()+"/queryUserInRoleClaimTask.action");
	}

}
