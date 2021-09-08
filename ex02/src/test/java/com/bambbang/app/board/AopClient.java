package com.bambbang.app.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.bambbang.app.users.domain.UserVO;
import com.bambbang.app.users.service.UserService;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"classpath:/spring/*-context.xml",
	"file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml"
})
@Log4j
public class AopClient {

	@Autowired UserService userService;
	
	//@Test
	public void test1() {
		userService.getUserList(null);
	}
	@Test
	public void test2() {
		UserVO vo = new UserVO();
		vo.setId("test");
		userService.getUser(vo);
	}

}
