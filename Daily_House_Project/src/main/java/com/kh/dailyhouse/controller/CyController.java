package com.kh.dailyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.RegisterRoomDto1;
import com.kh.dailyhouse.domain.RegisterRoomDto2;

@Controller
@RequestMapping("/cy/*")
public class CyController {

	// 호스트 등록하기 1page
	@RequestMapping(value = "/registerHost1", method = RequestMethod.GET)
	public String registerHost1() throws Exception{
		return "/host/host_register_page1";
	}
	@RequestMapping(value = "/registerHost1Post", method = RequestMethod.POST)
	public String registerHost1Post(Model model, RegisterRoomDto1 roomDto1) throws Exception{
		System.out.println(">>>> controller111 roomDto1: " + roomDto1);
		model.addAttribute("roomDto1", roomDto1);
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 2page
	@RequestMapping(value = "/registerHost2Post", method = RequestMethod.POST)
	public String registerHost2(Model model, RegisterRoomDto1 roomDto1) throws Exception{
		System.out.println(">>>> controller222 roomDto1: " + roomDto1);
		model.addAttribute("roomDto1", roomDto1);
		return "/host/host_register_page2";
	}
	
	// 호스트 등록하기 3page
	@RequestMapping(value = "/registerHost3Post", method = RequestMethod.POST)
	public String registerHost3(Model model, RegisterRoomDto2 roomDto2) throws Exception{
		System.out.println(">>>> controller333 roomDto2: " + roomDto2);
		model.addAttribute("roomDto2", roomDto2);
		return "/host/host_register_page3";
	}
	
	// 호스트 등록하기 4page
	@RequestMapping(value = "/registerHost4Post", method = RequestMethod.POST)
	public String registerHost4() throws Exception{
		return "/host/host_register_page4";
	}
}
