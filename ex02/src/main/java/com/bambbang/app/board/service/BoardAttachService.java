package com.bambbang.app.board.service;

import java.util.List;

import com.bambbang.app.board.domain.BoardAttachVO;

public interface BoardAttachService {

	public void insert(BoardAttachVO vo);

	public void delete(String uuid);

	public List<BoardAttachVO> findByBno(Long bno);

	public void deleteAll(Long bno);

	public List<BoardAttachVO> getOldFiles();
	
	public BoardAttachVO read(String uuid);

}