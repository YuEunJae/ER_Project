package com.erproject.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpServerErrorException;

import com.erproject.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@RequestMapping(value="/")
	public String home() {
		
		
		return "home";
		
		
		
	}
	
	@ResponseBody
	@GetMapping(value="kickNum")
	public int kickNum() {
		
		int result = userService.rentalNum();
		return result;
	}

	
	@RequestMapping(value="/Notice")
	public String notice(HttpServletRequest request ,HttpServletResponse response) {
		
		Cookie[] cookies = request.getCookies();
		
		if( cookies != null && cookies.length > 0) { // 쿠키가 있는경우
			
			for(int i = 0 ; i < cookies.length ; i++) {
				
				if(cookies[i].getName().equals("whereboard")) { // whereboard 라는 쿠키
					
					cookies[i].setValue("Notice");
					response.addCookie(cookies[i]);
					return "redirect:/csBoard/csBoardList";
				}
			}
		} 
		
		Cookie cookie = new Cookie("whereboard", "Notice");
		response.addCookie(cookie);
		
		return "redirect:/csBoard/csBoardList";
	}
	
	@RequestMapping(value="/FAQ")
	public String faq(HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookies = request.getCookies();
		
		if( cookies != null && cookies.length > 0) { // 쿠키가 있는경우
			
			for(int i = 0 ; i < cookies.length ; i++) {
				
				if(cookies[i].getName().equals("whereboard")) { // whereboard 라는 쿠키
					
					cookies[i].setValue("FAQ");
					response.addCookie(cookies[i]);
					return "redirect:/csBoard/csBoardList";
				}
			}
		} 
		
		Cookie cookie = new Cookie("whereboard", "FAQ");
		response.addCookie(cookie);
		
		return "redirect:/csBoard/csBoardList";
	}
	
	@RequestMapping(value="/QNA")
	public String qna(HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookies = request.getCookies();
		
		if( cookies != null && cookies.length > 0) { // 쿠키가 있는경우
			
			for(int i = 0 ; i < cookies.length ; i++) {
				
				if(cookies[i].getName().equals("whereboard")) { // whereboard 라는 쿠키
					
					cookies[i].setValue("QNA");
					response.addCookie(cookies[i]);
					return "redirect:/csBoard/csBoardList";
				}
			}
		} 
		
		Cookie cookie = new Cookie("whereboard", "QNA");
		response.addCookie(cookie);
		
		return "redirect:/csBoard/csBoardList";
	}
	
	
	
	
}


