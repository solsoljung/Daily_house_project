package com.kh.dailyhouse.persistence;

import com.kh.dailyhouse.domain.RoomVo;

public interface CyRoomDao {
	// 숙소등록을 위한 다음 시퀸스 값 얻어내기
	public int getNextRoomNum() throws Exception;
	
	// 숙소 등록하기
	public void registerRoom(RoomVo roomVo) throws Exception;
	
	// 숙소 수정하기
	
	// 숙소 삭제하기
}
