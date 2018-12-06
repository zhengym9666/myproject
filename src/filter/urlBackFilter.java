package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class urlBackFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("初始化第二个过滤器");
	}
	
	@Override
	public void doFilter(ServletRequest ServletRequestRequest, ServletResponse ServletResponse, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) ServletRequestRequest;
		HttpServletResponse response = (HttpServletResponse) ServletResponse;
		
		String targetUrl = request.getServletPath();
		System.out.println("targetUrl:"+targetUrl);
		request.getRequestDispatcher(targetUrl).include(request, response);
	}
}
