package com.youngseopgram.page.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.youngseopgram.page.post.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		
		return likeDAO.insertLike(userId, postId);
		
	}
	
	public int getLikeCount(int postId) {
		
		return likeDAO.selectCountLike(postId);
		
	}
	
	public boolean Like(int userId, int postId) {
		
		int count = likeDAO.selectLike(userId, postId);
		
//		if(count == 0) {
//			return false;
//		}else {
//			return true;
//		}
		
		return count != 0;
		
	}
	
	public int unlike(int postId, int userId) {
		
		return likeDAO.deleteLike(postId, userId);
		
	}
	
}
