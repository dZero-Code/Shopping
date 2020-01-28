package com.pri.shop.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pri.shop.dto.UserDto;
import com.pri.shop.model.LoginVO;
import com.pri.shop.service.UserService;

/*
	유저관련 Controller
*/
@Controller
public class UserController {
	private final UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	/* 유저의 회원가입 */
	@RequestMapping(value = "/joinus", method = RequestMethod.POST)
	public ModelAndView joinus(UserDto userDto) {
		ModelAndView view = new ModelAndView();
		
		userDto.setRank("bronzes");
		
		if(userService.joinus(userDto)) {
			view.setViewName("user/joinOk");
		}else {
			view.setViewName("error");
		}
		
		return view;
	}
	
	/* 유저아이디 중복확인 (Ajax) */
	@ResponseBody
	@RequestMapping(value = "chkId", method = RequestMethod.GET)
	public Map<String, Object> chkId(@RequestParam("userid") String userid) {
		// json화 시키기 위한 객체 생성
		Map<String, Object> user = new HashMap<String, Object>();
		
		// DB 접근을 통해 아이디 중복체크
		if(userService.checkId(userid)) {
		   user.put("create", userid);
		}
		return user;
	}
	
	/* 유저 로그인 (Ajax) */
	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public Map<String, Object> login(HttpSession session, LoginVO loginVO) {
		// json화 시키기 위한 객체 생성
		Map<String, Object> user = new HashMap<String, Object>();
		
		System.out.println(loginVO.getUserid());
		System.out.println(loginVO.getPasswd());
		// DB 접근을 통해 로그인 여부 확인
		UserDto userDto = userService.login(loginVO);
		
		if(userDto != null) {	// 객체가 존재 → 로그인
			session.setAttribute("id", userDto.getUserid());		// 세션 생성
			user.put("loginId", userDto.getUserid());
		}
			
		return user;
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		if(session != null)
			session.invalidate();		// 세션 해제
		
		return "index";
	}
}
