package com.erproject.product.util;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private boolean pnScroll;
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
