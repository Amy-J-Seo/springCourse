package com.bambbang.app.emp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.bambbang.app.board.domain.Criteria;
import com.bambbang.app.emp.mapper.EmployeeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"classpath:/spring/*-context.xml",
	"file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml"
})
@Log4j
public class EmployeeMapperClient {
	@Autowired EmployeeMapper empMapper;
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1,10);
		log.info(empMapper.getList(cri).toString());
	}
}
