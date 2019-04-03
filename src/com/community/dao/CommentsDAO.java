package com.community.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.bean.Comments;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年4月2日 下午2:41:41
* @version 1.0 
* @desrciption		
*/
public interface CommentsDAO {
	
	public List<Comments> queryAllComments(@Param("news_id")int news_id);
 	
	public List<Comments> queryResponseComments(@Param("comment_id")int comment_id);
	
	public int addCommentPl(Comments pl);
	
	public void deleteComment(@Param("comment_id")int comment_id);
	
	public void updateCommentLike(HashMap<String,Object> map);
}
