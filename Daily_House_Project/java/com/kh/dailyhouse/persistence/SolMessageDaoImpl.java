package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.MessageVo;

@Repository
public class SolMessageDaoImpl implements SolMessageDao {
	
	private static final String NAMESPACE = "com.kh.mappers.MessageMapper";
	
	@Inject
	public SqlSession sqlSession;

	@Override
	public int getReceiveMessageCount(String user_email) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + ".getReceiveMessageCount", user_email);
		return count;
	}

	@Override
	public List<MessageVo> getMessageList(String user_email) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getMessageList", user_email);
	}

	@Override
	public void openDateUpdate(int message_num) throws Exception {
		sqlSession.update(NAMESPACE + ".openDateUpdate", message_num);
		
	}

	@Override
	public void sendReply(MessageVo messageVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".sendReply", messageVo);
		
	}

	@Override
	public List<MessageVo> getSendMessageList(String user_email) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".getSendMessageList", user_email);
	}
}
