package com.kh.dailyhouse.persistence;

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
}
