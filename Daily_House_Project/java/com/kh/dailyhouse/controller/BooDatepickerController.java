package com.kh.dailyhouse.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.dailyhouse.service.BooDatepickerService;

@RestController
@RequestMapping("/datepicker")
public class BooDatepickerController {
	@Inject
	private BooDatepickerService booDatepickerService;
	
	@RequestMapping(value = "/end/{room_num}/{date}", method = RequestMethod.GET)
	public String getRoomDetail(@PathVariable("room_num") int room_num, @PathVariable("date") String date) throws Exception{
		String endDate = booDatepickerService.getEndDate(room_num, date);
		return endDate;
	}
	
}