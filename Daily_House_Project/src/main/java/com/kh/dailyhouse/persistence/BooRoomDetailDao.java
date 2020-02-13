package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;

public interface BooRoomDetailDao {
	//roomDetail 정보 얻기
	public RoomDto getRoominfo(int room_num) throws Exception;
	
	//roomDetail review 정보 얻기
	public List<RoomReviewVo> getReviewinfo(int room_num) throws Exception;
	
	//roomReviewScore 한개 정보 구하기 (총 점수 계산 할거임)
	public RoomReviewVo getReviewScore(int room_num) throws Exception;
}
