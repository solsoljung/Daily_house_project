package com.kh.dailyhouse.service;

import java.util.Map;

public interface BooRoomDetailService {
	//Room 상세 보기
	public Map<String, Object> detail(int room_num) throws Exception;
}
