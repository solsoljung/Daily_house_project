package com.kh.dailyhouse.persistence;

import com.kh.dailyhouse.domain.RoomDto;

public interface BooRoomDetailDao {
	//roomDetail 정보 얻기
	public RoomDto getRoominfo(int room_num) throws Exception;
}
