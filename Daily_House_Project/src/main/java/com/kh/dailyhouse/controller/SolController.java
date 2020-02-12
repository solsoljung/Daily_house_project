package com.kh.dailyhouse.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.service.SolRoomService;

@Controller
@RequestMapping("/sol/*")
public class SolController {
	
	@Inject
	private SolRoomService service;
	
	@RequestMapping(value="/room", method=RequestMethod.GET)
	public String showRoom(Model model) throws Exception {
//		List<RoomVo> list = service.getRoomList();
//		model.addAttribute("list", list);
		return "searchResult/searchResult";
	}

}
