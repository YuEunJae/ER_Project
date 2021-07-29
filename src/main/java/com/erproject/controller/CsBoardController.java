package com.erproject.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erproject.command.APP_CONSTANT;
import com.erproject.command.CsUpdateVO;
import com.erproject.command.FaqVO;
import com.erproject.command.NoticeVO;
import com.erproject.command.QnaAnswerVO;
import com.erproject.command.QnaVO;
import com.erproject.csboard.service.CsBoardService;
import com.erproject.util.Criteria;
import com.erproject.util.OrderUtil;
import com.erproject.util.PageVO;

@Controller
@RequestMapping("/csBoard")
public class CsBoardController {
	
	@Autowired
	@Qualifier("csBoardService")
	private CsBoardService csBoardService;

	@RequestMapping("/csBoardList")

	public void csBoard(OrderUtil orderUtil,
						Criteria cri,
						Model model) {
		
		System.out.println(orderUtil.toString());
		
//		노티스 게시판 페이징 만들기
		PageVO noticePage = new PageVO(cri, csBoardService.getNoticeTotal(orderUtil));
//		faq 게시판 페이징 만들기
		PageVO faqPage = new PageVO(cri, csBoardService.getFaqTotal(orderUtil));
//		qna 게시판 페이징 만들기
		PageVO qnaPage = new PageVO(cri, csBoardService.getQnaTotal(orderUtil));
		
//		노티스 게시판 페이징 전달
		model.addAttribute("noticePage", noticePage);
//		faq 게시판 페이징 전달
		model.addAttribute("faqPage", faqPage);
//		qna 게시판 페이징 전달
		model.addAttribute("qnaPage", qnaPage);
		
//		노티스 게시판 글 불러오기
		model.addAttribute("noticeList", csBoardService.noticeGetList(orderUtil, cri));
//		faq 게시판 글 불러오기
		model.addAttribute("faqList", csBoardService.faqGetList(orderUtil, cri));
//		qna 게시판 글 불러오기
		model.addAttribute("qnaList", csBoardService.qnaGetList(orderUtil, cri));
		
//		정렬 순서 기억
		model.addAttribute("orderUtil", orderUtil);

	}
	
	@RequestMapping("/qnaRegist")
	public void qnaRegist() {
		
	}
	
	@RequestMapping("/csBoardUpdate")
	public void csBoardUpdate(@RequestParam("bno") int bno,
							  HttpServletRequest request,
							  Model model) {
		
		Cookie[] cookies = request.getCookies();
		
		if( cookies != null && cookies.length > 0) { // 쿠키가 있는경우
			
			for(int i = 0 ; i < cookies.length ; i++) {
				
				if(cookies[i].getName().equals("whereboard")) { // whereboard 라는 쿠키
					String whereBoard = cookies[i].getValue();
					model.addAttribute("whereBoard", whereBoard);
					
					model.addAttribute("UpdateList", csBoardService.getUpdateList(whereBoard, bno));
				}
			}
		}
		
		
	}
	
//	notice 게시판 글 등록
	@RequestMapping("/noticeRegist")
	public String noticeRegist(NoticeVO vo, 
							   RedirectAttributes RA) {
		
		System.out.println(vo.getFile().toString());
		
		int result = csBoardService.noticeRegist(vo);
		
		if( result == 1) {
			RA.addFlashAttribute("msg", "글이 등록 되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "글 등록에 실패했습니다. 다시 시도하세요");
		}
		
		return "redirect:/csBoard/csBoardList";
	}
	
//	FAQ 게시판 글 등록
	@RequestMapping("/faqRegist")
	public String faqRegist(FaqVO vo,
							RedirectAttributes RA) {
		
		int result = csBoardService.faqRegist(vo);
		
		if( result == 1) {
			RA.addFlashAttribute("msg", "글이 등록 되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "글 등록에 실패했습니다. 다시 시도하세요");
		}
		
		return "redirect:/csBoard/csBoardList";
	}
	
//	QnA 게시판 글 등록
	@RequestMapping("/qnaRegistOK")
	public String qnaRegistOk(QnaVO vo,
							  RedirectAttributes RA) {
		
		System.out.println(vo.toString());
		
		int result = csBoardService.qnaRegist(vo);
		
		if( result == 1) {
			RA.addFlashAttribute("msg", "글이 등록 되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "글 등록에 실패했습니다. 다시 시도하세요");
		}
		
		return "redirect:/csBoard/csBoardList";
	}
	
//	QnA 게시판 답변 글 등록
	@RequestMapping("/replyRegist")
	public String replayRegist(QnaAnswerVO vo,
							   RedirectAttributes RA) {
		
		int result = csBoardService.qnaAnswerRegist(vo);
		
		if( result == 1) {
			RA.addFlashAttribute("msg", "답변이 등록 되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "답변 등록에 실패했습니다. 다시 시도하세요");
		}
		
		return "redirect:/csBoard/csBoardList";
	}
	
//	게시판 수정하기 완료
	@RequestMapping("/CsUpdateOK")
	public String CsUpdateOK(CsUpdateVO vo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes RA) {
		
		System.out.println(vo.toString());
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null && cookies.length > 0) { // 쿠기가 있는 경우
			
			for(int i = 0 ; i < cookies.length; i++) {
				if(cookies[i].getName().equals("whereboard")) {
					int result = csBoardService.updateList(cookies[i].getValue(), vo);
					
					if(result == 1) {
						RA.addFlashAttribute("msg", "정상적으로 수정 되었습니다.");
					} else {
						RA.addFlashAttribute("msg", "오류가 발생했습니다. 다시 시도하세요");
					}
				}
			}
			
		}
		
		
		return "redirect:/csBoard/csBoardList";
	}
	
//	조회 수 올리기
	@ResponseBody
	@CrossOrigin("*")
	@PostMapping(value = "/countView")
	public int countView(@RequestBody Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) {
		
		Cookie[] cookies = request.getCookies();
		
		String whereboard = (String)map.get("whereboard");
		int bno = (int)map.get("bno");
		
		if(cookies != null && cookies.length > 0) { // 쿠기가 있는 경우
			
			for(int i = 0 ; i < cookies.length; i++) {
				if(cookies[i].getName().equals("viewCookie")) {
					if(cookies[i].getValue().equals(whereboard + bno)) {  // 중복
						return 0; // 같은 글을 클릭했을 경우 조회수를 증가하지 않고 리턴
					}
				}
			}
			
		}
		
		int result = csBoardService.countView(whereboard , bno);
		
		Cookie newCookie = new Cookie("viewCookie", whereboard + bno); // 현재 게시판 + 번호 로 쿠키 저장
		response.addCookie(newCookie); // 쿠키 저장
		
		
		return result;
	}
	
//	글 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam("whereboard") String whereboard,
						 @RequestParam("bno") int bno,
						 RedirectAttributes RA) {
		
		int result = csBoardService.delete(whereboard, bno);
		
		if( result == 1) {
			RA.addFlashAttribute("msg", "해당 글이 삭제 되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "해당 글 삭제에 실패했습니다. 다시 시도하세요");
		}
		
		return "redirect:/csBoard/csBoardList";
	}
	
//	이미지 조회해서 가져오기
	@ResponseBody
	@RequestMapping("view/{fileLoca}/{fileName:.+}")
	public ResponseEntity<byte[]> view(@PathVariable("fileLoca") String fileLoca,
									   @PathVariable("fileName") String fileName) {
		
		ResponseEntity<byte[]> result = null;
		
		try {
//			파일데이터를 바이트데이터로 변환해서 반환
			File file = new File(APP_CONSTANT.UPLOAD_PATH + "\\" + fileLoca + "\\" + fileName);
			
//			반환할 헤더객체
			HttpHeaders header = new HttpHeaders(); //
			header.add("Content-type", Files.probeContentType(file.toPath() ));
			
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}