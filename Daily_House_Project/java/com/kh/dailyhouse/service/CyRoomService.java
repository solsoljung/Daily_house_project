package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.CyPagingDto;
import com.kh.dailyhouse.domain.HostVo;
import com.kh.dailyhouse.domain.RoomDetailDto;
import com.kh.dailyhouse.domain.RoomVo;

public interface CyRoomService {
	
	// 관리자용 숙소 room_admin_check가 N인 값 리스트 가져오기
	public List<RoomDetailDto> getRoomAdminCheckNList() throws Exception;
		
	// 관리자용 숙소 room_admin_check가 Y인 값 리스트 가져오기
	public List<RoomDetailDto> getRoomAdminCheckYList(CyPagingDto cyPagingDto) throws Exception;
	
	// Y 페이징용 전체 갯수
	public int getRoomAdminCheckYCount() throws Exception;
		
	// 관리자용 숙소 room_admin_check값을 Y로 업데이트
	public void updateRoomAdminCheckY(int room_num) throws Exception;
		
	// 관리자용 숙소 room_admin_check값을 N으로 업데이트
	public void updateRoomAdminCheckN(int room_num) throws Exception;
	
	// 관리자용 숙소 값 Y, N으로 업데이트
	public void updateRoomAdminCheckChange(RoomDetailDto roomDetailDto) throws Exception;
	
	
	// 호스트 정보 검색
	public HostVo getHostInfo(String user_email) throws Exception;
	
	// 호스트 인지 아닌지 검색
	public int isHost(String user_email) throws Exception;
	
	
	// 숙소 검색하기
	public List<RoomDetailDto> getHostRoomList(String user_email) throws Exception;
	
	// 숙소 1개 검색
	public RoomDetailDto getHostRoomDetail(int room_num) throws Exception;
	
	// 숙소 등록하기
	public void registerRoom(RoomVo roomVo) throws Exception;
	
	// 숙소 정보 수정하기
	public void updateHostRoom(RoomVo roomVo) throws Exception;
	
	// 숙소 삭제하기
	public void deleteHostRoom(String user_email, int room_num) throws Exception;
	
	
	// 숙소 예약이 있는지 없는지 알아내기
	public int isReserved(int room_num) throws Exception;
	
	
	// 첨부파일명 목록
	public List<String> getAttach(int room_num) throws Exception;
		
	// 첨부파일 데이터 삭제
	public void deleteAttach(String pic_uri) throws Exception;
}
