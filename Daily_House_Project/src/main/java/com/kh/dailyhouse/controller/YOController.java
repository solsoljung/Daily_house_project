package com.kh.dailyhouse.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.service.YOReservationListService;

@Controller
@RequestMapping("/yo/*")
public class YOController {
	
	@Inject
	private YOReservationListService service;
	
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String reservation() throws Exception {
		return "/reservation/reservation_page";
	}
	
	@RequestMapping(value="/reservation_pay", method=RequestMethod.GET)
	public String reservationPay() throws Exception {
		return "/reservation/reservation_pay_page";
	}
	
	@RequestMapping(value="/reservation_list", method=RequestMethod.GET)
	public String reservationList(Model model) throws Exception {
		System.out.println("service:" + service);
		List<ReservationVo> list = service.getReservationList();
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		return "/reservation/reservation_list_page";
	}
	
	@RequestMapping(value="/like_list", method=RequestMethod.GET)
	public String likeList() throws Exception {
		return "/like/like_list_page";
	}


}
