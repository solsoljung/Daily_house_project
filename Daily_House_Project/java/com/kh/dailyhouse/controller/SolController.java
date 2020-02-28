package com.kh.dailyhouse.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
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

import com.kh.dailyhouse.domain.MessageVo;
import com.kh.dailyhouse.domain.RoomLowHighPriceDto;
import com.kh.dailyhouse.domain.RoomOptionVo;
import com.kh.dailyhouse.domain.RoomTypeVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchKeywordDto;
import com.kh.dailyhouse.domain.SearchVo;
import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.service.BooRoomDetailService;
import com.kh.dailyhouse.service.SolMessageService;
import com.kh.dailyhouse.service.SolRoomService;

@Controller
@RequestMapping("/sol/*")
public class SolController {

	@Inject
	private SolRoomService service;
	
	@Inject
	private SolMessageService messageService;
	
	@Inject
	private BooRoomDetailService booRoomDetailService;
	
	@RequestMapping(value = "/keywordList/{search_keyword}", method = RequestMethod.GET)
	@ResponseBody
	public List<SearchKeywordDto> getKeywordList(@PathVariable("search_keyword") String search_keyword) throws Exception {
		System.out.println("keywordList 실행됨");
		System.out.println("SearchKeywordDto: "+ search_keyword);
		SearchKeywordDto dto = new SearchKeywordDto();
		dto.setSearch_keyword(search_keyword);
		return service.getKeywordList(dto);
	}

	@RequestMapping(value = "/room", method = {RequestMethod.GET, RequestMethod.POST})
	public String showRoom(Model model, SearchVo searchVo) throws Exception {
		System.out.println("room get 실행됨");
		String str_start_date = searchVo.getStr_start_date();
		String str_end_date = searchVo.getStr_end_date();
		
		Timestamp start_date;
		Timestamp end_date;
		
		System.out.println("첫번째 searchVo: "+searchVo);
		
		if(str_start_date == "") {
			str_start_date = null;
			str_end_date = null;
			searchVo.setStr_start_date(null);
			searchVo.setStr_end_date(null);
		}
		
		if(searchVo.getJoinTypeName() != null) {
			if(searchVo.getJoinTypeName() == "") {
				searchVo.setJoinTypeName("null");
			}
		}

		//날짜
		if (str_start_date != null) {
			if(str_start_date.equals("NaN-NaN-NaN")) {
				System.out.println("str_start_date nan이 나타났다!!!!!!!!!!!!!!!!!!!");
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
			
		}
		
		RoomLowHighPriceDto priceDto = service.getRoomPrice();
		
		//가격
		if(searchVo.getLow_price() == 0 && searchVo.getLow_price() == 0) {
			searchVo.setLow_price(priceDto.getMin_low_price());
			searchVo.setHigh_price(priceDto.getMax_high_price());
		}
		
		//옵션
		String option = searchVo.getArrOption();
		System.out.println("옵션!!!: "+option);

		if(option == "") {
			searchVo.setArrOption(null);
			option = null;
		}
		
		if(option != null && !option.equals(null)) {
			List<String> listOption = Arrays.asList(option.split(","));
	        searchVo.setListOption(listOption);
		}
		
		System.out.println("두번째 searchVo: "+searchVo);
		
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

	//메세지 리스트 페이지로 이동
	@RequestMapping(value = "/message_list", method = RequestMethod.GET)
	public String message_list(HttpSession session, Model model) throws Exception {
		
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		String user_email = userVo.getUser_email();
		
		List<MessageVo> messageList = messageService.getMessageList(user_email);
		model.addAttribute("messageList", messageList);
		
		return "/message/message_list";
	}
	
	//메세지 오픈날짜 업데이트
	@RequestMapping(value = "/openDateUpdate/{message_num}", method = RequestMethod.PUT)
	@ResponseBody
	public String openDateUpdate(@PathVariable("message_num") int message_num) throws Exception {
		System.out.println("controller의 메세지 번호: "+message_num);
		messageService.openDateUpdate(message_num);
		
		return "success";
	}
	
	//메세지 페이지로 이동
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String sendReply(MessageVo messageVo, Model model) throws Exception {
		String receiver = messageVo.getReceiver();
		String sender = messageVo.getSender();
		
		System.out.println("messageVo: "+ messageVo);
		
		//여기하고 있ㅅ었상ㅁ!!
		
		return null;
	}
	
}
