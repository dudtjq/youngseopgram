package com.youngseopgram.page.post.model;

public class PostDetail {

	private int id;
	private int userId;
	private String loginId;
	private int likeCount;
	private boolean likeCheck;
	private String content;
	private String imagePath;
	
	
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
	public boolean isLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(boolean likeCheck) {
		this.likeCheck = likeCheck;
	}

	
	
	
	
}
