package com.youngseopgram.page.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.youngseopgram.page.post.model.Post;
import com.youngseopgram.page.post.model.PostDetail;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath
			);
	
	public List<Post> selectPostList();
	
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public Post selectPostByUserId(
			@Param("userId") int userId
			, @Param("id") int id);
	
	public int deletePost(@Param("id") int id);

}
