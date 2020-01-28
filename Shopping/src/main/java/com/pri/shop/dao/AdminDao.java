package com.pri.shop.dao;

import org.apache.ibatis.annotations.Select;

import com.pri.shop.dto.AdminDto;
import com.pri.shop.model.LoginVO;

public interface AdminDao {
	/* 로그인을 위한 관리자정보 확인 */
	@Select("SELECT * FROM admin WHERE userid=#{userid} AND passwd=password(#{passwd})")
	public AdminDto selectAdminLogin(LoginVO loginVo);
}
