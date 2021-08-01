package com.erproject.location.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erproject.command.KickListVO;
import com.erproject.command.ProductInfoVO;
import com.erproject.location.mapper.LocationMapper;

@Service("locationService")
public class LocationServiceImpl implements LocationService{

	@Autowired
	private LocationMapper locationMapper;
	
	@Override
	public int setMarkInfo(KickListVO vo) {
		return locationMapper.setMarkInfo(vo);
	}

	@Override
	public int updateMarkInfo(KickListVO vo) {
		return locationMapper.updateMarkInfo(vo);
	}
	@Override
	public List<KickListVO> getKickInfo() {
		return locationMapper.getKickInfo();
	}

	@Override
	public int setRental(int markNo) {
		return locationMapper.setRental(markNo);
	}

	@Override
	public int cencleRental(int markNo) {
		return locationMapper.cencleRental(markNo);
	}
	
}
