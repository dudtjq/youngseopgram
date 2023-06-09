package com.youngseopgram.page.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.youngseopgram.page.common.EncryptService;
import com.youngseopgram.page.user.dao.UserDAO;
import com.youngseopgram.page.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String email
			) {
		String encryptPassword = EncryptService.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
		
	}
	
	public boolean isDuplicateLoginId(String loginId) {
		
		int count = userDAO.selectCountLoginId(loginId);
		
		if(count == 0){
			return false;
		}else {
			return true;
		}
		
	}
	
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptService.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
		
	}
	
	public User getUserById(int userId) {
		
		return userDAO.selectUserById(userId);
		
	}
	
}
