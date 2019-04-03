package com.community.bean;

import java.util.Date;

/** 
* @author  作者 :zhengym
* @date 创建时间：2019年4月2日 下午2:44:23
* @version 1.0 
* @desrciption		
*/
public class Comments {
	
	private int comment_id;
	private int news_id;
	private String author;
	private String responseTo;
	private int responseToCommentId;
	private String content;
	private Date create_time;
	private int belike;
	private String commentHead;
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getResponseTo() {
		return responseTo;
	}
	public void setResponseTo(String responseTo) {
		this.responseTo = responseTo;
	}
	public int getResponseToCommentId() {
		return responseToCommentId;
	}
	public void setResponseToCommentId(int responseToCommentId) {
		this.responseToCommentId = responseToCommentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public int getBelike() {
		return belike;
	}
	public void setBelike(int belike) {
		this.belike = belike;
	}
	public String getCommentHead() {
		return commentHead;
	}
	public void setCommentHead(String commentHead) {
		this.commentHead = commentHead;
	}
	
	
}
