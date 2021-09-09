package com.bambbang.app.board.service;

import java.util.List;

import com.bambbang.app.board.domain.BoardAttachVO;
import com.bambbang.app.board.domain.BoardVO;
import com.bambbang.app.board.domain.Criteria;

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
	public List<BoardVO> getList(Criteria cri);
	//전체 데이터 수 조회
	public int getTotalCount(Criteria cri);
	//게시글에 첨부된 파일리스트
	public List<BoardAttachVO> getAttachList(Long bno);
	
	//첨부파일 단건조회
	public BoardAttachVO attachRead(String uuid);
}
