package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.MessageVo;
import com.kh.dailyhouse.persistence.SolMessageDao;
import com.sun.xml.internal.ws.encoding.xml.XMLMessage.MessageDataSource;

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

	@Override
	public void sendReply(MessageVo messageVo) throws Exception {
		messageDao.sendReply(messageVo);
		
	}

	@Override
	public List<MessageVo> getSendMessageList(String user_email) throws Exception {
		return messageDao.getSendMessageList(user_email);
	}

	@Override
	public MessageVo getMessageVo(int message_num) throws Exception {

		return messageDao.getMessageVo(message_num);
	}

}
