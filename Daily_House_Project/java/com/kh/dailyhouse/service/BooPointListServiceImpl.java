package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.PointDto;
import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.persistence.BooPointListDao;

@Service
public class BooPointListServiceImpl implements BooPointListService {
	
	@Inject
	private BooPointListDao booPointListDao;
	
	@Override
	public List<PointDto> getPointList(String user_email, ReviewPagingDto reviewPagingDto) throws Exception {
		//포인트 사용 내역 총 갯수 구하기
		int totalCount = booPointListDao.getPointListTotalCount(user_email);
		reviewPagingDto.setTotalCount(totalCount);
		
		//포인트 사용 내역 리스트
		List<PointDto> pointList = booPointListDao.getPointList(user_email, reviewPagingDto);
		return pointList;
	}

}
