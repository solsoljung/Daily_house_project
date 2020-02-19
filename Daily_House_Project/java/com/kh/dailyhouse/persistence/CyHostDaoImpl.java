package com.kh.dailyhouse.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.HostVo;

@Repository
public class CyHostDaoImpl implements CyHostDao {

private static final String NAMESPACE = "com.kh.mappers.HostMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	// 호스트 등록
	@Override
	public void registerHost(HostVo hostVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".registerHost", hostVo);
	}
	
	// 호스트 정보 검색
	@Override
	public HostVo getHostInfo(String user_email) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getHostInfo", user_email);
	}

	// 호스트 삭제하기
	@Override
	public void deleteHost(String user_email, int room_num) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_email", user_email);
		paramMap.put("room_num", room_num);
		sqlSession.delete(NAMESPACE  + ".deleteHost", paramMap);
	}
}
