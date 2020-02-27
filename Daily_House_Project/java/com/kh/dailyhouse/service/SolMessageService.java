package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.MessageVo;

public interface SolMessageService {

	//홈화면에서 확인하지 않은 메세지 갯수
	public int getReceiveMessageCount(String user_email) throws Exception;
	//내 메세지 전체 얻어오기
	public List<MessageVo> getMessageList(String user_email) throws Exception;
	//오픈날 업데이트
	public void openDateUpdate(int message_num) throws Exception;
}
