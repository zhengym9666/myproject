package com.community.service.interfaces;

import java.util.List;

import com.community.bean.Club;

/**
 * 
 * @author zym
 *
 * 2018Äê12ÔÂ27ÈÕ
 */

public interface IClubService {
	public List<Club> queryClubBycollegeId(String collegeId);
	
	public String getGeneralIdByClubId(String clubId);
}
