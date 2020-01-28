package com.pri.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pri.shop.dto.ProductInfoDto;
import com.pri.shop.dto.UserDto;
import com.pri.shop.model.LoginVO;
import com.pri.shop.model.ProSearchVO;
import com.pri.shop.service.CartService;
import com.pri.shop.service.ProductService;

/*
	메인 페이지에서 각 페이지로의 이동을 제어하는 Controller
*/

@Controller
public class MainController {
	private final ProductService productService;
	private final CartService cartService;
	
	@Autowired
	public MainController(ProductService productService, CartService cartService) {
		this.productService = productService;
		this.cartService = cartService;
	}
	
	// Main 페이지 이동
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView reqMain(HttpSession session) {
		ModelAndView view = new ModelAndView();
		
		ArrayList<ProductInfoDto> list = productService.searchLasted();
		int cartCount = cartService.countCart( (String)session.getAttribute("id"));
		
		view.setViewName("index");
		view.addObject("productList", list);
		view.addObject("cartCount", cartCount);
		
		return view;
	}
	
	/* 메인 상품(ajax) */
	@ResponseBody
	@RequestMapping(value = "/main_product", method = RequestMethod.GET)
	public Map<String, Object> login(ProSearchVO proSearchVO) {
		// json화 시키기 위한 객체 생성
		Map<String, Object> productList = new HashMap<String, Object>();
		
		proSearchVO.setStart(0);
		proSearchVO.setEnd(8);
		productList.put("productList", productService.searchClass(proSearchVO));
		
		return productList;
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String reqLogin() {
		return "user/login";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/joinus", method = RequestMethod.GET)
	public String reqJoinus() {
		return "user/joinus";
	}
	
	// Admin Login 페이지 이동
	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String reqAdmin() {
		return "admin/login";
	}
	
	/* 상품 */
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category() {
		return "product/category";
	}
}
