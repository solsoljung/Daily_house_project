package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.LikeVo;

@Repository
public class YOLikeListDaoImpl implements YOLikeListDao {
	
	private static final String NAMESPACE = "com.kh.mappers.LikeMapper";
	
	@Inject
	public SqlSession sqlSession;

	@Override
	public List<LikeVo> getLikeList(String user_email) throws Exception {
		List<LikeVo> list = sqlSession.selectList(NAMESPACE + ".getLikeList", user_email);
		return list;
	}

}
