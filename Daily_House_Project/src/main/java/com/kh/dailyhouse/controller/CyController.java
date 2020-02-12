package com.kh.dailyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/cy/*")
public class CyController {

	// 호스트 등록하기 1page
	@RequestMapping(value = "/registerHost1", method = RequestMethod.GET)
	public String registerHost1() throws Exception{
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 2page
	@RequestMapping(value = "/registerHost2", method = RequestMethod.GET)
	public String registerHost2() throws Exception{
		return "/host/host_register_page2";
	}
	
	// 호스트 등록하기 3page
	@RequestMapping(value = "/registerHost3", method = RequestMethod.GET)
	public String registerHost3() throws Exception{
		return "/host/host_register_page3";
	}
	
	// 호스트 등록하기 4page
	@RequestMapping(value = "/registerHost4", method = RequestMethod.GET)
	public String registerHost4() throws Exception{
		return "/host/host_register_page4";
	}
}
