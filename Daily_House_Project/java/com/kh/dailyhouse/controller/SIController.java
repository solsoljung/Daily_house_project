package com.kh.dailyhouse.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.service.SiUserService;
import com.kh.dailyhouse.util.FileUploadUtil;

@Controller
@RequestMapping("/si/*")
public class SIController {
	
	@Resource
	private String uploadPath; 
	
	@Inject
	private SiUserService siUserService;
	// 업로드 관련 컨트롤러
	@RequestMapping(value = "/displayFile", method =  RequestMethod.GET)
	@ResponseBody
	public byte[] displayFile(@RequestParam("fileName") String fileName) throws Exception {
		String realPath = uploadPath + File.separator + fileName.replace("/", "\\");
		System.out.println("realPath:"+ realPath);
		FileInputStream is = new FileInputStream(realPath);
		byte[] bytes = IOUtils.toByteArray(is);
		is.close();
		return bytes;
	}
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
		// DB 에 넣기 - Service - Dao - Mybatis - Oracle
		
		if(userVo1 == null) {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/si/loginHost";
		}
		session.setAttribute("userVo", userVo1);
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
	public String userUpdate(HttpSession session, UserVo userVo, MultipartFile file) throws Exception {
		
		String originalFilename = file.getOriginalFilename();
		String dirPath = FileUploadUtil.uploadFile(uploadPath, originalFilename, file.getBytes());
		String path = dirPath.replace("\\", "/");
		String checkPath = path.substring(path.length() - 3);
		
		if(checkPath.equals("jpg") || checkPath.equals("png") || checkPath.equals("jpeg")) {
			userVo.setUser_pic(path); 	// pic에 파일 이름 넣음
		}
		siUserService.userUpdate(userVo);		// pic에 파일 이름이 들어간채로 데이터 베이스로 감
		System.out.println("userVo입니다!!"+userVo);
		System.out.println("");
		session.setAttribute("userVo", userVo);
		return "/user/user";
	}
	// 비밀번호 찾기로 가는 컨트롤러
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findPassword() throws Exception {
		return "/login/passwordFind";
	}
	// 비밀번호 찾기 처리
	@RequestMapping(value = "/foundPassword", method = RequestMethod.POST)
	public String foundPassword(HttpSession session, RedirectAttributes rttr, String user_email) throws Exception {
		String user_pw = siUserService.foundPassword(user_email);
		if (user_pw == null) {
			rttr.addFlashAttribute("msg", "notFoundEmail");
			return "redirect:/si/loginHost";
		}
		session.setAttribute("user_pw", user_pw);
		return "/login/passwordFound";
	}
	// 비밀번호 수정으로 가는 컨트롤러
	@RequestMapping(value = "/updatePasswordHost", method = RequestMethod.GET)
	public String updatePasswordHost() throws Exception {
		return "/user/updatePassword";
	}
	// 비밀번호 수정 처리
	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public String updatePassword(HttpSession session, RedirectAttributes rttr, UserVo userVo) throws Exception {
		System.out.println(userVo);
		siUserService.updatePassword(userVo);
		rttr.addFlashAttribute("msg", "updatePassword");
		session.invalidate();
		return "redirect:/si/loginHost";
	}
	
}
	
