package com.youngseopgram.page.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.youngseopgram.page.post.comment.bo.CommentBO;

@RestController
@RequestMapping("/post/comment")
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	@ResponseBody
	public Map<String, String> commentCreate(
			@RequestParam("postId") int postId
			, @RequestParam("content") String content
			, HttpSession session
 			) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = commentBO.addComment(userId, postId, content);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	
	
}
