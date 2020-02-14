package com.kh.dailyhouse.persistence;

import com.kh.dailyhouse.domain.HostVo;

public interface CyHostDao {
	// 호스트 등록하기
	public void registerHost(HostVo hostVo) throws Exception;
	
}
