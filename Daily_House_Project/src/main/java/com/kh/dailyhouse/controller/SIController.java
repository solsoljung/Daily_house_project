package com.kh.dailyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/login/*")
public class SIController {

	// 회원 가입 처리
	@RequestMapping(value = "/join_run", method = RequestMethod.POST)
	public String registerHost1(RedirectAttributes rttr) throws Exception{
		// 요청정보 얻어서
		// DB 에 넣기 - Service - Dao - Mybatis - Oracle
		rttr.addFlashAttribute("message", "회원가입 성공");
		
		return "redirect:/";
	}
	
	
}
