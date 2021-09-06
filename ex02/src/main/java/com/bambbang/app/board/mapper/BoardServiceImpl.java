package com.bambbang.app.board.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bambbang.app.board.domain.BoardVO;
import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper boardMapper;
	//BoardMapper boardMapper; 상위버젼에선 이렇게만 해도 된대
	
	@Override
	public int insert(BoardVO vo) {
		return boardMapper.insert(vo);
	}

	@Override
	public int update(BoardVO vo) {
		return boardMapper.update(vo);
	}

	@Override
	public int delete(BoardVO vo) {
		return boardMapper.delete(vo);
	}

	@Override
	public BoardVO read(BoardVO vo) {
		return boardMapper.read(vo);
	}

	@Override
	public List<BoardVO> getList(Criteria cri){
		return boardMapper.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}

}
