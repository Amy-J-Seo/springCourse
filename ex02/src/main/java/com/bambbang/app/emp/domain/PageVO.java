package com.bambbang.app.emp.domain;

import com.bambbang.app.board.domain.Criteria;

import lombok.Data;

@Data
public class PageVO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	public PageVO(int total, Criteria cri) {
		super();
		this.cri=cri;
		this.total = total;
		this.endPage=(int)Math.ceil(cri.getPageNum()/10.0)*10;
		this.startPage = this.endPage-9;
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if(realEnd > this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage>1;
		this.next = this.endPage<realEnd;
			
	}
}
