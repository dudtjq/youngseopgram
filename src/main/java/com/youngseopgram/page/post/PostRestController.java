package com.youngseopgram.page.post;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@PostMapping("/create")
	public postCreate(
			@RequestParam("content") String content
			, @RequestParam("file") MultipartFile file
			, HttpSession session
			){
		
		// 로그인된 사용자의 user 테이블 id 컬럼 값
		HttpSession session = request.getSession();
				
		int userId = (Integer)session.getAttribute("userId");
		
		
		
	}
		
	}


