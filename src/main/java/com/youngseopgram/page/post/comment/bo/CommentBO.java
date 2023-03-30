package com.youngseopgram.page.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.youngseopgram.page.post.comment.dao.CommentDAO;
import com.youngseopgram.page.post.comment.model.Comment;
import com.youngseopgram.page.post.comment.model.CommentDetail;
import com.youngseopgram.page.user.bo.UserBO;
import com.youngseopgram.page.user.model.User;

@Service
public class CommentBO {

	// userBO 호출하여 사용하기
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
	
	public List<CommentDetail> getComment(int postId){
		
		List<Comment> commentList = commentDAO.selectCommentList(postId);
		// 최종적으로 리턴을 해주기 위해 CommentDetail List 생성
		List<CommentDetail> commentDetailList = new ArrayList<>();	
		
		for(Comment comment:commentList) {
			
			// userBO 사용하기
			User user = userBO.getUserById(comment.getUserId());
			
			CommentDetail commentDetail = new CommentDetail();
			
			//.set 으로 그 값에 대한것을 지정하고 가로안에 get을 넣는다. 
			commentDetail.setId(comment.getId());
			commentDetail.setUserId(comment.getUserId());
			commentDetail.setUserLoginId(user.getLoginId());
			commentDetail.setContent(comment.getContent());
			
			commentDetailList.add(commentDetail);
			
		}
		
		return commentDetailList;
		
	}
	
	public int deleteCommentByPostId(int postId) {
		
		return commentDAO.deleteCommentByPostId(postId);
		
	}
	

	

}
