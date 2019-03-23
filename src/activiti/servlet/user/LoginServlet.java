package activiti.servlet.user;


import com.alibaba.fastjson.JSON;
import com.community.config.UserConfig;
import com.community.model.base.HOpCodeUCenter;
import com.community.model.base.Token;
import com.community.model.base.UCErrorPack;
import com.community.model.base.User;
import com.community.service.impl.TokenServiceImpl;
import com.community.service.interfaces.ITokenService;
import com.community.util.EntityToJsonUtil;
import com.community.util.TimeUtils;
import com.community.web.TokenAction;
import com.community.web.UserAction;
import com.googlecode.protobuf.format.JsonFormat;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.bean.GroupMember;
import com.community.bean.Student;
import com.community.service.interfaces.IGroupMemberService;
import com.community.service.interfaces.IStudentService;
import com.community.protobuf.UCErrorProto.UCError;
import com.community.protobuf.UCErrorProto.UCErrorCode;
import com.community.protobuf.UserGroupProto.GetTokenS;
import com.community.protobuf.UserGroupProto.UpdateTokenS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;


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

	@Autowired
	private ITokenService tokenService;

	static JsonFormat jsonFormat = new JsonFormat();
    private static transient Log log = LogFactory.getLog(LoginServlet.class);

	/*@RequestMapping("/LoginAction.action")
	public void LoginAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        //response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        JSONObject returnJson = new JSONObject();
        returnJson.put("status", 1);
        returnJson.put("msg","123");
        response.getWriter().println(returnJson);
	}*/
	@RequestMapping("/LoginAction.action")
	public void LoginAction(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        UCError ucError;
		String userId = request.getParameter("username");
		String pwd = request.getParameter("password");
		String clubId = request.getParameter("clubId");
        JSONObject returnJson = new JSONObject();
        try {
            Student student = studentService.getStudentInfoById(userId);

            GroupMember memberInfo = groupMemberService.queryMemberInfo(userId, clubId);
            if(memberInfo!=null){
                request.getSession().setAttribute("rank", memberInfo.getRank());
            }
            /**
             * 重定向到查询用户任务的Servlet
             */
            //response.sendRedirect(request.getContextPath() + "/front/index.jsp");
            //request.getRequestDispatcher("/activiti/queryUserTask.action").forward(request, response);
            //response.sendRedirect(request.getContextPath()+"/activiti/queryUserTask.action");



            if (student == null) {
                ucError = UCErrorPack.create(UCErrorCode.ERROR_CODE_4, "0");
                returnJson.put("status", 0);
                returnJson.put("msg", "该用户不存在");
                return;
            }
            // 判断密码
//            if (!pwd.equals(student.getStuPass())) {
            if (!pwd.equals("000000")) {
                ucError = UCErrorPack.create(UCErrorCode.ERROR_CODE_6, "0");
                returnJson.put("status", 0);
                returnJson.put("msg", "密码不正确");
                return;
            }
            Token token = tokenService.getTokenByUserId(student.getStuNum());
            if (token == null) {
                token = tokenService.createToken(userId);
                if (token == null) {
                    token = tokenService.getTokenByUserId(userId);
                }
            } else {
                Date date = new Date();
                // 判断是否过期
                if (date.getTime() > token.getTokenExpireTime().getTime()) {
                    tokenService.deleteToken(token.getTokenId());
                    token = tokenService.createToken(userId);
                    if (token == null) {
                        token = tokenService.getTokenByUserId(userId);
                    }
                } else {
                    tokenService.updateToken(token.getTokenId());
                }
            }
            if (token == null) {
                ucError = UCErrorPack.create(UCErrorCode.ERROR_CODE_7, "0");
                returnJson.put("status", 0);
                returnJson.put("msg", "创建token失败");
            }

            GetTokenS.Builder builder = GetTokenS.newBuilder();
            builder.setHOpCode("0");
            builder.setTokenId(token.getTokenId());
            builder.setTokenExpireTime(TimeUtils.dateToString(token.getTokenExpireTime()));
            returnJson.put("status", 1);
            returnJson.put("msg", "success");
            returnJson.put("token",token.getTokenId());
            //把用户存入session
            request.getSession().setAttribute("userId", userId);
            request.getSession().setAttribute("userName", student.getStuName());
            request.getSession().setAttribute("clubId", clubId);
            request.getSession().setAttribute("token", token.getTokenId());
        }catch (Exception e){
			returnJson.put("msg",e.getMessage());
			returnJson.put("status", 0);
            log.error(JSON.toJSONString(returnJson));

        }finally {
            response.getWriter().println(returnJson);
        }
		//builder.setUser();
		/*HttpPacket packet = new HttpPacket(httpPacket.hSession.headParam.hOpCode, builder.build());
		return packet;*/
	}

    @RequestMapping("/getAdminToken.action")
    public ResponseEntity<Map> getAdminTokenHandle(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    com.alibaba.fastjson.JSONObject ob = EntityToJsonUtil.getRequestPostJson(request);
        String hOpCode = ob.getString("hOpCode");
        String userId = ob.getString("userName");
        String userPassword = ob.getString("userPassword");
        Student student = studentService.getStudentInfoById(userId);
        JSONObject returnJson = new JSONObject();
        try {
            if (student == null) {
                returnJson.put("status", 0);
                returnJson.put("msg", "该用户不存在");
                return ResponseEntity.ok(returnJson);
            }
            // 判断密码
            //if (!userPassword.equals(student.getStuPass())) {
            if (!userPassword.equals("000000")) {
                returnJson.put("status", 0);
                returnJson.put("msg", "密码不正确");
                return ResponseEntity.ok(returnJson);
            }
            Token token = tokenService.getTokenByUserId(student.getStuNum());
            if (token == null) {
                token = tokenService.createToken(userId);
                if (token == null) {
                    token = tokenService.getTokenByUserId(userId);
                }
            } else {
                Date date = new Date();
                // 判断是否过期
                if (date.getTime() > token.getTokenExpireTime().getTime()) {
                    tokenService.deleteToken(token.getTokenId());
                    token = tokenService.createToken(userId);
                    if (token == null) {
                        token = tokenService.getTokenByUserId(userId);
                    }
                } else {
                    tokenService.updateToken(token.getTokenId());
                }
            }
            if (token == null) {
                returnJson.put("status", 0);
                returnJson.put("msg", "创建token失败");
                return ResponseEntity.ok(returnJson);
            }
            returnJson.put("tokenId",token.getTokenId());
        }catch (Exception e){
            returnJson.put("msg",e.getMessage());
            returnJson.put("status", 0);
            log.error(JSON.toJSONString(returnJson));
        }finally {
            returnJson.put("status", 1);
            return ResponseEntity.ok(returnJson);
        }
    }

	public static void main(String[] args) {
		UCError errorPack = UCErrorPack.create(UCErrorCode.ERROR_CODE_4,"213");
		JsonFormat jsonFormat = new JsonFormat();
		String s = jsonFormat.printToString(errorPack);
		System.out.println(s);
	}
}
