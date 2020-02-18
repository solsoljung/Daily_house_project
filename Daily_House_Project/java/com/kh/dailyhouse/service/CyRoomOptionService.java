package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.RoomOptionVo;

public interface CyRoomOptionService {
	// RoomOptionVo 조회하기
	public List<RoomOptionVo> getRoomOptionList() throws Exception;
}
