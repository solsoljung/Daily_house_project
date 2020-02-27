package com.kh.dailyhouse.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dailyhouse.domain.LikeVo;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.domain.TestDto;
import com.kh.dailyhouse.service.YOLikeListService;
import com.kh.dailyhouse.service.YOReservationListService;

@Controller
@RequestMapping("/yo/*")
public class YOController { 
	
	@Inject
	private YOReservationListService service;
	
	@Inject
	private YOLikeListService likeService;

	// 예약 페이지
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String reservation(HttpSession session, Model model, TestDto testDto) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo" + userVo);
//		System.out.println(testDto);
		return "/reservation/reservation_page";
	}
	
	// 결제 페이지
	@RequestMapping(value="/reservation_pay", method={RequestMethod.GET, RequestMethod.POST})
	public String reservationPay(HttpSession session, Model model, TestDto testDto) throws Exception {
		System.out.println("testDto:" + testDto);	
		// 서비스로부터 가격 얻어오기(단가)
		// 단가 * v
		System.out.println("reservation_pay");
		session.setAttribute("testDto", testDto);
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo" + userVo);
		model.addAttribute("v", testDto.getV());
		return "/reservation/reservation_pay_page";
	}
	
	// 결제하기
	@RequestMapping(value="/reservation_insert", method=RequestMethod.POST)
	public String payment(TestDto testDto, RedirectAttributes rttr) throws Exception {
		System.out.println("첫번째 testDto" +testDto);
		
		String check_id = testDto.getCheck_in();
		String check_out = testDto.getCheck_out();
		check_id += " 00:00:00.0";
		check_out += " 00:00:00.0";
		testDto.setRoom_reserv_start_date(java.sql.Timestamp.valueOf(check_id));
		testDto.setRoom_reserv_end_date(java.sql.Timestamp.valueOf(check_out));
		System.out.println("솔 예약 테스트 testDto" +testDto);
		
		int result = service.availableReserv(testDto);
		System.out.println("예약결과는? "+result);
		if(result > 0) {
			rttr.addFlashAttribute("result", "success");
			service.insertReservation(testDto);
			return "redirect:/yo/reservation_list";
		}
		rttr.addFlashAttribute("result", "fail");
//		rttr.addAttribute("result", "fail");
		return "redirect:/yo/reservation_pay";
	}
	
	// 예약 및 결제내역
	@RequestMapping(value="/reservation_list", method=RequestMethod.GET)
	public String reservationList(HttpSession session, Model model, TestDto testDto) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		if (userVo == null) {
			return "redirect:/si/loginHost";
		}
		String user_email = userVo.getUser_email();
		List<ReservationVo> list = service.getReservationList(user_email);
		model.addAttribute("list", list);
		return "/reservation/reservation_list_page";
	}
	
	// 예약 취소하기 (예약 상태 N 변경)
	@RequestMapping(value="/reservation_delete/{reserv_num}", method=RequestMethod.GET)
	public String cancelReservation(@PathVariable("reserv_num") int reserv_num) throws Exception {
		System.out.println("예약상태를 바꾸는 중입닞다:" + reserv_num);
		ReservationVo reservationVo = new ReservationVo();
		reservationVo.setReserv_num(reserv_num);
		reservationVo.setReserv_state("N");
		service.updateRoomState(reservationVo);
		return "redirect:/yo/reservation_list";
	}
	
	//예약 취소 페이지 이동
	@RequestMapping(value="/reserv_cancle_page/{reserv_num}", method=RequestMethod.GET)
	public String reservCanclePage(@PathVariable("reserv_num") int reserv_num, Model model) throws Exception {
		System.out.println("reserv_cancle_page:" + reserv_num);
		TestDto dto = service.getReservRoomData(reserv_num);
		model.addAttribute("dto", dto);
		model.addAttribute("reserv_num", reserv_num);
		return "/reservation/reservation_cancle";
	}
	
	
	//체크아웃 관리자 승인 페이지 이동
	@RequestMapping(value="/adminCheckOutList", method = RequestMethod.GET)
	public String adminCheckOutList(Model model) throws Exception {
		
		List<TestDto> list = service.getAvailableCheckout();
		model.addAttribute("list", list);
		
		return "/admin/admin_check_out_list";
	}
	
	//관리자 페이지 - 손님들 체크아웃 기간이 넘어 호스트에게 돈을 입금시켜줘야 되는 부분
	@RequestMapping(value="/approveCheckout", method = RequestMethod.POST)
	@ResponseBody
	public String adminCheckOut(@RequestBody TestDto testDto) throws Exception {
		System.out.println("테스트디티오가 잘 들어왔는지 테스트: "+testDto);
		service.adminCheckOut(testDto);
		return "success";
	}
	
	// 찜목록 가져오기
	@RequestMapping(value="/like_list", method=RequestMethod.GET)
	public String likeList(HttpSession session, Model model) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo" + userVo);
		if (userVo == null) {
			return "redirect:/si/loginHost";
		}
		String user_email = userVo.getUser_email();
		List<LikeVo> likeList = likeService.getLikeList(user_email);
//		System.out.println("likeList : "+ likeList);
		model.addAttribute("likeList", likeList);
		return "/like/like_list_page";
	}
	
	
	// 찜목록 삭제
	@RequestMapping(value="/like_delete/{like_num}", method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteLike(@PathVariable("like_num") int like_num) throws Exception {
//		System.out.println("like_num:" + like_num);
		likeService.deleteLike(like_num);
		return "success";
	}
	
	// 사용자 돈 얼마있는지 확인
	@RequestMapping(value="/check_user_pay", method=RequestMethod.GET)
	@ResponseBody
	public int check_user_pay(String user_email) throws Exception {
		return service.getUserPoint(user_email);
	}

}
