package com.kh.dailyhouse.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.service.BooRoomDetailService;

@Controller
@RequestMapping("/boo/*")
public class BooController {
	
	@Inject
	private BooRoomDetailService booRoomDetailService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String registerHost(Model model) throws Exception{
		//방을 선택시 user_email,room_num을 받아야됨
		RoomDto roomDto = booRoomDetailService.detail(51);
		model.addAttribute(roomDto);
		return "/room_detail/Room_Detail";
	}
	
}