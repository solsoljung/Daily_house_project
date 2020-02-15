package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.PagingDto;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchVo;

public interface SolRoomDao {

	//룸 리스트
	//public List<RoomVo> getRoomList(PagingDto pagingDto, ReservationVo reservVo) throws Exception;
	public List<RoomVo> getRoomList(SearchVo vo) throws Exception;
	//룸 개수
	public int getRoomCount(PagingDto pagingDto) throws Exception;
}
