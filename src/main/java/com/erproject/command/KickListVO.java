package com.erproject.command;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KickListVO {
	private int markNo;
	private String pCode;
	private String cCode;
	private double location_x;
	private double location_y;
	private String isRental;
	private Date rentalDate;
	
	private ProductInfoVO productInfoVO;
}
