package com.youngseopgram.page.post.model;

import java.util.List;

import com.youngseopgram.page.post.comment.model.Comment;
import com.youngseopgram.page.post.comment.model.CommentDetail;

public class PostDetail {

	private int id;
	private int userId;
	private String loginId;
	private int likeCount;
	private boolean like;
	private String content;
	private String imagePath;
	private List<CommentDetail> commentList;
	
	

	public List<CommentDetail> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentDetail> commentList) {
		this.commentList = commentList;
	}
	public int getId() {
		return id;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public boolean isLike() {
		return like;
	}
	public void setLike(boolean like) {
		this.like = like;
	}


	
	
	
	
}
