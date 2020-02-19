package com.kh.dailyhouse.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.persistence.BooDatepickerDao;

@Service
public class BooDatepickerServiceImpl implements BooDatepickerService {
	
	@Inject
	private BooDatepickerDao booDatepickerDao;
	
	@Override
	public String getEndDate(int room_num, String date) throws Exception {
		String endDate = booDatepickerDao.getEndDate(room_num, date);
		return endDate;
	}

}
