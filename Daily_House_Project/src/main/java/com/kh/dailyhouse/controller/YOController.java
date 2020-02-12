package com.kh.dailyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/yo/*")
public class YOController {
	
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String reservation() throws Exception {
		return "/reservation/reservation_page";
	}
	
	@RequestMapping(value="/reservation_pay", method=RequestMethod.GET)
	public String reservationPay() throws Exception {
		return "/reservation/reservation_pay_page";
	}
	
	@RequestMapping(value="/reservation_list", method=RequestMethod.GET)
	public String reservationList() throws Exception {
		return "/reservation/reservation_list_page";
	}

}
