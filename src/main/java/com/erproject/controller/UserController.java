package com.erproject.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erproject.command.UserVO;

import com.erproject.user.service.UserService;
import com.erproject.user.service.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	
	@RequestMapping("userJoin")
	public String userJoin() {
		
		return "user/userJoin";
		
	}
	
	@RequestMapping("userLogin")
	public String userLogin() {
		
		return "user/userLogin";
	}
	
	
	//중복처라하기
	@ResponseBody
	@PostMapping(value ="/idCheck" , produces="application/json")
	public int idCheck(@RequestBody UserVO vo) {
		
		int result = userService.idCheck(vo);//1이라면 중복임 
		
		System.out.println("중복확인성공");
		return result;
	}
	


	
	//회원가입
	
	@RequestMapping(value="/joinForm" , method=RequestMethod.POST)
	public String joinForm(UserVO vo , RedirectAttributes RA) {
		

		int result = userService.join(vo);
		
		if(result ==1) {
			RA.addAttribute("msg" , "가입을 축하합니다");
			return "redirect:/user/userLogin";
			
		}else {
			RA.addFlashAttribute("msg" , "가입에 실패하였습니다 다시시도하세용~");
		}
		return "redirect:/user/userJoin"; 
		
		
	}
	
	@RequestMapping(value="/kakaoForm")
	public String kakaoForm(@RequestParam("userId") String email , 
			                RedirectAttributes RA , HttpSession session) {
		
		
		
		int idx =email.indexOf('@');
	
		String id = email.substring(0,idx);
		System.out.println(id);
		
		int result1 = userService.kakaoCheck(id);//1이라면 중복임 
		
		if(result1 ==0) {
			
			int result =userService.kakaojoin(id, email);
			if(result ==1) {
				
				UserVO userVO = new UserVO();
				
				
				
				userVO.setUserId(id);
				userVO.setUserPw(id);
				userVO.setUserEmail(email);
				
				session.setAttribute("userVO", userVO);
				RA.addFlashAttribute("msg" , "카카오고객님 환영합니다! 마이페이지에서 추가정보를 입력해주세요");
				return "redirect:/user/userMypage";
				
				
				
			} else {
				RA.addFlashAttribute("msg" , "카카오로그인에 실패하셨습니다 . 다시시도해주세요");
				
				return "redirect:/";
			}
			
			
		} else { //1이면중복 
			
			UserVO userVO = new UserVO();
			userVO.setUserId(id);
			
			session.setAttribute("userVO", userVO);
			RA.addFlashAttribute("msg" , "카카오고객님 환영합니다! 마이페이지에서 추가정보를 입력해주세요");
			return "redirect:/user/userMypage";
			
		}
		
		
		
		
		
	}
	
	
	//로그인
	@RequestMapping(value ="/loginForm" , method=RequestMethod.POST)
	public String loginForm(UserVO vo,  HttpSession session , Model model) {
		
		UserVO userVO = userService.login(vo);
		
		System.out.print("로그인 성공");
		
		if(userVO != null) {
			session.setAttribute("userVO", userVO);
			return "redirect:/";	
			
		} else {
			model.addAttribute("msg" , "아이디비밀번호를 확인하세용");
			return "user/userLogin";
		}
		
		
	}
	

	
	//마이페이지 
	@RequestMapping("/userMypage")
	public String userMypage(HttpSession session , Model model) {
		
		if(session.getAttribute("userVO") == null) {
			return "redirect:/user/userLogin";
		} 
		UserVO vo = (UserVO)session.getAttribute("userVO");
		String userId=vo.getUserId();
		
		UserVO userInfo = userService.getInfo(userId);
		UserVO userInfo2 = userService.getInfo2(userId);
		
		model.addAttribute("userInfo" , userInfo);
		model.addAttribute("userInfo2" , userInfo2);
		
		return "user/userMypage";
		
	}

	
	
	//마이페이지 수정 
	
	@RequestMapping("/userUpdate")
	public String userUpdate(UserVO vo , RedirectAttributes RA) {
		
		int result = userService.update(vo);
		
		if(result ==1) {
			RA.addFlashAttribute("msg" , "정상수정되었습니다!");
		}else {
			RA.addFlashAttribute("msg", "수정실패되었습니다. 다시 시도해주세요 ");
		}
		return "redirect:/user/userMypage";
	}
	
   //탈퇴 
	@RequestMapping("/userDelete")
	public String userdelete(UserVO vo , RedirectAttributes RA,HttpSession session ) {
		
		System.out.print(vo.toString());
		
		int result = userService.delete(vo);
		
		if(result ==1) {
			
			RA.addFlashAttribute("msg" , "성공적으로탈퇴처리되었습니다. 다음에 다시 만나요!");
			session.invalidate();
			return "redirect:/user/userLogin";
			
		}else {
			RA.addFlashAttribute("msg", "탈퇴시도가 실패되었습니. 다시 시도해주세요 ");
		}
		
		return "redirect:/user/userMypage";
	}
	
	//로그아웃
	
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session ) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	
	
	//password 찾기 
	
	@RequestMapping("userForgot")
	public String userForgot() {
		
		return "user/userForgot";
	}

	
	@RequestMapping("userForgotCheck")
	public String userForgotCheck() {
		
		return "user/userForgotCheck";
	}

	
	@RequestMapping("userNewPassword")
	public String userNewPassword() {
		
		return "user/userNewPassword";
	}
	


		//pw찾기 시작!
		
      @Autowired
      private JavaMailSender mailSender;
      
      @RequestMapping(value = "/findPw", method = {RequestMethod.GET, RequestMethod.POST})
	    public String doGet(HttpServletRequest request, HttpServletResponse response , RedirectAttributes RA) throws ServletException,IOException{
    	  
    
    	  
   	  String userId = request.getParameter("userId");
      String userEmail = request.getParameter("userEmail");
    	  
    	//userVO에서 userId를 불러와서 email 비교하기!!ㅎㅎ 헤ㅔㅎ 성공 ~><><
    	UserVO userVO = userService.getInfo(userId);
    	System.out.println(userVO.toString());
    	
    	if( !userVO.getUserEmail().equals(userEmail)) { //실패인상태! 즉 email이 다를떄~~
    		
    		System.out.print("실패ㅜㅜ");
    		
    		RA.addFlashAttribute("msg", "아이디와 등록된 이메일 일치하지않습니다 다시 시도해주세요!");

    		
    		
    		return "redirect:/user/userForgot";
    		
    	} else { //성공일때 같을때!
    		
    		System.out.println("성공임");
    		System.out.print(userEmail);
	  
//	    	Random r = new Random();
//	    	int codeNum = r.nextInt(999999); 
    		
    		int codeNum =(int)(Math.random() *(999999 -100000 +1))+100000;
    		
    		System.out.println(codeNum);
	    	
	   

	    	
	    		
	    		String subject = "안녕하세요 캥거루입니다:)";
	    		String content = "안녕하세요 귀하의 인증번호는  "+codeNum+" 입니다.";
	    		String from = "thevanppp@naver.com";
	    		String to = userEmail;
	    		
	    		
	    		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	    			
	    			public void prepare(MimeMessage mimeMessage) throws Exception{
	    				final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	    				
	    				mailHelper.setFrom(from);
	    				mailHelper.setTo(to);
	    				mailHelper.setSubject(subject);
	    				mailHelper.setText(content, true);
	    				
	    			}
	    			
	    		};
	  
	    				try {    
	    					mailSender.send(preparator);
	    					
	    					
	    				} catch(Exception e) {
	    					e.printStackTrace();
	    				}  
	    				
	    				
	    				
       				   request.setAttribute("codeNum", codeNum);
       				   request.setAttribute("userId", userId);
	    				
	    				
        				
	    				System.out.println("인증번호:"+ codeNum +"아이디:"+  userId);

	    				return "redirect:/user/userForgotCheck?codeNum="+codeNum+"&userId="+userId;

	
    	
    	}
    	   
	    };
	    
	    @RequestMapping(value = "codeCheck", method = RequestMethod.POST)
	    public String pw_set(@RequestParam(value="emailCode") String emailCode,
	    			         @RequestParam(value = "codeNum") String codeNum,
	    			         @RequestParam(value = "userId") String userId,
	    			         RedirectAttributes RA) throws IOException{
	    
//	    	HttpServletRequest request, HttpServletResponse response
	    System.out.println(codeNum);
	    System.out.println(userId);
	    	
	    		
	    		if(emailCode.equals(codeNum)) {
	    			System.out.print("인증번호확인성공!");
          			RA.addFlashAttribute("msg" , "인증번호확인 성공!");
	    			
	    			return "forward:/user/userNewPassword"; 
	    			
	    		} else {
	    			
	    			RA.addFlashAttribute("msg" , "인증번호가 다릅니다 다시시도해주세요");
	    			return "redirect:/user/userForgot";
	    		}
	    } //이메일 인증번호 확인
	    
	    
		//마이페이지 수정 
		
		@RequestMapping(value= "pwUpdate",method = {RequestMethod.GET, RequestMethod.POST})
		public String pwupdate(UserVO vo ,@RequestParam(value = "userId") String userId, RedirectAttributes RA){
			
			
			System.out.print(userId);
			
			int result = userService.pwUpdate(vo);
			
			if(result ==1) {
				
				RA.addFlashAttribute("msg" , "정상수정되었습니다!");
			}else {
				RA.addFlashAttribute("msg", "수정실패되었습니다. 다시 시도해주세요 ");
				
			}
			
			return "redirect:/user/userLogin";
		}
	    
		
		//체크된 목록 삭제 
		
		@RequestMapping(value="checkDelete")
		public String checkdelete(@RequestParam("RowCheck") String[] qnaNo)  {

			int result = userService.qnaDelete(qnaNo);
			int result2=userService.rnoDelete(qnaNo);
			
			return "redirect:/user/userMypage";
		}
		
		
		
		
		
		
		

}
