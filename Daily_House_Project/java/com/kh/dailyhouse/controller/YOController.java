package com.kh.dailyhouse.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dailyhouse.domain.LikeVo;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.UserVo;
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
	public String reservation(HttpSession session, Model model) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo" + userVo);
		return "/reservation/reservation_page";
	}
	
	// 결제 페이지
	@RequestMapping(value="/reservation_pay", method=RequestMethod.GET)
	public String reservationPay(HttpSession session, Model model) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo" + userVo);
		return "/reservation/reservation_pay_page";
	}
	
	// 예약 및 결제내역
	@RequestMapping(value="/reservation_list", method=RequestMethod.GET)
	public String reservationList(HttpSession session, Model model) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo" + userVo);
		System.out.println("service:" + service);
		String user_email = userVo.getUser_email();
		List<ReservationVo> list = service.getReservationList(user_email);
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		return "/reservation/reservation_list_page";
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
		model.addAttribute("likeList", likeList);
		return "/like/like_list_page";
	}
	
	
	// 찜목록 삭제
	@RequestMapping(value="/like_delete/{like_num}", method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteLike(@PathVariable("like_num") int like_num) throws Exception {
		System.out.println("like_num:" + like_num);
		likeService.deleteLike(like_num);
		return "success";
	}

}
