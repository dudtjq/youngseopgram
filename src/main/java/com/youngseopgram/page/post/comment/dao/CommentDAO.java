package com.youngseopgram.page.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.youngseopgram.page.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("content") String content
			);
	// List<Comment>에 대한 하나의 값을 얻어 오기 위해
	public List<Comment> selectCommentList(@Param("postId") int postId);
	
	public int deleteCommentByPostId(@Param("postId") int postId);

}
