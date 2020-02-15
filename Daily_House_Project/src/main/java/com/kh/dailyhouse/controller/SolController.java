package com.kh.dailyhouse.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchVo;
import com.kh.dailyhouse.service.SolRoomService;

@Controller
@RequestMapping("/sol/*")
public class SolController {

	@Inject
	private SolRoomService service;

	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String showRoom(Model model, SearchVo searchVo) throws Exception {
		System.out.println("room get 실행됨");
		System.out.println("searchVo:" + searchVo);
		String str_start_date = searchVo.getStr_start_date();
		String str_end_date = searchVo.getStr_end_date();

		System.out.println("str_start_date: " + str_start_date);
		System.out.println("str_end_date: " + str_end_date);
		
		Timestamp start_date;
		Timestamp end_date;

		if (str_start_date != null) {

			str_start_date += " 00:00:00.0";
			str_end_date += " 00:00:00.0";

			start_date = java.sql.Timestamp.valueOf(str_start_date);
			searchVo.setRoom_reserv_start_date(start_date);

			end_date = java.sql.Timestamp.valueOf(str_end_date);
			searchVo.setRoom_reserv_end_date(end_date);

			System.out.println("start_date: " + start_date);
			System.out.println("end_date: " + end_date);
		}
		
		List<RoomVo> list = service.getRoomList(searchVo);
		int totalCount = service.getRoomCount(searchVo);
		searchVo.setTotalCount(totalCount);
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchVo);
		
		return "searchResult/searchResult";
	}

}
