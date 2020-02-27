package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.MessageVo;
import com.kh.dailyhouse.persistence.SolMessageDao;

@Service
public class SolMessageServiceImpl implements SolMessageService {
	
	@Inject
	private SolMessageDao messageDao;

	@Override
	public int getReceiveMessageCount(String user_email) throws Exception {
		int count = messageDao.getReceiveMessageCount(user_email);
		return count;
	}

	@Override
	public List<MessageVo> getMessageList(String user_email) throws Exception {
		
		return messageDao.getMessageList(user_email);
	}

	@Override
	public void openDateUpdate(int message_num) throws Exception {
		messageDao.openDateUpdate(message_num);
		
	}

}
