package com.kh.dailyhouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.persistence.BooRoomDetailDao;

@Service
public class BooRoomDetailServiceImpl implements BooRoomDetailService {
	
	@Inject
	private BooRoomDetailDao booRoomDetailDao;
	
	@Override
	public Map<String, Object> detail(int room_num) throws Exception {
		RoomDto dto = booRoomDetailDao.getRoominfo(room_num);
		List<RoomReviewVo> ReviewList = booRoomDetailDao.getReviewinfo(room_num);
		
		System.out.println("ReviewList : "+ReviewList);
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("dto", dto);
		paramMap.put("ReviewList", ReviewList);
		
		return paramMap;
	}

}
