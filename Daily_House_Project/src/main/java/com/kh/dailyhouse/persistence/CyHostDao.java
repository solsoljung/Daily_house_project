package com.kh.dailyhouse.persistence;

import com.kh.dailyhouse.domain.HostVo;

public interface CyHostDao {
	// 호스트 등록하기
	public void registerHost(HostVo hostVo) throws Exception;
	
	// 방금 등록한 숙소 시퀸스 값 얻어내기
	public int getNowRoomNum() throws Exception;
	
}
