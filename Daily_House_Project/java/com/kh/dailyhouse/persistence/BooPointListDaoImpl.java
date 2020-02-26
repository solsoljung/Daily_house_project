package com.kh.dailyhouse.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.PointDto;
import com.kh.dailyhouse.domain.ReviewPagingDto;

@Repository
public class BooPointListDaoImpl implements BooPointListDao {
	
	private static final String NAMESPACE = "com.kh.mappers.BooPointListMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	@Override
	public List<PointDto> getPointList(String user_email, ReviewPagingDto reviewPagingDto) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_email", user_email);
		paramMap.put("reviewPagingDto", reviewPagingDto);
		
		List<PointDto> pointList = sqlSession.selectList(NAMESPACE+".getPointList", paramMap);
		return pointList;
	}

	@Override
	public int getPointListTotalCount(String user_email) throws Exception {
		int totalCount = sqlSession.selectOne(NAMESPACE+".getPointListTotalCount", user_email);
		return totalCount;
	}

}
