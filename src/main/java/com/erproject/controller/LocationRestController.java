package com.erproject.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.erproject.command.KickListVO;
import com.erproject.command.LiveInfoVO;
import com.erproject.location.service.LocationService;

@RestController
@RequestMapping("/location")
public class LocationRestController {

	@Autowired
	@Qualifier("locationService")
	private LocationService locationService;

	@PostMapping("/setMarkInfo")
	public @ResponseBody List<KickListVO> markInfo(@RequestBody List<LiveInfoVO> vo) {

		List<KickListVO> kickInfo = new ArrayList<KickListVO>();
		KickListVO kickList = new KickListVO();

		for (int i = 0; i < vo.size(); i++) {
			kickList.setMarkNo(i);
			kickList.setPCode(vo.get(i).getStationId());
			kickList.setCCode(vo.get(i).getStationName());
			kickList.setLocation_x(Double.parseDouble(vo.get(i).getStationLatitude()));
			kickList.setLocation_y(Double.parseDouble(vo.get(i).getStationLongitude()));

			kickInfo.add(kickList);

			int result = locationService.setMarkInfo(kickList);
			if (result == 0) {
				System.out.println("데이터 기입중 오류가 발생했습니다.");
				return null;
			}

		}

		return kickInfo;
	}

	@GetMapping("updateMarkInfo")
	public int updateMarkInfo() {
		KickListVO kickList = new KickListVO();
		int update = 0;
		int count = 0;
		int size = 100;

		for(int i=0; i<size;i++) { 
			switch (i%8) { 
				case 0: 
					kickList.setMarkNo(i);
					kickList.setPCode("ALTON");
					kickList.setCCode("Roku");
					update = locationService.updateMarkInfo(kickList);
					if(update==1) count++; 
					break;
				case 1: 
					kickList.setMarkNo(i);
					kickList.setPCode("MOTOVELO"); 
					kickList.setCCode("Wing");
					update = locationService.updateMarkInfo(kickList);
					if(update==1) count++; 
					break; 
				case 2: 
					kickList.setMarkNo(i);
					kickList.setPCode("Nio-NQ-01"); 
					kickList.setCCode("Nio");
					update = locationService.updateMarkInfo(kickList);
					if(update==1) count++; 
					break; 
				case 3: 
					kickList.setMarkNo(i);
					kickList.setPCode("One-Step-10D"); 
					kickList.setCCode("Wing");
					update = locationService.updateMarkInfo(kickList);
					if(update==1) count++; 
					break; 
				case 4: 
					kickList.setMarkNo(i);
					kickList.setPCode("Switch-S10"); 
					kickList.setCCode("Switch");
					update = locationService.updateMarkInfo(kickList);
					if(update==1) count++; 
					break; 
				case 5:
					kickList.setMarkNo(i); 
					kickList.setPCode("ZETA"); 
					kickList.setCCode("Roku");
					update = locationService.updateMarkInfo(kickList);
					if(update==1) count++; 
					break; 
				case 6: 
					kickList.setMarkNo(i);
					kickList.setPCode("M365"); 
					kickList.setCCode("Xiaomi");
					update = locationService.updateMarkInfo(kickList);
					if(update==1) count++; 
					break; 
				case 7: 
					kickList.setMarkNo(i);
					kickList.setPCode("PRC-456"); 
					kickList.setCCode("Xiaomi");
					update = locationService.updateMarkInfo(kickList);
					if(update==1) count++; 
					break; 
				default: 
					break; 
				} 
			}
		
		System.out.println("업데이트 결과값 : " + count + ", " + update);
		return update;
	}

	/*
	 * 1. Roku. ALTON 2.Wing MOTOVELO 3.Nio Nio-NQ-01 4.Wing One-Step-10D 5.
	 * Switch-S10 6.Roku ZETA 7.Xiaomi M365 8. PRC-456
	 */

	@GetMapping("getMarkInfo")
	public @ResponseBody List<KickListVO> getMarkInfo() {

		List<KickListVO> kickInfo = locationService.getKickInfo();

		return kickInfo;
	}
	
	@PostMapping("setRental")
	public @ResponseBody int setRental(@RequestBody int markNo) {
		int result = locationService.setRental(markNo);
		return result;
	}
	
	@PostMapping("cencleRental")
	public @ResponseBody int cencleRental(@RequestBody int markNo) {
		int result = locationService.cencleRental(markNo);
		return result;
	}
}
