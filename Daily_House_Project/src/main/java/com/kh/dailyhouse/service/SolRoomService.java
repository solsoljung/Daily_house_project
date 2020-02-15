package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.PagingDto;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchVo;

public interface SolRoomService {
	

	//public List<RoomVo> getRoomList(PagingDto pagingDto, ReservationVo reservVo) throws Exception;
	public List<RoomVo> getRoomList(SearchVo vo) throws Exception;
	public int getRoomCount(PagingDto pagingDto) throws Exception;
}
