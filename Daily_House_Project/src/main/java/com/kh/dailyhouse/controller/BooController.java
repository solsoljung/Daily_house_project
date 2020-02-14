package com.kh.dailyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.service.BooRoomDetailService;

@Controller
@RequestMapping("/boo/*")
public class BooController {
	
	@Inject
	private BooRoomDetailService booRoomDetailService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getRoomDetail(Model model) throws Exception{
		
		
		//방을 선택시 room_num을 받아야됨
		Map<String, Object> paramMap = booRoomDetailService.detail(51);
		RoomDto roomDto = (RoomDto)paramMap.get("dto");
		List<RoomReviewVo> reviewList = (List<RoomReviewVo>)paramMap.get("ReviewList");
		
		model.addAttribute("roomDto", roomDto);
		model.addAttribute("reviewList", reviewList);
		
		return "/room_detail/Room_Detail";
	}
	
	@RequestMapping(value="/review", method = RequestMethod.POST)
	public String postInputReview(RoomReviewVo roomReviewVo) throws Exception{		
		int Review_score_location = roomReviewVo.getReview_score_location();
		int Review_score_cleanliness = roomReviewVo.getReview_score_cleanliness();
		int Review_score_checkin = roomReviewVo.getReview_score_checkin();
		int Review_score_communication = roomReviewVo.getReview_score_communication();
		int total_score = (Review_score_location+Review_score_cleanliness+Review_score_checkin+Review_score_communication)/4;
		roomReviewVo.setTotal_score(total_score);
		System.out.println("RoomReviewVo : " + roomReviewVo);
		
		booRoomDetailService.insertReview(roomReviewVo);
		return "redirect:/boo/detail";
	}
	
}