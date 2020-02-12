package com.kh.dailyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/boo/*")
public class BooController {

	@RequestMapping(value = "/room_detail", method = RequestMethod.GET)
	public String registerHost(@RequestParam("room_num") int room_num, Model model) throws Exception{
		//방을 선택시 user_email,room_num을 받아야됨
		
		return "/room_detail/Room_Detail";
	}
	
}