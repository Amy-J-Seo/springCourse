package com.bambbang.app.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.board.mapper.ReplyMapper;
import com.bambbang.app.board.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class ReplyMapperClient {

	@Autowired ReplyMapper replyMapper;
	@Autowired ReplyService replyService;
	@Test
	public void getList() {
		Criteria cri = new Criteria(1, 20);
		log.info(replyService.getList(cri, 327688L).toString());
	}

}
