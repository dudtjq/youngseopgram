package com.youngseopgram.page.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.youngseopgram.page.post.comment.dao.CommentDAO;
import com.youngseopgram.page.post.comment.model.Comment;
import com.youngseopgram.page.post.comment.model.CommentDetail;
import com.youngseopgram.page.post.dao.PostDAO;
import com.youngseopgram.page.post.model.PostDetail;
import com.youngseopgram.page.user.bo.UserBO;
import com.youngseopgram.page.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentDAO commentDAO;

	public int addComment(
			int userId
			, int postId
			, String content) {
		
		return commentDAO.insertComment(userId, postId, content);
		
		
	}
	
	// 댓글 목록을 조회 하는 리스트
	List<CommentDetail> getCommentList(){
		
		List<Comment> commentList = commentDAO.selectCommentList();
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for(Comment comment:commentList) {
			
			User user = userBO.getUserById(comment.getUserId());
			
			CommentDetail commentDetail = new CommentDetail();
			

			commentDetail.setId(comment.getId());
			commentDetail.setPostId(comment.getPostId());
			commentDetail.setUserId(comment.getUserId());
			commentDetail.setContent(comment.getContent());
			commentDetail.setUserName(user.getName());
			
			commentDetailList.add(commentDetail);
			
		}
		
		return 	commentDetailList;
	}
	

}
