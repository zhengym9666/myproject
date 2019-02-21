package com.community.service.interfaces;

import java.util.List;

import com.community.bean.Club;

/**
 * 
 * @author zym
 *
 * 2018年12月27日
 */

public interface IClubService {
	public List<Club> queryClubBycollegeId(String collegeId);
	
	public Club getClubById(String clubId);
	public String getGeneralIdByClubId(String clubId);

    Club queryUserGroup(String clubId);
}
