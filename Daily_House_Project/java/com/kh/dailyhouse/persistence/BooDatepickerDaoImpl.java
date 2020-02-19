package com.kh.dailyhouse.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BooDatepickerDaoImpl implements BooDatepickerDao {
	
	private static final String NAMESPACE = "com.kh.mappers.BooDatepickerMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	@Override
	public String getEndDate(int room_num, String date) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("room_num", room_num);
		paramMap.put("date", date);
		
		String endDate = sqlSession.selectOne(NAMESPACE+".getEndDate", paramMap);
		return endDate;
	}

}
