package com.kh.dailyhouse.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.dailyhouse.domain.BoardVo;
import com.kh.dailyhouse.persistence.CyBoardDao;

@Service
public class CyBoardServiceImpl implements CyBoardService {

	@Inject
	private CyBoardDao boardDao;
	
	// 목록 전체보기
	@Override
	public List<BoardVo> getBoardList() throws Exception {
		return boardDao.getBoardList();
	}

	// 글 상세보기
	// 조회수 증가
	@Override
	public BoardVo getBoardDetail(int board_num) throws Exception {
		boardDao.updateReadCount(board_num);
		return boardDao.getBoardDetail(board_num);
	}

	// 글 등록
	@Override
	public void insertBoard(BoardVo boardVo) throws Exception {
		boardDao.insertBoard(boardVo);
	}

	// 글 수정
	@Override
	public void updateBoard(BoardVo boardVo) throws Exception {
		boardDao.updateBoard(boardVo);
	}

	// 글 삭제
	@Override
	public void deleteBoard(int board_num) throws Exception {
		boardDao.deleteBoard(board_num);
	}

}
