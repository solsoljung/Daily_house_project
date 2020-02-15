package com.kh.dailyhouse.service;

import java.util.Map;

import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomReviewVo;

public interface BooRoomDetailService {
	//Room 상세 보기
	public Map<String, Object> detail(int room_num, ReviewPagingDto reviewPagingDto) throws Exception;
	
	//후기 작성 insert
	public void insertReview(RoomReviewVo roomReviewVo) throws Exception;
	
	//후기 목록에 사용할 총 갯수
	public int reviewCount() throws Exception;
}
