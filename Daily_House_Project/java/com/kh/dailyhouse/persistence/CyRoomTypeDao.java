package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.RoomTypeVo;

public interface CyRoomTypeDao {
	// RoomTypeVo 조회하기
	public List<RoomTypeVo> getRoomTypeList() throws Exception;
}
