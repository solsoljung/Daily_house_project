package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomDto;
import com.kh.dailyhouse.domain.RoomPictureVo;
import com.kh.dailyhouse.domain.RoomReviewDto;
import com.kh.dailyhouse.domain.RoomReviewVo;

public interface BooRoomDetailDao {
	//roomDetail 정보 얻기
	public RoomDto getRoominfo(int room_num) throws Exception;
	
	//후기 목록에 사용할 총개수
	public int getReviewCount(int room_num) throws Exception;
	
	//roomDetail review 목록 정보 얻기
	public List<RoomReviewDto> getReviewinfo(int room_num, ReviewPagingDto reviewPagingDto) throws Exception;
		
	//후기 작성
	public void setReview(RoomReviewVo roomReviewVo) throws Exception;
	
	//방 평점 수정
	public void setRoomScore(int room_num, int room_score) throws Exception;
	
	//room type 코드판별
	public String getRoomType(RoomDto roomDto) throws Exception;
	
	//room option 코드판별
	public String getRoomOption(String room_option_code) throws Exception;
	
	//room_pic 정보 얻기
	public List<RoomPictureVo> getRoomPicInfo(int room_num) throws Exception;
	
	//1구역 사진 정보 얻기
	public RoomPictureVo getOneAreaPic(int room_num) throws Exception;
	
	//2구역 사진 정보 얻기
	public List<RoomPictureVo> getTwoAreaPic(int room_num) throws Exception;
	
	//3구역 사진 정보 얻기
	public List<RoomPictureVo> getThreeAreapic(int room_num) throws Exception;
	
	//포인트 이용 내역 테이블에 추가
	public void setPointList(RoomReviewVo roomReviewVo) throws Exception;
	
	//리뷰 작성후 유저에게 포인트 주기
	public void setUserPoint(RoomReviewVo roomReviewVo) throws Exception;
}
