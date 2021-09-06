package com.bambbang.app.board.domain;

import lombok.Data;

@Data
/*
 * @AllArgsConstructor
 * 
 * @NoArgsConstructor
 이렇게 하던지 아니면 초기화 시켜주는 생성자를 만들던지 하면 된다.
 */
public class Criteria {
	private int pageNum =1;
	private int amount =10;
	private String type;
	private String keyword;
	public Criteria() {	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type==null ? new String[] {}:type.split("");
	}
}
