package com.kh.dailyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.dailyhouse.domain.RoomVo;

@Controller
@RequestMapping("/cy/*")
public class CyController {

	// 호스트 등록하기 1page readonly
	@RequestMapping(value = "/registerHost1", method = RequestMethod.GET)
	public String registerHost1() throws Exception{
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 1page
	@RequestMapping(value = "/registerHost1Post", method = RequestMethod.POST)
	public String registerHost1Post(Model model, RoomVo roomVo) throws Exception{
		System.out.println(">>>> controller111 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 2page
	@RequestMapping(value = "/registerHost2Post", method = RequestMethod.POST)
	public String registerHost2(Model model, RoomVo roomVo) throws Exception{
		System.out.println(">>>> controller222 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page2";
	}
	
	// 호스트 등록하기 3page
	@RequestMapping(value = "/registerHost3Post", method = RequestMethod.POST)
	public String registerHost3(Model model, RoomVo roomVo) throws Exception{
		System.out.println(">>>> controller333 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page3";
	}
	
	// 호스트 등록하기 4page
	@RequestMapping(value = "/registerHost4Post", method = RequestMethod.POST)
	public String registerHost4(Model model, RoomVo roomVo) throws Exception{
		System.out.println(">>>> controller444 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page4";
	}
}
