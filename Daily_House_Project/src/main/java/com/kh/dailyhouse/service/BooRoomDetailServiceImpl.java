package com.kh.dailyhouse.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.persistence.BooRoomDetailDao;

@Service
public class BooRoomDetailServiceImpl implements BooRoomDetailService {
	
	@Inject
	private BooRoomDetailDao booRoomDetailDao;
	
	@Override
	public RoomDto detail(int room_num) throws Exception {
		RoomDto dto = booRoomDetailDao.getRoominfo(room_num);
		return dto;
	}

}
