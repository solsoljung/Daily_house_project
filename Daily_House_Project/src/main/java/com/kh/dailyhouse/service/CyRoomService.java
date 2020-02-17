package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.HostVo;
import com.kh.dailyhouse.domain.RoomDetailDto;
import com.kh.dailyhouse.domain.RoomVo;

public interface CyRoomService {
	// 호스트 정보 검색
	public HostVo getHostInfo(String user_email) throws Exception;
	
	
	
	// 숙소 검색하기
	public List<RoomDetailDto> getHostRoomList(String user_email) throws Exception;
	
	// 숙소 1개 검색
	public RoomDetailDto getHostRoomDetail(int room_num) throws Exception;
	
	// 숙소 등록하기
	public void registerRoom(RoomVo roomVo) throws Exception;
}
