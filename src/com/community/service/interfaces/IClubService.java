package com.community.service.interfaces;

import java.util.List;

import com.community.bean.Club;

/**
 * 
 * @author zym
 *
 * 2018��12��27��
 */

public interface IClubService {
	public List<Club> queryClubBycollegeId(String collegeId);
	
	public String getGeneralIdByClubId(String clubId);
}
