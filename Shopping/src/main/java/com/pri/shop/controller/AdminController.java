package com.pri.shop.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pri.shop.dto.AdminDto;
import com.pri.shop.model.LoginVO;
import com.pri.shop.service.AdminService;


/*
	관리자 관련 Controller
*/

@Controller
public class AdminController {
	private final AdminService adminService;
	
	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	/* 관리자 메인 */
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "redirect:/";
	}
	
	/* 관리자 로그인 (Ajax) */
	@ResponseBody
	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)
	public Map<String, Object> login(HttpSession session, LoginVO loginVO) {
		// json화 시키기 위한 객체 생성
		Map<String, Object> user = new HashMap<String, Object>();
		
		System.out.println(loginVO.getUserid());
		System.out.println(loginVO.getPasswd());
		// DB 접근을 통해 로그인 여부 확인
		AdminDto adminDto = adminService.login(loginVO);
		
		if(adminDto != null) {	// 객체가 존재 → 로그인
			session.setAttribute("adminId", adminDto.getUserid());		// 세션 생성
			user.put("adminId", adminDto.getUserid());
		}
			
		return user;
	}
}
