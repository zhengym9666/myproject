import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName:
 * @Description: 身份认证拦截器
 * @author linyb3
 * @date
 */
/***
 * @Author linyb3
 * @Title:
 * @Description:
 * @Date 2019/2/17 20:57
 * @param
 * @return
 * getContextPath:/ori<br>
 * basePath:http://localhost:8080/ori/<br>
 * getRemoteAddress:0:0:0:0:0:0:0:1<br>
 * getServletPath:/news/newscontent.action<br>
 * getServletContext_getRealPath:D:\idea_coder\ori\out\artifacts\ori_war_exploded\<br>
 * getRequestURL:http://localhost:8080/ori/news/newscontent.action<br>
 * getRequestURI:/ori/news/newscontent.action<br>
 * getQueryString:null<br>
 * getRemoteUser:null<br>
 */
public class TokenHttpFilter implements HandlerInterceptor {
    private static transient Log log = LogFactory.getLog(TokenHttpFilter.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o) throws Exception {
        log.error("我是前置方法");
        String getContextPath = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+getContextPath+"/";
        String getRemoteAddress=request.getRemoteAddr();
        String getServletPath =request.getServletPath();
        String getServletContext_getRealPath =request.getServletContext().getRealPath("/");
        String getRequestURL =request.getRequestURL().toString();
        String getRequestURI =request.getRequestURI();
        String getQueryString =request.getQueryString();
        String getRemoteUser =request.getRemoteUser();
        System.out.println("getContextPath:"+ getContextPath +"<br>");
        System.out.println("basePath:"+basePath+"<br>");
        System.out.println("getRemoteAddress:"+ getRemoteAddress +"<br>");
        System.out.println("getServletPath:"+ getServletPath +"<br>");
        System.out.println("getServletContext_getRealPath:"+ getServletContext_getRealPath +"<br>");
        System.out.println("getRequestURL:"+ getRequestURL +"<br>");
        System.out.println("getRequestURI:"+ getRequestURI +"<br>");
        System.out.println("getQueryString:"+ getQueryString +"<br>");
        System.out.println("getRemoteUser:"+ getRemoteUser +"<br>");
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        log.error("我是后置方法方法，在action之后");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        log.error("我是完成方法，如果前置为true，这里必会执行");
    }


}
