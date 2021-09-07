package com.bambbang.app.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.domain.ReplyVO;

public interface ReplyService {
	//CURD
		public int insert(ReplyVO vo);
		public int delete(ReplyVO vo);
		public int update(ReplyVO vo);
		public ReplyVO read(ReplyVO vo);
		//게시글번호에 해당하는 댓글 조회
		public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno);
}
