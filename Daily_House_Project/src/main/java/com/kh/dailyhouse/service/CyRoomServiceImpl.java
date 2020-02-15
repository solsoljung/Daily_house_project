package com.kh.dailyhouse.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dailyhouse.domain.HostVo;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.persistence.CyHostDao;
import com.kh.dailyhouse.persistence.CyRoomDao;

@Service
public class CyRoomServiceImpl implements CyRoomService {

	@Inject
	private CyRoomDao roomDao;
	
	@Inject
	private CyHostDao hostDao;
	
	// 숙소 등록하기
	// 호스트 등록하기
	@Transactional
	@Override
	public void registerRoom(RoomVo roomVo) throws Exception {
		int room_num = roomDao.getNextRoomNum();
		roomVo.setRoom_num(room_num);
		roomDao.registerRoom(roomVo);
		
		HostVo hostVo = new HostVo();
		hostVo.setUser_email(roomVo.getUser_email());
		hostVo.setRoom_num(room_num);
		hostDao.registerHost(hostVo);
	}

}
