package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;

public interface BooRoomDetailDao {
	//roomDetail 정보 얻기
	public RoomDto getRoominfo(int room_num) throws Exception;
	
	//roomDetail review 목록 정보 얻기
	public List<RoomReviewVo> getReviewinfo(int room_num) throws Exception;
	
	//후기 작성
	public void setReview(RoomReviewVo roomReviewVo) throws Exception;
	
}
