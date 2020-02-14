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
	
	// 방금 등록한 숙소 시퀸스 값 얻어내기
	@Override
	public int getNowRoomNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNowRoomNum");
	}

}
