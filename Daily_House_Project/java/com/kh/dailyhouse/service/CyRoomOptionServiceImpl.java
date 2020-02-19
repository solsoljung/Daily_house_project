package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.RoomOptionVo;
import com.kh.dailyhouse.persistence.CyRoomOptionDao;

@Service
public class CyRoomOptionServiceImpl implements CyRoomOptionService {

	@Inject
	private CyRoomOptionDao roomOptionDao;

	@Override
	public List<RoomOptionVo> getRoomOptionList() throws Exception {
		return roomOptionDao.getRoomOptionList();
	}

}
