package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.PointDto;

public interface BooPointListService {
	
	//포인트 사용 내역 보여주기
	public List<PointDto> getPointList(String user_email) throws Exception;
}