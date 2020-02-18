package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.RoomTypeVo;

public interface CyRoomTypeService {
	// RoomTypeVo 조회하기
	public List<RoomTypeVo> getRoomTypeList() throws Exception;
}
