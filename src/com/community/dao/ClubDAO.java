package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.Club;

/**
 * 
 * @author zym
 *
 * 2018��12��27��
 */

public interface ClubDAO {
    //	����ѧԺid��ȡ�����б�
	public List<Club> queryClubBycollegeId(@Param("collegeId")String collegeId);

    //根据社团id获取会长id
	public String getGeneralIdByClubId(@Param("clubId")String clubId);

    Club queryUserGroup(String clubId);

	//��������id��ȡ�᳤id
	public Club getClubById(@Param("clubId")String clubId);
}
