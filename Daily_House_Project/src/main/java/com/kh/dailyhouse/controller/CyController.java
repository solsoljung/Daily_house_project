package com.kh.dailyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dailyhouse.domain.HostVo;
import com.kh.dailyhouse.domain.RoomDetailDto;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.service.CyRoomOptionService;
import com.kh.dailyhouse.service.CyRoomService;
import com.kh.dailyhouse.service.CyRoomTypeService;

@Controller
@RequestMapping("/cy/*")
public class CyController {

	@Inject
	private CyRoomTypeService roomTypeService;
	@Inject
	private CyRoomOptionService roomOptionService;
	@Inject
	private CyRoomService roomService;
	
	// 호스트의 방 리스트 보기
	@RequestMapping(value = "/HostRoomList", method = RequestMethod.GET)
	public String HostRoomList(Model model) throws Exception{
		HostVo hostVo = roomService.getHostInfo("test@naver.com");
		model.addAttribute("hostVo", hostVo);
		List<RoomDetailDto> list = roomService.getHostRoomList("test@naver.com");
		model.addAttribute("list", list);
		return "/host/host_room_list";
	}
	
	// 호스트가 등록한 방 1개 상세보기
	@RequestMapping(value = "/HostRoomDetail",  method = {RequestMethod.GET, RequestMethod.POST})
	public String HostRoomDetail(Model model, @RequestParam("room_num") int room_num) throws Exception{
		RoomDetailDto roomDetailDto = roomService.getHostRoomDetail(room_num);
		model.addAttribute("roomDetailDto", roomDetailDto);
		model.addAttribute("roomTypeList", roomTypeService.getRoomTypeList());
		model.addAttribute("roomOptionList", roomOptionService.getRoomOptionList());
		return "/host/host_room_detail";
	}
	
	// 호스트 방 정보 수정하기
	@RequestMapping(value = "/HostModifyRoom", method = RequestMethod.POST)
	public String HostModifyRoom(Model model, RoomVo roomVo) throws Exception{
		System.out.println("HostModifyRoom roomVo: " + roomVo);
		roomService.updateHostRoom(roomVo);
		return "redirect:/cy/HostRoomDetail?room_num=" + roomVo.getRoom_num();
	}
	
	// 호스트 등록하기 1page readonly
	@RequestMapping(value = "/registerHost1", method = RequestMethod.GET)
	public String registerHost1(RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 1page
	@RequestMapping(value = "/registerHost1Post", method = RequestMethod.POST)
	public String registerHost1Post(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println(">>>> controller111 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 2page
	@RequestMapping(value = "/registerHost2Post", method = RequestMethod.POST)
	public String registerHost2(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println(">>>> controller222 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page2";
	}
	
	// 호스트 등록하기 3page
	@RequestMapping(value = "/registerHost3Post", method = RequestMethod.POST)
	public String registerHost3(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		String[] arrPics = roomVo.getPics();
		for(int i=0; i<arrPics.length; i++) {
			System.out.println("arrPics " + i + ": " + arrPics[i]);
		}
		System.out.println(">>>> controller333 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		model.addAttribute("roomTypeList", roomTypeService.getRoomTypeList());
		return "/host/host_register_page3";
	}
	
	// 호스트 등록하기 4page
	@RequestMapping(value = "/registerHost4Post", method = RequestMethod.POST)
	public String registerHost4(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		String[] arrPics = roomVo.getPics();
		for(int i=0; i<arrPics.length; i++) {
			System.out.println("arrPics " + i + ": " + arrPics[i]);
		}
		System.out.println(">>>> controller444 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		model.addAttribute("roomOptionList", roomOptionService.getRoomOptionList());
		return "/host/host_register_page4";
	}
	
	// 호스트 등록하기 최종
	@RequestMapping(value = "/registerHost", method = RequestMethod.POST)
	public String registerHost(Model model, RoomVo roomVo) throws Exception{
		roomVo.setUser_email("test@naver.com"); //나중에 로그인했는지 안했는지 검사하기@@@@@@@@@@@@@@@@@@@@@@@
		String[] arrPics = roomVo.getPics();
		for(int i=0; i<arrPics.length; i++) {
			System.out.println("arrPics " + i + ": " + arrPics[i]);
		}
		System.out.println(">>>> registerHost roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		roomService.registerRoom(roomVo);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/getAttach/{bno}", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getAttach(@PathVariable("room_num") int room_num) throws Exception {
		return roomService.getAttach(room_num);
	}
}
