package com.erproject.servicepage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erproject.command.GraphicVO;
import com.erproject.servicepage.mapper.ServicePageMapper;

@Service("/servicePageService")
public class ServicePageServiceImpl implements ServicePageService{

	@Autowired
	private ServicePageMapper servicePageMapper;

	@Override
	public ArrayList<GraphicVO> GraphicInfo() {
		
		return servicePageMapper.GraphicInfo();
	}





}
