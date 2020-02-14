package com.kh.dailyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.service.BooRoomDetailService;

@Controller
@RequestMapping("/boo/*")
public class BooController {
	
	@Inject
	private BooRoomDetailService booRoomDetailService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String registerHost(Model model) throws Exception{
		//방을 선택시 room_num을 받아야됨
		Map<String, Object> paramMap = booRoomDetailService.detail(51);
		RoomDto roomDto = (RoomDto)paramMap.get("dto");
		List<RoomReviewVo> reviewList = (List<RoomReviewVo>)paramMap.get("ReviewList");
		
		model.addAttribute("roomDto", roomDto);
		model.addAttribute("reviewList", reviewList);
		
		model.addAttribute("user_email", "test@naver.com"); // 로그인시 입력될 아이디 부분
		return "/room_detail/Room_Detail";
	}
}