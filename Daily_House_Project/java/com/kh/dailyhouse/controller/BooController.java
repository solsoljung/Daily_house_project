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

import com.kh.dailyhouse.domain.AdminReservResultDto;
import com.kh.dailyhouse.domain.MessageDto;
import com.kh.dailyhouse.domain.MessageVo;
import com.kh.dailyhouse.domain.PointDto;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomPictureVo;
import com.kh.dailyhouse.domain.RoomReviewDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.service.BooAdminService;
import com.kh.dailyhouse.service.BooPointListService;
import com.kh.dailyhouse.service.BooRoomDetailService;

@Controller
@RequestMapping("/boo/*")
public class BooController {
	
	@Inject
	private BooRoomDetailService booRoomDetailService;
	
	@Inject
	private BooPointListService booPointListService;
	
	@Inject
	private BooAdminService booAdminService;
	
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
	
	//관리자 페이지 - 손님들이 예약한 리스트들 보여주기
	@RequestMapping(value="/adminReservList", method = RequestMethod.GET)
	public String adminReservList(Model model) throws Exception {
		List<ReservationVo> adminReservaionList = booAdminService.adminReservationList();
		
		model.addAttribute("adminReservaionList", adminReservaionList);
		
		return "/admin/admin_reservation_list";

	}
	
	//관리자 페이지 - 예약한 리스트들 중 확인 버튼을 눌렀을때
	@RequestMapping(value="/adminReservResult", method = RequestMethod.GET)
	public String adminReservResult(AdminReservResultDto adminReservResultDto) throws Exception {
		//N을 R로 바꿔줌
		booAdminService.updateReservState(adminReservResultDto);
		//마일리지 회수, 결제 취소 user_point 수정
		booAdminService.updateUserPoint(adminReservResultDto);
		//포인트 이용 내역에 작성
		booAdminService.setPointList(adminReservResultDto);
		
		return "redirect:/boo/adminReservList";
	}
	
	//쪽지 보내기 페이지
	@RequestMapping(value="/sendMessage", method = RequestMethod.POST)
	public String sendMessage(Model model, MessageDto messageDto) throws Exception {
		String receiver = messageDto.getReceiver();
		String sender = messageDto.getSender();
		
		if (sender.equals("") || sender == null ) {
			return "redirect:/si/loginHost";
		}
		
		UserVo receiverInfo = booRoomDetailService.getReceiverInfo(receiver);
		
		model.addAttribute("messageDto", messageDto);
		model.addAttribute("receiverInfo", receiverInfo);
		
		return "/message/send_message";
	}
	
	//쪽지 보내기 처리
	@RequestMapping(value="/sendMessagePro", method = RequestMethod.POST)
	public String sendMessagePro(MessageDto messageDto) throws Exception {
		int room_num = messageDto.getRoom_num();
		booRoomDetailService.sendMessagePro(messageDto);
		
		return "redirect:/boo/detail?room_num="+room_num;
	}
}