package com.bambbang.app;


import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bambbang.app.impl.EmpMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmpMapperClient {

	@Autowired EmpMapper dao;
	@Autowired SqlSessionTemplate mybatis;
	
	@Test
	public void mybatisTest() {
		List<Employees> list = mybatis.selectList("com.bambbang.app.impl.EmpMapper.getEmp", "10");
		log.info("Job Id is : ========"+list.get(0).getJobId());  //jsp${emp.XXXX}
	}
	
	//@Test ?? not error :(
	public void mybatisTest2() {
		List<Departments> list = mybatis.selectList("com.bambbang.app.Departments.getDept");
		log.info(list.get(0).toString());
	}
	
	@Ignore @Test
	public void test() {
		log.info(dao.getEmp("10").toString());
	}

	//@Test
	public void getTime() {
		log.info("Time ==" +dao.getTime());
	}
}
