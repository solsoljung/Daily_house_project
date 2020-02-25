package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.PointDto;
import com.kh.dailyhouse.persistence.BooPointListDao;

@Service
public class BooPointListServiceImpl implements BooPointListService {
	
	@Inject
	private BooPointListDao booPointListDao;
	
	@Override
	public List<PointDto> getPointList() throws Exception {
		List<PointDto> pointList = booPointListDao.getPointList();
		return pointList;
	}

}
