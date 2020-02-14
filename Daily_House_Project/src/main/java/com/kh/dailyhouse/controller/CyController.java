package com.kh.dailyhouse.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.service.CyRoomOptionService;
import com.kh.dailyhouse.service.CyRoomTypeService;

@Controller
@RequestMapping("/cy/*")
public class CyController {

	@Inject
	private CyRoomTypeService roomTypeService;
	@Inject
	private CyRoomOptionService roomOptionService;
	
	// 호스트 등록하기 1page readonly
	@RequestMapping(value = "/registerHost1", method = RequestMethod.GET)
	public String registerHost1(RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 1page
	@RequestMapping(value = "/registerHost1Post", method = RequestMethod.POST)
	public String registerHost1Post(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println(">>>> controller111 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 2page
	@RequestMapping(value = "/registerHost2Post", method = RequestMethod.POST)
	public String registerHost2(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println(">>>> controller222 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page2";
	}
	
	// 호스트 등록하기 3page
	@RequestMapping(value = "/registerHost3Post", method = RequestMethod.POST)
	public String registerHost3(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println(">>>> controller333 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		model.addAttribute("roomTypeList", roomTypeService.getRoomTypeList());
		return "/host/host_register_page3";
	}
	
	// 호스트 등록하기 4page
	@RequestMapping(value = "/registerHost4Post", method = RequestMethod.POST)
	public String registerHost4(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println(">>>> controller444 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		model.addAttribute("roomOptionList", roomOptionService.getRoomOptionList());
		return "/host/host_register_page4";
	}
	
	// 호스트 등록하기 최종
	@RequestMapping(value = "/registerHost", method = RequestMethod.POST)
	public String registerHost(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println(">>>> registerHost roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "redirect:/";
	}
}
