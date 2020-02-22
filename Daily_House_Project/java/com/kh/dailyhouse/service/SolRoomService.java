package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.PagingDto;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.RoomLowHighPriceDto;
import com.kh.dailyhouse.domain.RoomOptionVo;
import com.kh.dailyhouse.domain.RoomTypeVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchKeywordDto;
import com.kh.dailyhouse.domain.SearchVo;

public interface SolRoomService {
	

	//룸 리스트
	public List<RoomVo> getRoomList(SearchVo searchVo) throws Exception;
	//룸 카운트
	public int getRoomCount(SearchVo searchVo) throws Exception;
	//방 유형
	public List<RoomTypeVo> getRoomType() throws Exception;
	//룸 옵션
	public List<RoomOptionVo> getRoomOption() throws Exception;
	//룸 최저, 최고가
	public RoomLowHighPriceDto getRoomPrice() throws Exception;
	//검색 목록
	public List<SearchKeywordDto> getKeywordList(SearchKeywordDto dto) throws Exception;
}
