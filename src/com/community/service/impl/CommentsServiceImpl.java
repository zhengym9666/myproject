package com.community.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.bean.Comments;
import com.community.dao.CommentsDAO;
import com.community.service.interfaces.ICommentsService;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年4月2日 下午2:55:51
* @version 1.0 
* @desrciption		
*/
@Service("commentsService")
public class CommentsServiceImpl implements ICommentsService{

	@Autowired
	CommentsDAO commentsMapper;
	
	@Override
	public List<Comments> queryAllComments(int news_id) {
		// TODO Auto-generated method stub
		return commentsMapper.queryAllComments(news_id);
	}

	@Override
	public List<Comments> queryResponseComments(int comment_id) {
		// TODO Auto-generated method stub
		return commentsMapper.queryResponseComments(comment_id);
	}

	@Override
	public int addCommentPl(Comments pl) {
		// TODO Auto-generated method stub
		return commentsMapper.addCommentPl(pl);
	}

	@Override
	public void deleteComment(int comment_id) {
		// TODO Auto-generated method stub
		commentsMapper.deleteComment(comment_id);
	}

	@Override
	public void updateCommentLike(int comment_id, int belike) {
		// TODO Auto-generated method stub
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("comment_id", comment_id);
		params.put("belike", belike);
		commentsMapper.updateCommentLike(params);
	}

}
