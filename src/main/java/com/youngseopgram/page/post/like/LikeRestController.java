package com.youngseopgram.page.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.youngseopgram.page.post.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/like")
	public Map<String, String> postLike(
			@RequestParam("postId") int postId
			// 로그인 된 유저 id를 얻어오기 위해
			, HttpSession session
			) {
		// 로그인 관련 api에 대한 키값 불러오기
		int userId = (Integer)session.getAttribute("userId");
		
		int count = likeBO.addLike(userId, postId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	@GetMapping("/unlike")
	public Map<String, String> unlike(
			@RequestParam("postId") int postId
			, HttpSession session
			){
		
		// 로그인 관련 api에 대한 키값 불러오기
		int userId = (Integer)session.getAttribute("userId");
		
		int count = likeBO.unlike(userId, postId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 0) {
			resultMap.put("result", "fail");
		}else {
			resultMap.put("result", "success");
		}
		
		return resultMap;
		
	}

}
