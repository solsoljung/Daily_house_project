package com.kh.dailyhouse.service;

import com.kh.dailyhouse.domain.RoomDto;

public interface BooRoomDetailService {
	//Room 상세 보기
	public RoomDto detail(int room_num) throws Exception;
}
