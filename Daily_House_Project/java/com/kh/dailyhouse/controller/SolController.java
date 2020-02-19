package com.kh.dailyhouse.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.dailyhouse.domain.RoomLowHighPriceDto;
import com.kh.dailyhouse.domain.RoomOptionVo;
import com.kh.dailyhouse.domain.RoomTypeVo;
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
		
		if(str_start_date == "") {
			str_start_date = null;
			str_end_date = null;
		}

		//날짜
		if (str_start_date != null) {
			if(str_start_date.equals("NaN-NaN-NaN")) {
				System.out.println("nan이 나타났다!!!!!!!!!!!!!!!!!!!");
				SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
				Calendar time = Calendar.getInstance();
				String format_time1 = format1.format(time.getTime());
				String[] arr = format_time1.split(" ");
				System.out.println(arr[0]);
				return null;
			}
			str_start_date += " 00:00:00.0";
			str_end_date += " 00:00:00.0";
			start_date = java.sql.Timestamp.valueOf(str_start_date);
			searchVo.setRoom_reserv_start_date(start_date);
			end_date = java.sql.Timestamp.valueOf(str_end_date);
			searchVo.setRoom_reserv_end_date(end_date);

			System.out.println("start_date: " + start_date);
			System.out.println("end_date: " + end_date);
		}
		
		RoomLowHighPriceDto priceDto = service.getRoomPrice();
		System.out.println("searchVo222222222: " + searchVo);
		System.out.println("priceDto7777777: " + priceDto);
		
		//가격
		if(searchVo.getLow_price() == 0 && searchVo.getLow_price() == 0) {
			searchVo.setLow_price(priceDto.getMin_low_price());
			searchVo.setHigh_price(priceDto.getMax_high_price());
		}
		
		//타입
		String type = searchVo.getArrType();
		System.out.println("타입이 널이 아닐때 실행!!!: "+type);
		String[] typeSplit = searchVo.getTypeSplit();
		typeSplit = type.split(",");
		searchVo.setTypeSplit(typeSplit);
		for(int i = 0; i < typeSplit.length; i++) {
			System.out.println("타입의 "+i+"번째: "+typeSplit[i]);
		}
		System.out.println("setTypeSplit 후 실행!!!: "+searchVo);
		/* 굳이 리스트로 안해도 될 것 같아서 일단 막아둡니다.
		 * ArrayList<String> TypeList = new ArrayList<>();
        
		for(String item : typeSplit) {
			TypeList.add(item);
		}*/
//		여기하고 있었음!!!!!! 이제 mybatis foreach 하면 됨!
		
		List<RoomVo> list = service.getRoomList(searchVo);
		int totalCount = service.getRoomCount(searchVo);
		List<RoomTypeVo> typeList = service.getRoomType();
		List<RoomOptionVo> optionList = service.getRoomOption();
		searchVo.setTotalCount(totalCount);
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("typeList", typeList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("priceDto", priceDto);
		
		return "searchResult/searchResult";
	}

}
