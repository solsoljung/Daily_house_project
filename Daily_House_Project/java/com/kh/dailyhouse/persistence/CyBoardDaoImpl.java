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

	// 글 추가하기
	@Override
	public void insertBoard(BoardVo boardVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertBoard", boardVo);
	}

	// 글 수정하기
	@Override
	public void updateBoard(BoardVo boardVo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateBoard", boardVo);
	}

	// 글 삭제하기
	@Override
	public void deleteBoard(int board_num) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteBoard", board_num);
	}

	// 게시글 한 개 가져오기
	@Override
	public BoardVo getBoardDetail(int board_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", board_num);
	}

	@Override
	public void updateReadCount(int board_num) throws Exception {
		sqlSession.update(NAMESPACE + ".updateReadCount", board_num);
	}

}
