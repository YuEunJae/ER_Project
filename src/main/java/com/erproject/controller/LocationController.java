package com.erproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erproject.command.KickListVO;
import com.erproject.location.service.LocationService;

@Controller
@RequestMapping("/location")
public class LocationController {
	
	@Autowired
	@Qualifier("locationService")
	private LocationService locationService;
	
	@RequestMapping("/location")
	public String location(Model model) {
		List<KickListVO> kickList = locationService.getKickInfo();
		
		model.addAttribute("kickList",kickList);
		return "location/location";
	};
	
	@RequestMapping("/locationAdmin")
	public void locationAdmin() {

	};
}
