package com.community.web;

import java.net.URLDecoder;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.community.bean.Club;
import com.community.bean.Department;
import com.community.bean.GroupMember;
import com.community.bean.Student;
import com.community.service.interfaces.IClubService;
import com.community.service.interfaces.IDepartmentService;
import com.community.service.interfaces.IGroupMemberService;
import com.community.service.interfaces.IStudentService;
import com.community.util.UploadImageUtil;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年3月14日 上午8:51:10
* @version 1.0 
* @desrciption		
*/
@Controller
@RequestMapping("/join")
public class JoinAction {
	
	private MultipartFile uploadImage;
	
	@Autowired
	IClubService clubService;
	
	@Autowired
	IDepartmentService departmentService;
	
	@Autowired
	IGroupMemberService groupMemberService;
	
	@Autowired
	IStudentService studentService;
	
	@RequestMapping("/queryAllClub.action")
	@ResponseBody
	public Map<String,Object> queryAllClub(HttpServletRequest request,HttpServletResponse response){
		
		String collegeId = (String) request.getSession().getAttribute("collegeId");
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Club> clubList = null;
		
		try {
			clubList = clubService.queryClubBycollegeId(collegeId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultMap.put("data", clubList);
		return resultMap;
	}
	
	@RequestMapping("/queryDepartment.action")
	@ResponseBody
	public Map<String,Object> queryDepartmentByClubId(HttpServletRequest request,HttpServletResponse response){
		String clubId = request.getParameter("clubId");
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Department> departList = null;
		
		try {
			departList = departmentService.queryDepartmentByClubId(clubId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultMap.put("data", departList);
		return resultMap;
	}
	
	@RequestMapping(value="/uploadHead.action",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadHead(HttpServletRequest request,@RequestParam("file") MultipartFile file,@RequestParam("stuNum")String stuNum){
		
		uploadImage = file;
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
//		初始化文件上传格式要求
		UploadImageUtil uploadImageUtil = new UploadImageUtil("image/jpeg,image/png",1024*1024);
//		校验文件格式
		String checkResult = uploadImageUtil.checkUploadImage(file,file.getContentType());
		if(checkResult!=null){
			resultMap.put("resultFlag",0);
			resultMap.put("msg", checkResult);
		}else{
			resultMap.put("resultFlag", 1);
		}
		return resultMap;
	}
	
	@RequestMapping("/submitJoinInfo.action")
	@ResponseBody
	public Map<String,Object> submitJoinInfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String num = request.getParameter("stuNum");
		String name = request.getParameter("stuName");
		String profession = request.getParameter("profession");
		String grade = request.getParameter("grade");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String clubName = request.getParameter("clubName");
		String clubId = request.getParameter("clubId");
		String interest = request.getParameter("interest");
		String special = request.getParameter("special");
		String departId = request.getParameter("departId");
		String gender = request.getParameter("gender");
		
		
		GroupMember memberInfo = new GroupMember();
		memberInfo.setClubId(clubId);
		memberInfo.setStuNum(num);
		memberInfo.setStuName(name);
		memberInfo.setDepartmentId(departId);
		memberInfo.setRank(1);
		memberInfo.setState(0);
		memberInfo.setIsFee(0);
		memberInfo.setJob("普通社员");
		memberInfo.setApplyTime(new Date());
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		//生成头像路径
		MultipartFile file = uploadImage;
		UploadImageUtil uploadImageUtil = new UploadImageUtil();
		String fileName = null;
		try {
			fileName = uploadImageUtil.upload(file, num);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "上传图片过大，无法保存！");
			return resultMap;
		}
		
		Student stuInfo = new Student();
		stuInfo.setCollegeId("1010000");
		stuInfo.setStuNum(num);
		stuInfo.setStuName(name);
		stuInfo.setGender(gender);
		stuInfo.setClass_(grade);
		stuInfo.setEmail(email);
		stuInfo.setPhone(phone);
		stuInfo.setProfession(profession);
		stuInfo.setSpecial(special);
		stuInfo.setInterest(interest);
		stuInfo.setHead(fileName);
		
		resultMap.put("resultFlag", 1);
		
		
		groupMemberService.saveMemberInfo(memberInfo);
		studentService.saveStudentInfo(stuInfo);
		
		return resultMap;
		
/*		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		try {
			writer.print(JSONObject.fromObject(resultMap));
			writer.flush();
			writer.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			resultMap.put("resultFlag", 0);
			resultMap.put("Msg", "保存数据出错！");
		}*/
	
	}
	
}
