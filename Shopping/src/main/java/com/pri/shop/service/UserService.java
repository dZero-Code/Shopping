package com.pri.shop.service;

import com.pri.shop.dto.UserDto;
import com.pri.shop.model.LoginVO;

public interface UserService {
	/* ID 중복체크 */
	public Boolean checkId(String userid);
	
	/* 회원가입 */
	public Boolean joinus(UserDto userDto);
	
	/* 로그인 */
	public UserDto login(LoginVO loginVO);
}
