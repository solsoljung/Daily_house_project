package com.kh.dailyhouse.service;

import java.util.Map;

import com.kh.dailyhouse.domain.MessageDto;
import com.kh.dailyhouse.domain.ReviewPagingDto;
import com.kh.dailyhouse.domain.RoomReviewVo;
import com.kh.dailyhouse.domain.UserVo;

public interface BooRoomDetailService {
	//Room 상세 보기
	public Map<String, Object> detail(int room_num, ReviewPagingDto reviewPagingDto) throws Exception;
	
	//후기 작성 insert
	public void insertReview(RoomReviewVo roomReviewVo) throws Exception;
	
	//쪽지 받는 사람 정보
	public UserVo getReceiverInfo(String user_email) throws Exception;
	
	//쪽지 보내기 
	public void sendMessagePro(MessageDto messageDto) throws Exception;
}