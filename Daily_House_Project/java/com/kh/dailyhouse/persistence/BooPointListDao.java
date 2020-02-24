package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.PointDto;

public interface BooPointListDao {
	//포인트 사용 내역 리스트 받기
	public List<PointDto> getPointList() throws Exception;
}
