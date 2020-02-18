package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.RoomTypeVo;
import com.kh.dailyhouse.persistence.CyRoomTypeDao;

@Service
public class CyRoomTypeServiceImpl implements CyRoomTypeService {

	@Inject
	private CyRoomTypeDao roomTypeDao;
	
	@Override
	public List<RoomTypeVo> getRoomTypeList() throws Exception {
		return roomTypeDao.getRoomTypeList();
	}

}
