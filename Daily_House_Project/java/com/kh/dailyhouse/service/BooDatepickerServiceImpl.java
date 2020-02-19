package com.kh.dailyhouse.service;

import java.util.ArrayList;
import java.util.List;

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

	@Override
	public List<String> getCheckInIndex(int room_num) throws Exception {
		List<Integer> reservNumList = booDatepickerDao.getReservNumList(room_num);
		
		List<String> CheckInList = new ArrayList<>();
		for (int i = 0; i < reservNumList.size(); i++ ) {
			int reserv_num	 = reservNumList.get(i);
			int indexNum = booDatepickerDao.getReservIndexNum(reserv_num);
			for (int j = 0; j < indexNum; j++) {
				String CheckInIndex = booDatepickerDao.getCheckInIndex(j, reserv_num);
				CheckInList.add(CheckInIndex);
			}
		}
		return CheckInList;
	}
	
}
