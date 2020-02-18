package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomReviewVo;

public interface BooRoomDetailDao {
	//roomDetail 정보 얻기
	public RoomDto getRoominfo(int room_num) throws Exception;
	
	//후기 목록에 사용할 총개수
	public int getReviewCount(int room_num) throws Exception;
	
	//roomDetail review 목록 정보 얻기
	public List<RoomReviewVo> getReviewinfo(int room_num, ReviewPagingDto reviewPagingDto) throws Exception;
		
	//후기 작성
	public void setReview(RoomReviewVo roomReviewVo) throws Exception;
	
	//방 평점 수정
	public void setRoomScore(int room_num, int room_score) throws Exception;
	
	//room type 코드판별
	public String getRoomType(RoomDto roomDto) throws Exception;
	
	//room option 코드판별
	public String getRoomOption(String room_option_code) throws Exception;
}
