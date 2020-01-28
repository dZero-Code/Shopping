package com.pri.shop.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pri.shop.dto.UserDto;
import com.pri.shop.model.LoginVO;

public interface UserDao {
	/* 회원가입을 통한 유저정보 입력 */
	@Insert("INSERT INTO user VALUES(#{userid}, password(#{passwd}), #{name}, #{birth}, #{email}, #{phone}, #{rank}, #{state_provided}, #{state_consignment}, #{state_email}, #{state_sms})")
	public int insert(UserDto userDto);
	
	/* 회원가입을 위한 유저 아이디의 존재여부 파악 */
	@Select("SELECT userid FROM user WHERE userid=#{userid}")
	public String search(String userid);
	
	/* 로그인을 위한 유저정보 확인 */
	@Select("SELECT userid, name, rank FROM user WHERE userid=#{userid} AND passwd=password(#{passwd})")
	public UserDto selectLogin(LoginVO loginVO);
}
