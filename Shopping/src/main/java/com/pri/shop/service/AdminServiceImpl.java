package com.pri.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pri.shop.dao.AdminDao;
import com.pri.shop.dto.AdminDto;
import com.pri.shop.model.LoginVO;

@Service
public class AdminServiceImpl implements AdminService{
	private final AdminDao adminDao;
	
	@Autowired
	public AdminServiceImpl(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	@Override
	public AdminDto login(LoginVO loginVO) {
		return adminDao.selectAdminLogin(loginVO);	
	}
}
