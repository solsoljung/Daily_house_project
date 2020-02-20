<<<<<<< HEAD
package com.kh.dailyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.service.BooRoomDetailService;

@Controller
@RequestMapping("/boo/*")
public class BooController {
	
	@Inject
	private BooRoomDetailService booRoomDetailService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getRoomDetail(@RequestParam("room_num") int room_num, Model model, ReviewPagingDto reviewPagingDto) throws Exception{
		//방을 선택시 room_num을 받아야됨
		Map<String, Object> paramMap = booRoomDetailService.detail(room_num, reviewPagingDto);
		RoomDto roomDto = (RoomDto)paramMap.get("dto");
		List<RoomReviewDto> reviewList = (List<RoomReviewDto>)paramMap.get("ReviewList");
		String type = (String)paramMap.get("type");
		List<String> OptionList = (List<String>)paramMap.get("OptionList");
		List<String> OptionCode = (List<String>)paramMap.get("OptionCode");
		
		model.addAttribute("roomDto", roomDto);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewPagingDto", reviewPagingDto);
		model.addAttribute("type", type);
		model.addAttribute("OptionList", OptionList);
		model.addAttribute("OptionCode", OptionCode);
		
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
		
		booRoomDetailService.insertReview(roomReviewVo);
		int num = roomReviewVo.getRoom_num();
		return "redirect:/boo/detail?room_num="+num;
=======
package com.kh.dailyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.service.BooRoomDetailService;

@Controller
@RequestMapping("/boo/*")
public class BooController {
	
	@Inject
	private BooRoomDetailService booRoomDetailService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getRoomDetail(@RequestParam("room_num") int room_num, Model model, ReviewPagingDto reviewPagingDto) throws Exception{
		//방을 선택시 room_num을 받아야됨
		Map<String, Object> paramMap = booRoomDetailService.detail(room_num, reviewPagingDto);
		RoomDto roomDto = (RoomDto)paramMap.get("dto");
		List<RoomReviewVo> reviewList = (List<RoomReviewVo>)paramMap.get("ReviewList");
		String type = (String)paramMap.get("type");
		List<String> OptionList = (List<String>)paramMap.get("OptionList");
		List<String> OptionCode = (List<String>)paramMap.get("OptionCode");
		
		model.addAttribute("roomDto", roomDto);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewPagingDto", reviewPagingDto);
		model.addAttribute("type", type);
		model.addAttribute("OptionList", OptionList);
		model.addAttribute("OptionCode", OptionCode);
		
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
		
		booRoomDetailService.insertReview(roomReviewVo);
		int num = roomReviewVo.getRoom_num();
		return "redirect:/boo/detail?room_num="+num;
>>>>>>> branch 'master' of https://github.com/solsoljung/Daily_house_project.git

	}
}