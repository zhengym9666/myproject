package com.community.bean;

import java.util.Date;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月24日 下午11:40:48
* @version 1.0 
* @desrciption		
*/
public class Department {
	private String id;
	private String name;
	private String intro;
	private String collegeId;
	private String clubId;
	private Date birthDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(String collegeId) {
		this.collegeId = collegeId;
	}
	public String getClubId() {
		return clubId;
	}
	public void setClubId(String clubId) {
		this.clubId = clubId;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
	
}
