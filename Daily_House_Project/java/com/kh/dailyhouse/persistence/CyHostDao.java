package com.kh.dailyhouse.persistence;

import com.kh.dailyhouse.domain.HostVo;

public interface CyHostDao {
	// 호스트 정보 검색
	public HostVo getHostInfo(String user_email) throws Exception;
	
	// 호스트 등록하기
	public void registerHost(HostVo hostVo) throws Exception;
	
}
