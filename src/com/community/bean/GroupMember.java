package com.community.bean;

import java.util.Date;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年1月25日 上午9:55:12
* @version 1.0 
* @desrciption		
*/
public class GroupMember {
 private String stuNum;
 private String stuName;
 private String clubId;
 private String departmentId;
 private String rank;
 private String job;
 private String state;
 private Date joinTime;
 private Date exitTime;
public String getStuNum() {
	return stuNum;
}
public void setStuNum(String stuNum) {
	this.stuNum = stuNum;
}
public String getStuName() {
	return stuName;
}
public void setStuName(String stuName) {
	this.stuName = stuName;
}
public String getClubId() {
	return clubId;
}
public void setClubId(String clubId) {
	this.clubId = clubId;
}
public String getDepartmentId() {
	return departmentId;
}
public void setDepartmentId(String departmentId) {
	this.departmentId = departmentId;
}
public String getRank() {
	return rank;
}
public void setRank(String rank) {
	this.rank = rank;
}
public String getJob() {
	return job;
}
public void setJob(String job) {
	this.job = job;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public Date getJoinTime() {
	return joinTime;
}
public void setJoinTime(Date joinTime) {
	this.joinTime = joinTime;
}
public Date getExitTime() {
	return exitTime;
}
public void setExitTime(Date exitTime) {
	this.exitTime = exitTime;
}
 
 
}
