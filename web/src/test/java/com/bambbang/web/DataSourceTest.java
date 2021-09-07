package com.bambbang.web;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.java.Log;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
@Log
public class DataSourceTest {

	//@Setter(onMethod_ = {@Autowired})
	@Autowired //23줄 대신 이렇게 간단히 써도 된다
	private DataSource dataSource; //root-config 에 있는 아이디 dataSource를 읽어옮
	@Test
	public void testConnection() {
		try(Connection conn = dataSource.getConnection()){
			log.info(conn.toString());
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}

}
