package com.bambbang.app.board.service;

import java.util.List;

import com.bambbang.app.board.domain.BoardVO;

public interface BoardService {
	//CRUD
	//등록 인서트 리턴타입은 인트거나 없거나
	public int insert(BoardVO vo); 
	//수정
	public int update(BoardVO vo);
	//삭제
	public int delete(BoardVO vo);

	//단건조회
	public BoardVO read(BoardVO vo);

	//전체조회
	public List<BoardVO> getList();

}
