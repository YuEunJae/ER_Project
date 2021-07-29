package com.erproject.servicepage.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.erproject.command.GraphicVO;


@Mapper
public interface ServicePageMapper {


	
	public ArrayList<GraphicVO> GraphicInfo();
	
	

	
}
