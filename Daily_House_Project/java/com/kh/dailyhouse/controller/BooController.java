package com.kh.dailyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dailyhouse.domain.PointDto;
import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomPictureVo;
import com.kh.dailyhouse.domain.RoomReviewDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.service.BooPointListService;
import com.kh.dailyhouse.service.BooRoomDetailService;

@Controller
@RequestMapping("/boo/*")
public class BooController {
	
	@Inject
	private BooRoomDetailService booRoomDetailService;
	
	@Inject
	private BooPointListService booPointListService;
	
	@RequestMapping(value = "/detail", method = {RequestMethod.GET, RequestMethod.POST})
	public String getRoomDetail(@RequestParam("room_num") int room_num, Model model, ReviewPagingDto reviewPagingDto) throws Exception{
		//방을 선택시 room_num을 받아야됨
		Map<String, Object> paramMap = booRoomDetailService.detail(room_num, reviewPagingDto);
		RoomDto roomDto = (RoomDto)paramMap.get("dto");
		
		List<RoomPictureVo> roomPicInfoList = (List<RoomPictureVo>)paramMap.get("roomPicInfo");
		RoomPictureVo OneAreaPic = (RoomPictureVo)paramMap.get("OneAreaPic");
		List<RoomPictureVo> TwoAreaPic = (List<RoomPictureVo>)paramMap.get("TwoAreaPic");
		List<RoomPictureVo> ThreeAreaPic = (List<RoomPictureVo>)paramMap.get("ThreeAreaPic");
		
		List<RoomReviewDto> reviewList = (List<RoomReviewDto>)paramMap.get("ReviewList");
		String type = (String)paramMap.get("type");
		List<String> OptionList = (List<String>)paramMap.get("OptionList");
		List<String> OptionCode = (List<String>)paramMap.get("OptionCode");
		
		model.addAttribute("roomDto", roomDto);
		
		model.addAttribute("roomPicInfoList", roomPicInfoList);
		model.addAttribute("OneAreaPic", OneAreaPic);
		model.addAttribute("TwoAreaPic", TwoAreaPic);
		model.addAttribute("ThreeAreaPic", ThreeAreaPic);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewPagingDto", reviewPagingDto);
		model.addAttribute("type", type);
		model.addAttribute("OptionList", OptionList);
		model.addAttribute("OptionCode", OptionCode);
		
		return "/room_detail/Room_Detail";
	}
	
	//리뷰 작성
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

	}
	
	//포인트 이용 내역 보여주기
	@RequestMapping(value="/pointlist", method = RequestMethod.GET)
	public String pointUseList(Model model, HttpSession session, ReviewPagingDto reviewPagingDto) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String user_email = userVo.getUser_email();
		
		List<PointDto> pointList = booPointListService.getPointList(user_email, reviewPagingDto);
		
		model.addAttribute("pointList", pointList);
		model.addAttribute("reviewPagingDto", reviewPagingDto);
		
		return "/pointuselist/PointUseList";
	}
}