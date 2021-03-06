package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.BoardVo;

public interface CyBoardDao {
	// 게시글 가져오기
	public List<BoardVo> getBoardList() throws Exception;
	
	// 게시글 한 개 가져오기
	public BoardVo getBoardDetail(int board_num) throws Exception;
	
	// 게시글 등록
	public void insertBoard(BoardVo boardVo) throws Exception;
	
	// 게시글 수정
	public void updateBoard(BoardVo boardVo) throws Exception;
	
	// 게시글 삭제
	public void deleteBoard(int board_num) throws Exception;
	
	// 조회수 증가
	public void updateReadCount(int board_num) throws Exception;
}
