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
	// 사진파일 업로드
	@Transactional
	@Override
	public void registerRoom(RoomVo roomVo) throws Exception {
		int room_num = roomDao.getNextRoomNum();
		roomVo.setRoom_num(room_num);
		roomDao.registerRoom(roomVo);
		// 사진파일 업로드
		String[] pics = roomVo.getPics();
		if(pics != null && pics.length != 0) {
			for(String pic_uri : pics) {
				roomDao.attach(pic_uri, room_num);
			}
		}
		
		// 호스트 등록
		HostVo hostVo = new HostVo();
		hostVo.setUser_email(roomVo.getUser_email());
		hostVo.setRoom_num(room_num);
		hostDao.registerHost(hostVo);
	}

	// 숙소 정보 수정하기
	@Override
	public void updateHostRoom(RoomVo roomVo) throws Exception {
		roomDao.updateHostRoom(roomVo);
	}


	// 첨부파일명 목록
	@Override
	public List<String> getAttach(int room_num) throws Exception {
		return roomDao.getAttach(room_num);
	}

	// 첨부파일 데이터 삭제
	@Override
	public void deleteAttach(String pic_uri) throws Exception {
		roomDao.deleteAttach(pic_uri);
	}



	

}