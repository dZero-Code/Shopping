package com.pri.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
	// Ajax 오류시
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String errorAjax() {
		return "error";
	}
}
