package com.bambbang.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bambbang.app.board.domain.BoardVO;
import com.bambbang.app.board.service.BoardService;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")

public class BoardMapperClient {

	//@Autowired BoardMapper boardMapper;
	@Autowired BoardService boardMapper;
	
	@Test
	public void getList() {
		log.info(boardMapper.getList().toString());
	}
	
	BoardVO vo = new BoardVO();//VO는 컴포넌트 등록안한대

	//@Test
	public void insert() {
		//BoardVO 생성
		vo.setTitle("hello");
		vo.setContent("This is test test");
		vo.setWriter("Hambo");
		boardMapper.insert(vo);
		log.info(Long.toString(vo.getBno()));
		log.info(vo.toString()+" 가  인서트 되었습니다.");
	}
	//@Test
	public void read() {
		vo.setBno(2);
		vo=boardMapper.read(vo);
		log.info(vo.toString());
	}
	//@Test
	public void update() {
		vo.setContent("update test");
		vo.setTitle("update test title");
		vo.setBno(3);
		boardMapper.update(vo);
		log.info(boardMapper.read(vo));
	}
	
	//@Test
	//@Rollback   //Rollback 주면 롤백된대
	public void delete() {
		vo.setBno(3);
		//boardMapper.delete(vo);
		//log.info(Long.toString(vo.getBno())+" 번 글이 지워졌습니다. ");
		int result = boardMapper.delete(vo);
		assertEquals(result, 1); //이거는 junit 초록막대기 볼라고하는것
	}

}
