package com.kh.dailyhouse.persistence;

import java.util.List;

import com.kh.dailyhouse.domain.BoardVo;

public interface CyBoardDao {
	// 게시글 가져오기
	public List<BoardVo> getBoardList() throws Exception;
}
