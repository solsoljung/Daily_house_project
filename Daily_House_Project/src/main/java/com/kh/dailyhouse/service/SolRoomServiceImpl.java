package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.PagingDto;
import com.kh.dailyhouse.domain.ReservationVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchVo;
import com.kh.dailyhouse.persistence.SolRoomDao;

@Service
public class SolRoomServiceImpl implements SolRoomService {
	
	@Inject
	private SolRoomDao dao;

	/*
	 * @Override public List<RoomVo> getRoomList(PagingDto pagingDto, ReservationVo
	 * reservVo) throws Exception {
	 * 
	 * return dao.getRoomList(pagingDto, reservVo); }
	 */
	
	@Override
	public List<RoomVo> getRoomList(SearchVo searchVo) throws Exception {
		
		return dao.getRoomList(searchVo);
	}

	@Override
	public int getRoomCount(SearchVo searchVo) throws Exception {
		
		return dao.getRoomCount(searchVo);
	}

}
