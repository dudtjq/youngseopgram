package com.youngseopgram.page.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);

	public int selectCountLike(@Param("postId") int postId);
	
	public int selectLike(
			@Param("userId") int userId
			, @Param("postId") int postId
			);
	
	public int deleteLike(
			@Param("userId") int userId
			, @Param("postId") int postId
			); 
	
	public int deleteLikeByPostId(@Param("postId") int postId);
	
}
