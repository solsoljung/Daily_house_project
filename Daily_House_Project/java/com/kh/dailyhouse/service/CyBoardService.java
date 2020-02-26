package com.kh.dailyhouse.service;

import java.util.List;

import com.kh.dailyhouse.domain.BoardVo;

public interface CyBoardService {
	// 게시글 가져오기
	public List<BoardVo> getBoardList() throws Exception;
}
