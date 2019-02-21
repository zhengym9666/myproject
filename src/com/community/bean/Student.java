package com.community.bean;
/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 上午11:57:58
* @version 1.0 
* @desrciption		
*/

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields
	private String stuNum;
	private String stuName;
	private String gender;
	private String collegeId;
	private String class_;
	private String email;
	private String phone;
	private String stuPass;
	private Integer state;
	private String hOpCode;


	// Constructors

	/**
	 * default constructor
	 */
	public Student() {
	}

	/**
	 * minimal constructor
	 */
	public Student(String stuNum, String stuName, String gender) {
		this.stuNum = stuNum;
		this.stuName = stuName;
		this.gender = gender;
	}

	/**
	 * full constructor
	 */
	public Student(String stuNum, String stuName, String gender,
				   String collegeId, String class_, String email, String phone,
				   String stuPass, Integer state) {
		this.stuNum = stuNum;
		this.stuName = stuName;
		this.gender = gender;
		this.collegeId = collegeId;
		this.class_ = class_;
		this.email = email;
		this.phone = phone;
		this.stuPass = stuPass;
		this.state = state;
	}

	public String gethOpCode() {
		return hOpCode;
	}

	public void sethOpCode(String hOpCode) {
		this.hOpCode = hOpCode;
	}

	public String getStuNum() {
		return this.stuNum;
	}

	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}

	public String getStuName() {
		return this.stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCollegeId() {
		return this.collegeId;
	}

	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}

	public String getClass_() {
		return this.class_;
	}

	public void setClass_(String class_) {
		this.class_ = class_;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStuPass() {
		return this.stuPass;
	}

	public void setStuPass(String stuPass) {
		this.stuPass = stuPass;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Student(String stuNum, String stuName, String gender, String collegeId, String class_, String email, String phone, String stuPass, Integer state, String hOpCode) {
		this.stuNum = stuNum;
		this.stuName = stuName;
		this.gender = gender;
		this.collegeId = collegeId;
		this.class_ = class_;
		this.email = email;
		this.phone = phone;
		this.stuPass = stuPass;
		this.state = state;
		this.hOpCode = hOpCode;
	}

	@Override
	public String toString() {
		return "Student{" +
				"stuNum='" + stuNum + '\'' +
				", stuName='" + stuName + '\'' +
				", gender='" + gender + '\'' +
				", collegeId='" + collegeId + '\'' +
				", class_='" + class_ + '\'' +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", stuPass='" + stuPass + '\'' +
				", state=" + state +
				", hOpCode='" + hOpCode + '\'' +
				'}';
	}
}
