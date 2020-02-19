package com.kh.dailyhouse.controller;

import java.util.List;

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
	public String getEndDate(@PathVariable("room_num") int room_num, @PathVariable("date") String date) throws Exception{
		String endDate = booDatepickerService.getEndDate(room_num, date);
		return endDate;
	}
	
	@RequestMapping(value="/start/{room_num}", method = RequestMethod.GET)
	public List<String> getCheckInDate(@PathVariable("room_num") int room_num) throws Exception {
		List<String> CheckInList = booDatepickerService.getCheckInIndex(room_num);
		return CheckInList;
	}
}