package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dailyhouse.domain.HostVo;
import com.kh.dailyhouse.domain.RoomDetailDto;
import com.kh.dailyhouse.domain.RoomVo;
import com.kh.dailyhouse.persistence.CyHostDao;
import com.kh.dailyhouse.persistence.CyRoomDao;

@Service
public class CyRoomServiceImpl implements CyRoomService {

	@Inject
	private CyRoomDao roomDao;
	
	@Inject
	private CyHostDao hostDao;
	
	// 호스트 정보 가져오기
	@Override
	public HostVo getHostInfo(String user_email) throws Exception {
		return hostDao.getHostInfo(user_email);
	}
	
	
	// 호스트가 등록한 숙소 리스트 불러오기
	@Override
	public List<RoomDetailDto> getHostRoomList(String user_email) throws Exception {
		return roomDao.getHostRoomList(user_email);
	}
	
	// 호스트 숙소 1개 상세보기
	@Override
	public RoomDetailDto getHostRoomDetail(int room_num) throws Exception {
		return roomDao.getHostRoomDetail(room_num);
	}
	
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
