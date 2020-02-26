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

	@Override
	public String getRoomStatus(int room_num) throws Exception {
		String status = booDatepickerDao.getRoomStatus(room_num);
		return status;
	}

	@Override
	public String getCount(int room_num, String user_email) throws Exception {
		int count = booDatepickerDao.getCount(room_num, user_email);
		if (count != 0) {
			return "N";
		}
		return "Y";
	}

	@Override
	public void insertLike(int room_num, String user_email) throws Exception {
		booDatepickerDao.insertLike(room_num, user_email);
	}

	@Override
	public void deleteLike(int room_num, String user_email) throws Exception {
		booDatepickerDao.deleteLike(room_num, user_email);
	}
	
}
