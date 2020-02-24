package com.kh.dailyhouse.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.dailyhouse.domain.UserVo;
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
	
	@RequestMapping(value="/status/{room_num}", method= RequestMethod.GET)
	public String getRoomStatus(@PathVariable("room_num") int room_num) throws Exception {
		System.out.println("확인용 : " + room_num);
		String status = booDatepickerService.getRoomStatus(room_num);
		return status;
	}
	
	@RequestMapping(value="/like/{room_num}", method= RequestMethod.GET)
	public String getLike(@PathVariable("room_num") int room_num,HttpSession session) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String user_email = userVo.getUser_email();
		System.out.println("작동함 : "+ user_email);
		String like = booDatepickerService.getCount(room_num, user_email);
		return like;
	}
	
	@RequestMapping(value="/insertLike/{room_num}", method= RequestMethod.GET)
	public String insertLike(@PathVariable("room_num") int room_num,HttpSession session) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String user_email = userVo.getUser_email();
		booDatepickerService.insertLike(room_num, user_email);
		return "insert";
	}
	
	@RequestMapping(value="/deleteLike/{room_num}", method= RequestMethod.GET)
	public String deleteLike(@PathVariable("room_num") int room_num,HttpSession session) throws Exception {
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String user_email = userVo.getUser_email();
		booDatepickerService.deleteLike(room_num, user_email);
		return "delete";
	}
}