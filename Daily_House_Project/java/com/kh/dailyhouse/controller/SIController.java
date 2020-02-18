package com.kh.dailyhouse.controller;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.service.SiUserService;

@Controller
@RequestMapping("/si/*")
public class SIController {
	
	@Inject
	private SiUserService siUserService;
	
	//홈으로 가는 컨트롤러
	@RequestMapping(value = "/goHome", method = RequestMethod.GET)
	public String goHome() throws Exception {
		return "redirect:/";
	}
	
	//회원가입으로 가는 컨트롤러
	@RequestMapping(value = "/registerHost", method = RequestMethod.GET)
	public String registerHost() throws Exception {
		return "/register/register";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/register_run", method = RequestMethod.POST)
	public String register_run(UserVo userVo) throws Exception{
		// 요청정보 얻어서
		// DB 에 넣기 - Service - Dao - Mybatis - Oracle
		siUserService.setUserData(userVo);
		return "/register/registerSuccess";
	}
	
	// 회원가입 완료창
	@RequestMapping(value = "/register_succes", method = RequestMethod.POST)
	public String register_succes() throws Exception{
		return "redirect:/";
	}
	
	
	// 로그인으로 가는 컨트롤러
	@RequestMapping(value = "/loginHost", method = RequestMethod.GET)
	public String loginHost() throws Exception {
		return "/login/login";
	}
	
	// 로그인 처리
	@RequestMapping(value = "/login_run", method = RequestMethod.POST)
	public String login_run(HttpSession session, RedirectAttributes rttr, UserVo userVo) throws Exception{
		// 요청정보 얻어서
		UserVo userVo1 = siUserService.login_run(userVo);
//		System.out.println("userVo1 : "+userVo1);
		// DB 에 넣기 - Service - Dao - Mybatis - Oracle

		if(userVo1 == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/si/loginHost";
		}
		session.setAttribute("userVo", userVo1);
		
//		System.out.println(session.getAttribute("userVo"));
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/";
	}
	
	// 로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	// 내정보 가는 컨트롤러
	@RequestMapping(value = "/userInformation", method = RequestMethod.GET)
	public String userInformation() throws Exception {
		return "/user/user";
	}
	// 내정보 수정 처리
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdate(HttpSession session, UserVo userVo) throws Exception {
		siUserService.userUpdate(userVo);
		System.out.println(userVo);
		session.setAttribute("userVo", userVo);
		return "/user/user";
	}
}
	
