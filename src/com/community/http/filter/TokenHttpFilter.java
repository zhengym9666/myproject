package com.community.http.filter;

import com.community.bean.Student;
import com.community.model.base.HOpCodeUCenter;
import com.community.model.base.Token;
import com.community.model.base.UCErrorPack;
import com.community.model.base.UCErrorPack;
import com.community.protobuf.UCErrorProto.UCErrorCode;
import com.community.protobuf.UCErrorProto.UCError;
import com.community.service.impl.TokenServiceImpl;
import com.community.service.interfaces.IGroupMemberService;
import com.community.service.interfaces.IStudentService;
import com.community.service.interfaces.ITokenService;
import com.community.web.TokenAction;
import com.community.web.UserAction;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit;
import java.util.Date;

/**
 * @ClassName:
 * @Description: 身份认证拦截器
 * @author linyb3
 * @date
 */

public class TokenHttpFilter implements HandlerInterceptor {
    private static transient Log log = LogFactory.getLog(TokenHttpFilter.class);
    @Autowired
    IStudentService studentService;
    @Autowired
    private ITokenService tokenService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        boolean flag;
        log.error("我是前置方法");
        Student student = null;
        try {
            //获取请求地址
            String getServletPath =request.getServletPath();
            //如果是登录接口，不进行拦截
            if(getServletPath.contains("LoginAction.action") || getServletPath.contains("queryNewsPage.action")){
                return true;
            }
            //先检测聊天系统是否有toekn
            String tokenStr= (String) request.getHeader("token");
            if(tokenStr==null || tokenStr.length()==0){
                //如果聊天系统不传token，说明是自己用户登录，不需要，则检查session的token是否正确。
                tokenStr = (String) request.getSession().getAttribute("token");
            }
            if (tokenStr==null || tokenStr.length()==0) {
                // 不可以通过
                //UCError errorPack = UCErrorPack.create(UCErrorCode.ERROR_CODE_2, httpPacket.hSession.headParam.hOpCode);
                //throw new HttpException(HOpCodeUCenter.UC_ERROR, errorPack);
                log.info("该请求token不许为空");
                //return false;
                throw new Exception("该请求token不许为空");
            }
            Token token = tokenService.getTokenById(tokenStr);
            if (token == null) {
                //UCError errorPack = UCErrorPack.create(UCErrorCode.ERROR_CODE_1, httpPacket.hSession.headParam.hOpCode);
                //throw new HttpException(HOpCodeUCenter.UC_ERROR, errorPack);
                log.info("该token已过期或不合法");
                //return false;
                throw new Exception("该token已过期或不合法");
            }
            Date date = new Date();
            // token过期
            if (date.getTime() > token.getTokenExpireTime().getTime()) {
                tokenService.deleteToken(token.getTokenId());
                //UCError errorPack = UCErrorPack.create(UCErrorCode.ERROR_CODE_1, httpPacket.hSession.headParam.hOpCode);
                //throw new HttpException(HOpCodeUCenter.UC_ERROR, errorPack);
                log.info("该token已过期或不合法");
                //return false;
                throw new Exception("该token已过期或不合法");
            } else {
                tokenService.updateToken(token.getTokenId());
            }
            student = studentService.getStudentInfoById(token.getUserId());
            if (student == null) {
                //UCError errorPack = UCErrorPack.create(UCErrorCode.ERROR_CODE_4, httpPacket.hSession.headParam.hOpCode);
                //throw new HttpException(HOpCodeUCenter.UC_ERROR, errorPack);
                log.info("不存在这个用户");
                //return false;
                throw new Exception("不存在这个用户");
            }
            request.getSession().setAttribute("student",student);
            request.getSession().setAttribute("token",tokenStr);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            //防止iframe跟重定向跳转问题，需要手动使用html的target跳转整个页面

            response.sendRedirect(request.getContextPath()+"/front/index.jsp?isLogin=1");
            /*log.error("==121212===============2112121==========================");
            java.io.PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<script>");
            //out.println("if (window != top) ");
            //out.println("top.location.href = '"+request.getContextPath()+"/front/index.jsp?isLogin=1;'");
            out.println("window.open('"+request.getContextPath()+"/front/index.jsp?isLogin=1','_top');");
            out.println("</script>");
            out.println("</html>");*/
            return false;
        }finally {

        }
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
