package com.community.service.impl;

import java.util.Date;
import java.util.List;

import com.community.bean.UserGroupData;
import com.community.config.CommonConfigUCenter;
import com.community.util.MybatisUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Club;
import com.community.dao.ClubDAO;
import com.community.service.interfaces.IClubService;

@Service("clubService")
public class ClubServiceImpl extends AbsServiceImpl<ClubDAO> implements IClubService {
//    @Autowired
//    ClubDAO mapper;
	@Override
	public List<Club> queryClubBycollegeId(String collegeId) {
		// TODO Auto-generated method stub
		return mapper.queryClubBycollegeId(collegeId);
	}

	@Override
	public Club getClubById(String clubId) {
		// TODO Auto-generated method stub
		return mapper.getClubById(clubId);
	}

	@Override
	public String getGeneralIdByClubId(String clubId) {
		return mapper.getGeneralIdByClubId(clubId);
	}

	@Override
	public Club queryUserGroup(String clubId) {
		return mapper.queryUserGroup(clubId);
	}



	@Test
	public void test() throws Exception {
		MybatisUtil util=new MybatisUtil();
		ClubServiceImpl service = util.getMapperServiceImplObject(ClubDAO.class,ClubServiceImpl.class);
		ClubDAO mapperObject = util.getMapperObject(ClubDAO.class);
		Club club = service.queryUserGroup("1010100");
		UserGroupData userGroupData = studentToUser(club);
		System.out.println(userGroupData);

	}
	public static UserGroupData studentToUser(Club club){
		UserGroupData userGroup=new UserGroupData();
		userGroup.setUserGroupId(club.getClubId());
		userGroup.setUserGroupName(club.getClubName());
		return userGroup;
	}
	public static void main(String[] args) {

		//new TokenServiceImpl().createToken("123");
		Date date = new Date();
		Date expireTime = new Date(date.getTime() + CommonConfigUCenter.TOKEN_EXPIRE_TIME);
		System.out.println(expireTime);
	}
}
