package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.RoomVo;

public interface SolRoomDao {

	public List<RoomVo> getRoomList() throws Exception;
}
