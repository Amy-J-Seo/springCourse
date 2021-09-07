package com.bambbang.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.domain.ReplyVO;
import com.bambbang.app.board.service.ReplyService;


@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired ReplyMapper replyMapper;
	
	@Override
	public int insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.insert(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.delete(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.update(vo);
	}

	@Override
	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno) {
		// TODO Auto-generated method stub
		return replyMapper.getList(cri, bno);
	}

	@Override
	public ReplyVO read(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.read(vo);
	}

}
