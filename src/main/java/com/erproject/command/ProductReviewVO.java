package com.erproject.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductReviewVO {
	
	private int rno;
	private String writer;
	private String title;
	private String content;
	private String star;
	private Timestamp regdate;
	private Timestamp updatedate;
	private String pcode;
	private int helpcount;

}
