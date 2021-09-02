package com.bambbang.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class DiTest {
	//Ioc(역제어) : 객체 관리를 우리가 아니라 컨테이너가 해 준다.
	//그래서 필요한 객체가 있으면 우리는 그냥 가져다가 쓰면 된다.
	//알아서 만들어라 할 때는 @Component쓰고 가져가다 쓸 때는 @Autowired쓰면 됨.
	//DI : depenency Injection
	@Autowired Employees emp; //new 객체생성 없이 컨테이너에서 주입받음.
	
	@Test
	public void test1() {
		log.info(emp.getEmployeeId());
	}
}
