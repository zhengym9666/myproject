package com.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Club;
import com.community.dao.ClubDAO;
import com.community.service.interfaces.IClubService;

@Service("clubService")
public class ClubServiceImpl implements IClubService {

	@Autowired
	private ClubDAO clubMapper;

	@Override
	public List<Club> queryClubBycollegeId(String collegeId) {
		// TODO Auto-generated method stub
		return clubMapper.queryClubBycollegeId(collegeId);
	}
	

}
