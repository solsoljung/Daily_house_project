package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.PointDto;

@Repository
public class BooPointListDaoImpl implements BooPointListDao {
	
	private static final String NAMESPACE = "com.kh.mappers.BooPointListMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	@Override
	public List<PointDto> getPointList(String user_email) throws Exception {
		List<PointDto> pointList = sqlSession.selectList(NAMESPACE+".getPointList", user_email);
		return pointList;
	}

}
