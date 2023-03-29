package com.youngseopgram.page.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.youngseopgram.page.common.FileManagerService;
import com.youngseopgram.page.post.comment.bo.CommentBO;
import com.youngseopgram.page.post.comment.model.CommentDetail;
import com.youngseopgram.page.post.dao.PostDAO;
import com.youngseopgram.page.post.like.bo.LikeBO;
import com.youngseopgram.page.post.model.Post;
import com.youngseopgram.page.post.model.PostDetail;
import com.youngseopgram.page.user.bo.UserBO;
import com.youngseopgram.page.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	public int addPost(
			int userId
			, String content
			, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, imagePath);
		
		}
	
	public List<PostDetail> getPostList(int userId){
		
		// 컨트롤러에서는 원하는 (jsp에서 사용할) 데이터 형태를 만들어 준다.
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		// 향상된 for 문
		for(Post post:postList) {
			
			User user = userBO.getUserById(post.getUserId());
			int likeCount = likeBO.getLikeCount(post.getId());
			boolean like = likeBO.Like(userId, post.getId());
			List<CommentDetail> commentList = commentBO.getComment(post.getId());
			
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setId(post.getId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setLoginId(user.getLoginId());
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(like);
			postDetail.setCommentList(commentList);
			
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
		
	}
	

}
