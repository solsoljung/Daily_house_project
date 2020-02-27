package com.kh.dailyhouse.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.dailyhouse.domain.BoardVo;
import com.kh.dailyhouse.domain.CyPagingDto;
import com.kh.dailyhouse.domain.HostVo;
import com.kh.dailyhouse.domain.RoomDetailDto;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.UserVo;
import com.kh.dailyhouse.persistence.CyBoardDao;
import com.kh.dailyhouse.service.CyBoardService;
import com.kh.dailyhouse.service.CyRoomOptionService;
import com.kh.dailyhouse.service.CyRoomService;
import com.kh.dailyhouse.service.CyRoomTypeService;
import com.kh.dailyhouse.util.FileUploadUtil;

@Controller
@RequestMapping("/cy/*")
public class CyController {

	@Resource
	private String uploadPath; // servlet-context.xml (id="uploadPath")
	
	@Inject
	private CyRoomTypeService roomTypeService;
	@Inject
	private CyRoomOptionService roomOptionService;
	@Inject
	private CyRoomService roomService;
	@Inject
	private CyBoardService boardService;
	
	private final String ADMIN_EMAIL = "admin@naver.com"; 
	
	public String isHostCheck(HttpSession session, RedirectAttributes rttr) {
		// 세션이 비어있을 경우 notHost메세지를 저장 후 로그인 페이지로 리다이렉트
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		if(userVo == null) {
			rttr.addFlashAttribute("msg", "notHost");
			return null;
		}
		return userVo.getUser_email();
	}
	
	public String isLoginCheck(HttpSession session, RedirectAttributes rttr) {
		// 세션이 비어있을 경우 notLogin메세지를 저장 후 로그인 페이지로 리다이렉트
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		if(userVo == null) {
			rttr.addFlashAttribute("msg", "notLogin");
			return null;
		}
		return userVo.getUser_email();
	}
	
	// help 목록보기
	@RequestMapping(value = "/help", method = {RequestMethod.GET, RequestMethod.POST})
	public String help(HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo", userVo);
		
		List<BoardVo> list = boardService.getBoardList();
		model.addAttribute("list", list);
		
		return "/help/help_list";
	}
	
	// help 글 상세보기
	@RequestMapping(value = "/helpDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String helpDetail(HttpSession session, Model model, RedirectAttributes rttr,  @RequestParam("board_num") int board_num) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		model.addAttribute("userVo", userVo);
		
		BoardVo boardVo = boardService.getBoardDetail(board_num);
		model.addAttribute("boardVo", boardVo);
		
		return "/help/help_detail";
	}
	
	// help 글 수정하기 pro
	@RequestMapping(value = "/helpUpdatePro", method = RequestMethod.POST)
	public String helpUpdatePro(HttpSession session, Model model, RedirectAttributes rttr, BoardVo boardVo) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		// 로그인 안 했을 경우 return
		if(userVo == null) {	
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// admin이 아닐 경우 return
		if(!userVo.getUser_email().equals(ADMIN_EMAIL)) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		
		boardVo.setUser_email(ADMIN_EMAIL);
		
		System.out.println("update pro: " + boardVo);
		boardService.updateBoard(boardVo);
		
		return "redirect:/cy/helpDetail?board_num=" + boardVo.getBoard_num();
	}
	
	// help 글 삭제하기
	@RequestMapping(value = "/helpDelete", method = RequestMethod.GET)
	public String helpDelete(HttpSession session, Model model, RedirectAttributes rttr,  @RequestParam("board_num") int board_num) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		// 로그인 안 했을 경우 return
		if(userVo == null) {	
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// admin이 아닐 경우 return
		if(!userVo.getUser_email().equals(ADMIN_EMAIL)) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		model.addAttribute("userVo", userVo);
		
		boardService.deleteBoard(board_num);
		
		return "redirect:/cy/help";
	}
	
	// help 글 작성 폼
	@RequestMapping(value = "/helpWrite", method = RequestMethod.GET)
	public String helpWrite(HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		// 로그인 안 했을 경우 return
		if(userVo == null) {	
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// admin이 아닐 경우 return
		if(!userVo.getUser_email().equals(ADMIN_EMAIL)) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		return "/help/help_write";
	}
	
	// help 글 작성 pro
	@RequestMapping(value = "/helpWritePro", method = RequestMethod.POST)
	public String helpWritePro(HttpSession session, Model model, RedirectAttributes rttr, BoardVo boardVo) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		// 로그인 안 했을 경우 return
		if(userVo == null) {	
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// admin이 아닐 경우 return
		if(!userVo.getUser_email().equals(ADMIN_EMAIL)) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		
		boardVo.setUser_email(ADMIN_EMAIL);
		boardService.insertBoard(boardVo);
		
		return "redirect:/cy/help";
	}
	
	// 관리자 room_admin_check가 N인 방들 보기
	@RequestMapping(value = "/AdminRoomListN", method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminRoomListN(HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		// 로그인 안 했을 경우 return
		if(userVo == null) {	
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// admin이 아닐 경우 return
		if(!userVo.getUser_email().equals(ADMIN_EMAIL)) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// 관리자 check N인 숙소 리스트 
		List<RoomDetailDto> list = roomService.getRoomAdminCheckNList();
		model.addAttribute("list", list);
		
		return "/admin/admin_check_n";
	}
	
	// 관리자 room_admin_check가 Y인 방들 보기
	@RequestMapping(value = "/AdminRoomListY", method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminRoomListY(HttpSession session, Model model, RedirectAttributes rttr, CyPagingDto cyPagingDto) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		// 로그인 안 했을 경우 return
		if(userVo == null) {	
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// admin이 아닐 경우 return
		if(!userVo.getUser_email().equals(ADMIN_EMAIL)) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		
		// 페이징
		if(1<= cyPagingDto.getPage() && cyPagingDto.getPage() <= 10) {
			cyPagingDto.setHasPrev(false);
		}
		int totalCount = roomService.getRoomAdminCheckYCount();
		cyPagingDto.setTotalCount(totalCount);
		
		// 관리자 check Y인 숙소 리스트 
		List<RoomDetailDto> list = roomService.getRoomAdminCheckYList(cyPagingDto);
		
//		System.out.println("cyPagingDto: " + cyPagingDto);
		
		model.addAttribute("list", list);
		model.addAttribute("cyPagingDto", cyPagingDto);
		
		return "/admin/admin_check_y";
	}
	
	// room_num에 해당하는 room_admin_check를 Y로 변경하기
	@RequestMapping(value = "/updateRoomAdminCheckY/{room_num}", method = RequestMethod.DELETE)
	@ResponseBody
	public String updateRoomAdminCheckY(@PathVariable("room_num") int room_num) throws Exception {
		roomService.updateRoomAdminCheckY(room_num);
		return "success";
	}
	
	// room_num에 해당하는 room_admin_check를 N으로 변경하기
	@RequestMapping(value = "/updateRoomAdminCheckN/{room_num}", method = RequestMethod.DELETE)
	@ResponseBody
	public String updateRoomAdminCheckN(@PathVariable("room_num") int room_num) throws Exception {
		roomService.updateRoomAdminCheckN(room_num);
		return "success";
	}
	
	// 관리자용 호스트가 등록한 방 1개 상세보기에서 room_admin_check 수정
	@RequestMapping(value = "/AdminRoomDetailUpdate",  method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminRoomDetailUpdate(HttpSession session, Model model, RoomDetailDto roomDetailDto
			 					,RedirectAttributes rttr) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		// 로그인 안 했을 경우 return
		if(userVo == null) {	
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// admin이 아닐 경우 return
		if(!userVo.getUser_email().equals(ADMIN_EMAIL)) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		roomService.updateRoomAdminCheckChange(roomDetailDto);
		
		return "redirect:/cy/AdminRoomDetail?room_num=" + roomDetailDto.getRoom_num();
	}
	
	
	// 관리자용 호스트가 등록한 방 1개 상세보기
	@RequestMapping(value = "/AdminRoomDetail",  method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminRoomDetail(HttpSession session, Model model, @RequestParam("room_num") int room_num
			 					,RedirectAttributes rttr,  CyPagingDto cyPagingDto) throws Exception{
		UserVo userVo = (UserVo)session.getAttribute("userVo");
		// 로그인 안 했을 경우 return
		if(userVo == null) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		// admin이 아닐 경우 return
		if(!userVo.getUser_email().equals(ADMIN_EMAIL)) {
			rttr.addFlashAttribute("msg", "notAdmin");
			return "redirect:/si/loginHost";
		}
		RoomDetailDto roomDetailDto = roomService.getHostRoomDetail(room_num);
		
		model.addAttribute("cyPagingDto", cyPagingDto);
		model.addAttribute("roomDetailDto", roomDetailDto);
		model.addAttribute("roomTypeList", roomTypeService.getRoomTypeList());
		model.addAttribute("roomOptionList", roomOptionService.getRoomOptionList());
		return "/admin/admin_room_detail";
	}
	
	
	// 호스트의 방 리스트 보기
	@RequestMapping(value = "/HostRoomList", method = {RequestMethod.GET, RequestMethod.POST})
	public String HostRoomList(HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
		String checkResult = isHostCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// 유저정보에서 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		HostVo hostVo = roomService.getHostInfo(host_eamil);
		model.addAttribute("hostVo", hostVo);
		
		// 호스트 정보로 방 리스트 조회 후 저장
		List<RoomDetailDto> list = roomService.getHostRoomList(host_eamil);
		model.addAttribute("list", list);
		
		return "/host/host_room_list";
	}
	
	// 호스트가 등록한 방 1개 상세보기
	@RequestMapping(value = "/HostRoomDetail",  method = {RequestMethod.GET, RequestMethod.POST})
	public String HostRoomDetail(HttpSession session, Model model, @RequestParam("room_num") int room_num
			 					,RedirectAttributes rttr) throws Exception{
		String checkResult = isHostCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		RoomDetailDto roomDetailDto = roomService.getHostRoomDetail(room_num);
		model.addAttribute("roomDetailDto", roomDetailDto);
		model.addAttribute("roomTypeList", roomTypeService.getRoomTypeList());
		model.addAttribute("roomOptionList", roomOptionService.getRoomOptionList());
		return "/host/host_room_detail";
	}
	
	// 호스트 방 정보 수정하기
	@RequestMapping(value = "/HostModifyRoom", method = RequestMethod.POST)
	public String HostModifyRoom(HttpSession session, Model model, RoomVo roomVo ,RedirectAttributes rttr) throws Exception{
		String checkResult = isHostCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		System.out.println("HostModifyRoom roomVo: " + roomVo);
		roomService.updateHostRoom(roomVo);
		return "redirect:/cy/HostRoomDetail?room_num=" + roomVo.getRoom_num();
	}
	
	// 호스트 등록하기 1page readonly
	@RequestMapping(value = "/registerHost1", method = RequestMethod.GET)
	public String registerHost1(HttpSession session, RoomVo roomVo, RedirectAttributes rttr) throws Exception{
		String checkResult = isLoginCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// checkResult가 null이 아닐경우 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		roomVo.setUser_email(host_eamil); 
		
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 1page
	@RequestMapping(value = "/registerHost1Post", method = RequestMethod.POST)
	public String registerHost1Post(HttpSession session, Model model, RoomVo roomVo, RedirectAttributes rttr) throws Exception{
		String checkResult = isLoginCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// checkResult가 null이 아닐경우 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		roomVo.setUser_email(host_eamil);
		
		System.out.println(">>>> controller111 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page1";
	}
	
	// 호스트 등록하기 2page
	@RequestMapping(value = "/registerHost2Post", method = RequestMethod.POST)
	public String registerHost2(HttpSession session, Model model, RoomVo roomVo, RedirectAttributes rttr) throws Exception{
		String checkResult = isLoginCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// checkResult가 null이 아닐경우 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		roomVo.setUser_email(host_eamil);
		
		System.out.println(">>>> controller222 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		return "/host/host_register_page2";
	}
	
	// 호스트 등록하기 3page
	@RequestMapping(value = "/registerHost3Post", method = RequestMethod.POST)
	public String registerHost3(HttpSession session, Model model, RoomVo roomVo, RedirectAttributes rttr) throws Exception{
		String checkResult = isLoginCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// checkResult가 null이 아닐경우 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		roomVo.setUser_email(host_eamil);
				
		System.out.println(">>>> controller333 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		model.addAttribute("roomTypeList", roomTypeService.getRoomTypeList());
		return "/host/host_register_page3";
	}
	
	// 호스트 등록하기 4page
	@RequestMapping(value = "/registerHost4Post", method = RequestMethod.POST)
	public String registerHost4(HttpSession session, Model model, RoomVo roomVo, RedirectAttributes rttr) throws Exception{
		String checkResult = isLoginCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// checkResult가 null이 아닐경우 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		roomVo.setUser_email(host_eamil);
				
		System.out.println(">>>> controller444 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		model.addAttribute("roomOptionList", roomOptionService.getRoomOptionList());
		return "/host/host_register_page4";
	}
	
	// 호스트 등록하기 5page
	@RequestMapping(value = "/registerHost5Post", method = RequestMethod.POST)
	public String registerHost5(HttpSession session, Model model, RoomVo roomVo, RedirectAttributes rttr) throws Exception{
		String checkResult = isLoginCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// checkResult가 null이 아닐경우 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		roomVo.setUser_email(host_eamil);
				
		System.out.println(">>>> controller555 roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		model.addAttribute("roomOptionList", roomOptionService.getRoomOptionList());
		return "/host/host_register_page5";
	}
	
	// 호스트 등록하기 최종
	@RequestMapping(value = "/registerHost", method = RequestMethod.POST)
	public String registerHost(HttpSession session, Model model, RoomVo roomVo, RedirectAttributes rttr) throws Exception{
		String checkResult = isLoginCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// checkResult가 null이 아닐경우 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		roomVo.setUser_email(host_eamil);
				
//		if(roomVo.getPics()!=null) {
//			String[] arrPics = roomVo.getPics();
//			for(int i=0; i<arrPics.length; i++) {
//				System.out.println("arrPics " + i + ": " + arrPics[i]);
//			}
//			roomVo.setPics(arrPics);
//		}
		System.out.println(">>>> registerHost roomVo: " + roomVo);
		model.addAttribute("roomVo", roomVo);
		roomService.registerRoom(roomVo);
		return "redirect:/";
	}
	
	// room_num에 해당하는 사진파일 정보 가져오기
	@RequestMapping(value = "/getAttach/{room_num}", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getAttach(@PathVariable("room_num") int room_num) throws Exception {
		return roomService.getAttach(room_num);
	}
	
	// 호스트인지아닌지알아내기
	@RequestMapping(value="/isHost", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int isHost(String user_email) throws Exception {
//		System.out.println("user_email:" + user_email);
		int result = roomService.isHost(user_email);
		return result;
	}
	
	// 예약이 있는지 없는지 알아내기
	@RequestMapping(value="/isReserved/{room_num}", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int isReserved(@PathVariable("room_num") int room_num) throws Exception {
		System.out.println("room_num:" + room_num);
		int result = roomService.isReserved(room_num); 
		return result;
	}
	
	// 호스트 숙소 삭제하기(room_num으로 사진, 호스트 정보, 방 정보 삭제)
	@RequestMapping(value = "/deleteRoom", method = RequestMethod.GET)
	public String delete(@RequestParam("room_num") int room_num, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		System.out.println("deleteRoom room_num: " + room_num);
		
		String checkResult = isHostCheck(session, rttr);
		if(checkResult == null) {
			return "redirect:/si/loginHost";
		}
		// 유저정보에서 호스트 메일을 얻어낸 후 호스트 정보를 저장
		String host_eamil = checkResult;
		
		// 파일 삭제
		List<String> fileNameList = roomService.getAttach(room_num);
		FileUploadUtil.delete(fileNameList, uploadPath);
		roomService.deleteHostRoom(host_eamil, room_num);
		rttr.addFlashAttribute("msg", "room_delete_success");
		return "redirect:/cy/HostRoomList";
	}
}
