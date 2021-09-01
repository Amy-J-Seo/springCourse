package com.bambbang.app;

public class BuilderTest {

	public static void main(String[] args) {
		
		Member member = Member.builder()
				.id("aaa")
				.pw("ddd").build();
		
	}

}
