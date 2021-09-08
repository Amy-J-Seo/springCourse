package com.bambbang.app.board;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bambbang.app.sample.service.SampleService;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class SampleServiceClient {

	@Autowired SampleService sampleService;
		
	@Test
	public void test() {
		String str = "안녕하세요4000000000 김치참치된장꾹 방라널아널ㄴ아ㅓ란어랑너ㅏㄴ어라이";
		
		sampleService.addData(str);
		
		log.info("length=" + str.getBytes().length);
	}

}
