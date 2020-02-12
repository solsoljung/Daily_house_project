package com.kh.dailyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/cy/*")
public class CyController {

	//호스트 등록하기 1page
	@RequestMapping(value = "/registerHost", method = RequestMethod.GET)
	public String registerHost() throws Exception{
		return "/host/host_register_page";
	}
}
