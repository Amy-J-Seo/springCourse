package com.bambbang.app.board.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.domain.ReplyPageVO;
import com.bambbang.app.board.domain.ReplyVO;
import com.bambbang.app.board.service.ReplyService;


@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired ReplyMapper replyMapper;
	@Autowired BoardMapper boardMapper;
	
	@Override
	public int insert(ReplyVO vo) {
		boardMapper.updateReplycnt(vo.getBno(), 1L);
		return replyMapper.insert(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
		vo = replyMapper.read(vo);
		boardMapper.updateReplycnt(vo.getBno(), -1L);
		return replyMapper.delete(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		return replyMapper.update(vo);
	}

	@Override
	public ReplyPageVO getList(@Param("cri") Criteria cri, @Param("bno") Long bno) {
		ReplyPageVO vo = new ReplyPageVO();
		vo.setReplyCnt(replyMapper.getCountByBno(bno));
		vo.setList(replyMapper.getList(cri, bno));
		return vo;
	}

	@Override
	public ReplyVO read(ReplyVO vo) {
		return replyMapper.read(vo);
	}

}
