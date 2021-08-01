package com.erproject.location.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.erproject.command.KickListVO;
import com.erproject.command.ProductInfoVO;

@Mapper
public interface LocationMapper {
	public int setMarkInfo(KickListVO vo);
	public List<KickListVO> getKickInfo();
	public int updateMarkInfo(KickListVO vo);
	public int setRental(int markNo);
	public int cencleRental(int markNo);
}
