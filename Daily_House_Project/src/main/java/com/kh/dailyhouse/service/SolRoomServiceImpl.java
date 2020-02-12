package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.persistence.SolRoomDao;

@Service
public class SolRoomServiceImpl implements SolRoomService {
	
	@Inject
	private SolRoomDao dao;

	@Override
	public List<RoomVo> getRoomList() throws Exception {

		return dao.getRoomList();
	}

}
