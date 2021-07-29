package com.erproject.product.util;

import lombok.Data;

@Data
public class PageVO {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int total;
	private int pageNum;
	private int amount;
	
	private Criteria cri;
	
	public PageVO(Criteria cri, int total) {
		
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int)Math.ceil(this.pageNum / 10.0) * 10;
		this.startPage = this.endPage - 10 + 1;
		
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = realEnd > this.endPage;
		
	}

}
