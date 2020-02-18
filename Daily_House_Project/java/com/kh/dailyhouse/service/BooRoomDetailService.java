package com.kh.dailyhouse.service;

import java.util.Map;

import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomReviewVo;

public interface BooRoomDetailService {
	//Room 상세 보기
	public Map<String, Object> detail(int room_num, ReviewPagingDto reviewPagingDto) throws Exception;
	
	//후기 작성 insert
	public void insertReview(RoomReviewVo roomReviewVo) throws Exception;
	
	//room_num에 해당하는 reservation정보 얻기
	public Map<String, Object> roomReservation(int room_num) throws Exception;
}