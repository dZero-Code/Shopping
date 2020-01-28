package com.pri.shop.service;

import com.pri.shop.dto.AdminDto;
import com.pri.shop.model.LoginVO;

public interface AdminService {
	/* 로그인 */
	public AdminDto login(LoginVO loginVo);
}
