package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.RoomOptionVo;

public interface CyRoomOptionDao {
	// RoomOptionVo 조회하기
	public List<RoomOptionVo> getRoomOptionList() throws Exception;
}
