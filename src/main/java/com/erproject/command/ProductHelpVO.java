package com.erproject.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductHelpVO {
	
	private String userId;
	private int rno;
	private String pcode;
	private int helpcount;

}
