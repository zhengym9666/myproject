package com.community.web;

import activiti.servlet.user.LoginServlet;
import com.alibaba.fastjson.JSONObject;
import com.community.bean.GroupMember;
import com.community.bean.Student;
import com.community.bean.UserData;
import com.community.model.base.HOpCodeUCenter;
import com.community.model.base.UCErrorPack;
import com.community.service.interfaces.IGroupMemberService;
import com.community.service.interfaces.IStudentService;
import com.community.service.interfaces.ITokenService;
import com.community.service.interfaces.IUserService;
import com.community.util.EntityToJsonUtil;
import com.community.util.StringUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.community.bean.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.print.PageFormat;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */
@Controller
@RequestMapping("/student")
public class StudentAction {
    @Autowired
    IStudentService studentService;
    @Autowired
    IGroupMemberService groupMemberService;
    @Autowired
    ITokenService tokenService;
    private static transient Log log = LogFactory.getLog(StudentAction.class);
    @RequestMapping(value = "/{studentId}", method = RequestMethod.GET)
    public ResponseEntity<Student> queryUserById(@PathVariable("studentId")String userId){

        try {
            //根据用户id查询用户
            Student student = studentService.getStudentInfoById(userId);

            return ResponseEntity.ok(student);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //返回500
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    //根据token获取用户信息
    @RequestMapping("/queryStudent.action")
    public ResponseEntity<Map> queryStudentHandle(HttpServletRequest request, HttpSession session) throws IOException {
        Student student;
        JSONObject ob = EntityToJsonUtil.getRequestPostJson(request);
        String studentId = ob.getString("studentId");
        String hOpCode = ob.getString("hOpCode");
        //测试使用
        if(studentId==null){
            //studentId="123";
        }
        Map map=new HashMap();
        if (StringUtil.stringIsNull(studentId)) {
            student = (Student) request.getSession().getAttribute("student");
        } else {
            student = studentService.getStudentInfoById(studentId);
        }

        if (student == null) {
           /* UCError errorPack = UCErrorPack.create(UCErrorCode.ERROR_CODE_4, httpPacket.hSession.headParam.hOpCode);
            throw new HttpException(HOpCodeUCenter.UC_ERROR, errorPack);*/
            log.error("找不到该学生");
            //返回500
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
        User user = studentToUser(student);
        map.put("user",user);
        map.put("hOpCode",hOpCode);
        return ResponseEntity.ok(map);
    }

    //获取用户所在社团的好友
    @RequestMapping("/queryFriendList.action")
    public ResponseEntity<Map> queryFriendList(HttpServletRequest request, HttpSession session) throws IOException {
        Map map = new HashMap();;
        List<User> userList=new ArrayList<>();
        JSONObject ob = EntityToJsonUtil.getRequestPostJson(request);
        String hOpCode=ob.getString("hOpCode");
        try {
            //获取当前社团ID
            String cludId=ob.getString("userGroupTopId");
            List<GroupMember> groupMembers = groupMemberService.queryMemberListByClubId(cludId);
            List<String> studentIds=new ArrayList<>();
            for (GroupMember groupMember:groupMembers){
                studentIds.add(groupMember.getStuNum());
            }

            List<Student> stuList = studentService.getFriendListByStudentId(studentIds);
            //List<Student> stuList = studentService.getFriendList(cludId);
            if (userList != null) {
                for (int i = 0; i < stuList.size(); i++) {
                    Student student = stuList.get(i);
                    User user = studentToUser(student);
                    userList.add(user);
                }
            }

        }catch (Exception e){
            map.put("user",userList);
            map.put("hOpCode",0);
        }
        finally {
            map.put("user",userList);
            map.put("hOpCode",hOpCode);
        }
        return ResponseEntity.ok(map);
    }

    //根据token获取用户信息
    @RequestMapping("/queryStudent2.action")
    public ResponseEntity<Student> queryStudent2Handle(HttpServletRequest request, HttpSession session){
        Student student=new Student();
        student.sethOpCode("23");
        student.setStuName("213");
        student.setStuPass("21322");
        student.sethOpCode("233");
        //返回500
        return ResponseEntity.ok(student);
    }

    public User studentToUser(Student student){
        /*User user=new User();
        user.setUserId(student.getStuNum());
        user.setUserGroupTopId(student.getCollegeId());
        user.setUserImgUrl("");
        user.setUserRealName(student.getStuNum());
        UserData userData = new UserData();
        userData.sethOpCode(hOpCode);
        userData.setUser(user);*/
        User user=new User();
        user.setUserId(student.getStuNum());
        user.setUserGroupTopId(student.getCollegeId());
        user.setUserImgUrl("");
        user.setUserRealName(student.getStuName());
        return user;
    }
}
