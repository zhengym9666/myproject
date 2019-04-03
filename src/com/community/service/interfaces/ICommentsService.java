package com.community.service.interfaces;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.Comments;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年4月2日 下午2:54:56
* @version 1.0 
* @desrciption		
*/
public interface ICommentsService {
	
	public List<Comments> queryAllComments(int news_id);
	
	public List<Comments> queryResponseComments(int comment_id);
	
	public int addCommentPl(Comments pl);
	
	public void deleteComment(int comment_id);
	
	public void updateCommentLike(int comment_id,int belike);

}
