package com.youngseopgram.page.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.youngseopgram.page.post.bo.PostBO;
import com.youngseopgram.page.post.comment.bo.CommentBO;
import com.youngseopgram.page.post.comment.model.Comment;
import com.youngseopgram.page.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	
	@GetMapping("/timeline/view")
	public String postList(Model model
			, HttpSession session
			) {
		
		int userId = (Integer)session.getAttribute("userId");
 		
		List<PostDetail> postList = postBO.getPostList(userId);
		
		model.addAttribute("postList", postList);
		

		return "post/timeline";
	}
	
}
