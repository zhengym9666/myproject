package com.community.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.News;

/**
 * 
 * @author zym
 *
 * 2018��12��24��
 */
public interface NewsDAO {
//	��������id��ȡ������Ϣ
	public News queryNewsById(@Param("id")int id);
	
//	��ҳ��ȡ������Ϣ
	public List<News> queryPageNews(@Param("collegeId")String collegeId,@Param("clubId")String clubId,@Param("start")int start,@Param("size")int size);
	
//	��ȡ�����ܼ�¼��
	public int queryTotalCount(@Param("collegeId")String collegeId,@Param("clubId")String clubId);
}
