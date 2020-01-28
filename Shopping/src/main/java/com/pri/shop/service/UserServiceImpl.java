package com.pri.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pri.shop.dao.UserDao;
import com.pri.shop.dto.UserDto;
import com.pri.shop.model.LoginVO;

@Service
public class UserServiceImpl implements UserService{
	private final UserDao userDao; 
	
	@Autowired
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	/* ID 중복체크 */
	@Override
	public Boolean checkId(String userid) {
		String id = userDao.search(userid);
		
		if (id == null) return true;		// 해당 아이디 사용가능 
		else return false;					// 해당 아이디 사용불가능
	}
	
	/* 회원가입 */
	@Override
	public Boolean joinus(UserDto userDto) {
		int result = userDao.insert(userDto);
		
		if(result > 0) return true;
		else return false;
	}
	
	/* 로그인 */
	@Override
	public UserDto login(LoginVO loginVO) {
		return userDao.selectLogin(loginVO);
	}
}
