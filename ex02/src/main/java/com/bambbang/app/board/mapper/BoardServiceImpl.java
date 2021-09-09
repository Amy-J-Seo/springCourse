package com.bambbang.app.board.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bambbang.app.board.domain.BoardAttachVO;
import com.bambbang.app.board.domain.BoardVO;
import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardMapper boardMapper;
	//BoardMapper boardMapper; 상위버젼에선 이렇게만 해도 된대
	@Autowired BoardAttachMapper attachMapper;
	
	@Override
	public int insert(BoardVO vo) {
		boardMapper.insert(vo); //게시글 등록
		//첨부파일 등록 (첨부파일 테이블에) 교재 567
		if(vo.getAttachList() == null) {
			return 1;			
		}
		for(BoardAttachVO attach : vo.getAttachList()) {
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		}
		return 1;
	}

	@Override
	public int update(BoardVO vo) {
		return boardMapper.update(vo);
	}

	@Override
	public int delete(BoardVO vo) {
		return boardMapper.delete(vo);
	}

	@Override //게시글 단건조회. 첨부파일 목록을 가져갈것임.
	public BoardVO read(BoardVO vo) {
		vo= boardMapper.read(vo); //게시글만 조회해서 보에 담기
		vo.setAttachList( attachMapper.findByBno(vo.getBno()) ); //첨부파일도 조회해서 보에 담고 리턴
		return vo;
	}

	@Override
	public List<BoardVO> getList(Criteria cri){
		return boardMapper.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}

	@Override //교과서
	public List<BoardAttachVO> getAttachList(Long bno) {
		return attachMapper.findByBno(bno);
	}

	@Override
	public BoardAttachVO attachRead(String uuid) {
		return attachMapper.read(uuid);
	}



}
