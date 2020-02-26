package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.PointDto;
import com.kh.dailyhouse.domain.ReviewPagingDto;

public interface BooPointListDao {
	//포인트 사용 내역 리스트 받기
	public List<PointDto> getPointList(String user_email, ReviewPagingDto reviewPagingDto) throws Exception;
	
	//포인트 사용 내역 리스트 총갯수 구하기
	public int getPointListTotalCount(String user_email) throws Exception;
}
