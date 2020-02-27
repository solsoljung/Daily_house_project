package com.kh.dailyhouse.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.dailyhouse.domain.BoardVo;

@Repository
public class CyBoardDaoImpl implements CyBoardDao {

	private static final String NAMESPACE = "com.kh.mappers.BoardMapper";
	
	@Inject
	public SqlSession sqlSession;
	
	// 글 전체 조회
	@Override
	public List<BoardVo> getBoardList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getBoardList");
	}

}
