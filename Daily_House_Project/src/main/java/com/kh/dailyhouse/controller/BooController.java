package com.kh.dailyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/boo/*")
public class BooController {

	@RequestMapping(value = "/room_detail", method = RequestMethod.GET)
	public String registerHost() throws Exception{
		return "/room_detail/Room_Detail";
	}
}
