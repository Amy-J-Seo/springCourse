package com.bambbang.web;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bambbang.web.impl.JobMapper;

import lombok.extern.java.Log;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@Log
public class JobClientTest {

	
	@Autowired
	private JobMapper jobMapper;
	@Test
	public void test() {
		log.info(jobMapper.getJobs().toString());
		
		
	}

}
