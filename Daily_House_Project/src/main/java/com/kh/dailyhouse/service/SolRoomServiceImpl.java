package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.RoomLowHighPriceDto;
import com.kh.dailyhouse.domain.RoomOptionVo;
import com.kh.dailyhouse.domain.RoomTypeVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.domain.SearchVo;
import com.kh.dailyhouse.persistence.SolRoomDao;

@Service
public class SolRoomServiceImpl implements SolRoomService {
	
	@Inject
	private SolRoomDao dao;
	
	@Override
	public List<RoomVo> getRoomList(SearchVo searchVo) throws Exception {
		
		return dao.getRoomList(searchVo);
	}

	@Override
	public int getRoomCount(SearchVo searchVo) throws Exception {
		
		return dao.getRoomCount(searchVo);
	}

	@Override
	public List<RoomTypeVo> getRoomType() throws Exception {
		
		return dao.getRoomType();
	}

	@Override
	public List<RoomOptionVo> getRoomOption() throws Exception {
		
		return dao.getRoomOption();
	}

	@Override
	public RoomLowHighPriceDto getRoomPrice() throws Exception {
		
		return dao.getRoomPrice();
	}

}
