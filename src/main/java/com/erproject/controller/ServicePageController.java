package com.erproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erproject.command.GraphicVO;
import com.erproject.command.UserVO;
import com.erproject.servicepage.service.ServicePageService;

@Controller
@RequestMapping("/servicePage")
public class ServicePageController {
	
	@Autowired
	private ServicePageService servicePageService;
	
	
	@RequestMapping("/servicePage")
	public String servicePage(Model model, HttpSession session) throws ParseException {
		
		if(session.getAttribute("userVO") == null) {
			return "redirect:/user/userLogin";
		}
		
		UserVO vo = (UserVO)session.getAttribute("userVO");
		model.addAttribute("userId", vo.getUserId());
		
		double Xiaomi = 0;
		double Nio = 0;
		double Switch = 0;
		double Roku = 0;
		double Wing = 0;
		
		ArrayList<GraphicVO> list = (ArrayList<GraphicVO>)servicePageService.GraphicInfo();
		
		for(int i = 0; i<list.size(); i++) {
			
			if(list.get(i).getCcode().equals("Xiaomi")) {
				Xiaomi++;
			}
			
			else if(list.get(i).getCcode().equals("Nio")) {
				Nio++;
			}
			
			else if(list.get(i).getCcode().equals("Switch")) {
				Switch++;
			}
			
			else if(list.get(i).getCcode().equals("Roku")) {
				Roku++;
			}
			
			else if(list.get(i).getCcode().equals("Wing")) {
				Wing++;
			}
			
		}
				
		double total = Xiaomi + Nio + Switch + Roku +  Wing;
		
		Xiaomi = (Xiaomi / total) * 100;
		Nio = (Nio / total) * 100;
		Switch = (Switch / total) * 100;
		Roku = (Roku / total) * 100;
		Wing = (Wing / total) * 100;
		
		Xiaomi = Math.floor(Xiaomi*100)/100.0;
		Nio = Math.floor(Nio*100)/100.0;
		Switch = Math.floor(Switch*100)/100.0;
		Roku = Math.floor(Roku*100)/100.0;
		Wing = Math.floor(Wing*100)/100.0;
		
		model.addAttribute("Xiaomi", Xiaomi);
		model.addAttribute("Nio", Nio);
		model.addAttribute("Switch", Switch);
		model.addAttribute("Roku", Roku);
		model.addAttribute("Wing", Wing);
		
		
//		요일
		Date date = new Date();
		
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat today2 = new SimpleDateFormat("E");

		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date);
		cal1.add(Calendar.DATE, -1);

		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date);
		cal2.add(Calendar.DATE, -2);

		Calendar cal3 = Calendar.getInstance();
		cal3.setTime(date);
		cal3.add(Calendar.DATE, -3);

		Calendar cal4 = Calendar.getInstance();
		cal4.setTime(date);
		cal4.add(Calendar.DATE, -4);

		Calendar cal5 = Calendar.getInstance();
		cal5.setTime(date);
		cal5.add(Calendar.DATE, -5);

		Calendar cal6 = Calendar.getInstance();
		cal6.setTime(date);
		cal6.add(Calendar.DATE, -6);		
		
		String day1 = today.format(date);
		String day2 = today.format(cal1.getTime());
		String day3 = today.format(cal2.getTime());
		String day4 = today.format(cal3.getTime());
		String day5 = today.format(cal4.getTime());
		String day6 = today.format(cal5.getTime());
		String day7 = today.format(cal6.getTime());
				
		ArrayList<String> list2 = new ArrayList<String>();
	
		int[] arr = new int[7];
		
		list2.add(day1);
		list2.add(day2);
		list2.add(day3);
		list2.add(day4);
		list2.add(day5);
		list2.add(day6);
		list2.add(day7);

		for(int j = 0; j<list2.size(); j++) {
			
			for(int i = 0; i< list.size(); i++) {
				
				if(list2.get(j).equals((String)today.format(list.get(i).getRENTALDATE()))) {
					arr[j]++;
				}
				
			}
			
		}
					
		
		for(int i = 0; i < list2.size(); i++) {
			
			if(today2.format(today.parse(list2.get(i))).equals("월")) {
				model.addAttribute("Mon", arr[i]);
			}
			
			else if(today2.format(today.parse(list2.get(i))).equals("화")) {
				model.addAttribute("Tue", arr[i]);
			}

			else if(today2.format(today.parse(list2.get(i))).equals("수")) {
				model.addAttribute("Wed", arr[i]);
			}
			
			else if(today2.format(today.parse(list2.get(i))).equals("목")) {
				model.addAttribute("Thu", arr[i]);
			}
			
			else if(today2.format(today.parse(list2.get(i))).equals("금")) {
				model.addAttribute("Fri", arr[i]);
			}
			
			else if(today2.format(today.parse(list2.get(i))).equals("토")) {
				model.addAttribute("Sat", arr[i]);
			}
			
			else if(today2.format(today.parse(list2.get(i))).equals("일")) {
				model.addAttribute("Sun", arr[i]);
			}

			
		}
		
		return "servicePage/servicePage";
		
	}
	
	
}
