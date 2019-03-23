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
	private int rank;
	private String job;
	private int state;
	private Date joinTime;
	private Date exitTime;
	private Date applyTime;
	private int id;
	private int isFee;

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

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	
	public int getIsFee() {
		return isFee;
	}

	public void setIsFee(int isFee) {
		this.isFee = isFee;
	}

	@Override
	public String toString() {
		return "GroupMember{" +
				"stuNum='" + stuNum + '\'' +
				", stuName='" + stuName + '\'' +
				", clubId='" + clubId + '\'' +
				", departmentId='" + departmentId + '\'' +
				", rank='" + rank + '\'' +
				", job='" + job + '\'' +
				", state='" + state + '\'' +
				", joinTime=" + joinTime +
				", exitTime=" + exitTime +
				", id=" + id +
				'}';
	}
}
