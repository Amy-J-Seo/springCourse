package com.bambbang.app.board;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"classpath:/spring/*-context.xml",
	"file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml"
})
@Log4j
public class BoardControllerClient {

	@Autowired WebApplicationContext ctx;  //가짜 서버
	private MockMvc mockMvc;
	
	@Before //테스트 실행 되기 전에 해야 할 일이 있다면...before에 적어준다.
	//만약에 밑에 테스트가 세개가 있으면 이 before가 세번 실행된다.
	public void setup() {
			this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test //실행순서 없이 멀티 쓰레드 방식으로 개별적으로 진행됨
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap().toString()
				);
		
	}

}
