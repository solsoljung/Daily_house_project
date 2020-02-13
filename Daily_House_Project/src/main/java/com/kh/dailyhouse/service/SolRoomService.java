package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.PagingDto;
import com.kh.dailyhouse.domain.RoomVo;

public interface SolRoomService {
	

	public List<RoomVo> getRoomList(PagingDto pagingDto) throws Exception;
	public int getRoomCount() throws Exception;
}
