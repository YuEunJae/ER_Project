package com.erproject.command;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GraphicVO {

	private String pcode;
	private String ccode;
	private int isrental;
	
	private Date RENTALDATE;
	
}
