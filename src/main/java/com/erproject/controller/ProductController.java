package com.erproject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erproject.command.ProductHelpVO;
import com.erproject.command.ProductInfoVO;
import com.erproject.command.ProductReviewVO;
import com.erproject.product.service.ProductService;
import com.erproject.product.util.Criteria;
import com.erproject.product.util.PageVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	@Qualifier("productService")
	private ProductService productService;
	
	// 제품 상세 페이지 화면처리 & 후기 리스트 (제품 데이터도 가져오는 작업 추가해야함)
	@RequestMapping("/productMain")
	public void productMain(Model model,
							Criteria cri,
							@RequestParam("pcode") String pcode) {
		
		
		ArrayList<ProductReviewVO> list = productService.reviewGetList(pcode, cri);
		int total = productService.getTotal(pcode);
		PageVO pageVO = new PageVO(cri, total);
		
		model.addAttribute("list", list); // 화면에 전달
		
		ProductInfoVO info = productService.productGetList(pcode);
		model.addAttribute("info", info);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("total", total);
		model.addAttribute("pcode", pcode);
		
		ArrayList<Integer> starList = productService.starGetList(pcode);
		int starSum = productService.starTotalSum(starList);
		
		double starAvg = productService.starAverage(starSum, total);
		model.addAttribute("starAvg", starAvg);
		
//		System.out.println(starList.toString());
//		System.out.println(starSum);
//		System.out.println(total);
//		System.out.println(starAvg);
		
//		System.out.println(list.toString());
//		System.out.println(list.size());
//		
//		System.out.println(info.toString());
		
	}
	
	// 로그인 회원은 1개의 제품 후기만 작성할 수 있음. (제품 후기 작성 화면으로 넘어가기 전 확인 작업)
	@RequestMapping("productReviewCheck")
	public String productReviewCheck(@RequestParam("userId") String userId,
									 @RequestParam("pcode") String pcode,
									 RedirectAttributes RA,
									 Model model) {
		
		int result = productService.productReviewCheck(userId, pcode);
//		System.out.println("작성한 후기 수: " + result);
		
		if(result >= 1) {
			RA.addFlashAttribute("msg", "제품 후기는 1개만 작성할 수 있습니다.");
			return "redirect:/product/productMain?pcode=" + pcode;
		}
		
		model.addAttribute("pcode", pcode);
		return "product/productReviewRegist";
	}
	
	
	// 제품 후기 쓰기 화면처리
	@RequestMapping("/productReviewRegist")
	public void productReviewRegist(@RequestParam("pcode") String pcode,
									Model model) {
		String pc = pcode;
		model.addAttribute("pcode", pc);
	}
	
	// 제품 후기 상세 및 저장 화면처리
	@RequestMapping("/productReviewSave")
	public void productReviewSave(@RequestParam("rno") int rno,
								  Model model) {
		
		ProductReviewVO vo = productService.getDetail(rno);
		model.addAttribute("vo", vo);
//		System.out.println(vo);
		
	}
	
	// 제품 후기 쓰기(등록) 메서드 처리
	@RequestMapping("/registForm")
	public String registForm(ProductReviewVO vo,
							 RedirectAttributes RA) {
		
		int result = productService.reviewRegist(vo);
		String pcode = vo.getPcode();
//		System.out.println(result);
		if(result == 1) {
			RA.addFlashAttribute("msg", "후기 등록이 정상적으로 완료되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "후기 등록에 실패하였습니다. 다시 시도해 주세요.");
		}
		
		return "redirect:/product/productMain?pcode=" + pcode;
	}
	
	// 제품 후기 업데이트
	@RequestMapping("/reviewUpdate")
	public String reviewUpdate(ProductReviewVO vo,
							   RedirectAttributes RA) {
		
		int result = productService.update(vo);
		String pcode = vo.getPcode();
//		System.out.println(result);
		if(result == 1) {
			RA.addFlashAttribute("msg", "후기 수정이 정상적으로 완료되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "후기 수정에 실패하였습니다. 다시 시도해 주세요.");
		}
		
		return "redirect:/product/productMain?pcode=" + pcode;
	}
	
	// 제품 후기 삭제하기
	@RequestMapping("/reviewDelete")
	public String reviewDelete(@RequestParam("rno") int rno,
							   @RequestParam("pcode") String pcode,
							   RedirectAttributes RA) {
		
		int result = productService.delete(rno);
		
//		System.out.println(result);
		if(result == 1) {
			RA.addFlashAttribute("msg", "후기 삭제가 정상적으로 완료되었습니다.");
		} else {
			RA.addFlashAttribute("msg", "후기 삭제에 실패하였습니다. 다시 시도해 주세요.");
		}
		
		return "redirect:/product/productMain?pcode=" + pcode;
	}
	
	// 도움 카운트 컨트롤러
//	@ResponseBody
//	@CrossOrigin("*")
//	@PostMapping(value = "/helpCountUp")
//	public int helpCountUp(@RequestBody ProductReviewVO vo) {
//		
////		System.out.println(vo.toString());
//		int result = productService.helpCountUp(vo);
//		
//		return result;
//	}
//	
//	@ResponseBody
//	@CrossOrigin("*")
//	@PostMapping(value = "/helpCountDown")
//	public int helpCountDown(@RequestBody ProductReviewVO vo) {
//		
//		System.out.println(vo.toString());
//		int result = productService.helpCountDown(vo);
//		
//		return result;
//	}
	
//	// 제품 목록 페이지를 가기전 처리할 작업
//	@RequestMapping("/ProductListSelect")
//	public String ProductListSelect(Model model) {
//		String[] productList = {"ALTON", "MOTOVELO", "Nio-NQ-01", "One-Step-10D", "Switch-S10", "ZETA", "M365", "PRC-456"};
//		ArrayList<Integer> reviewTotal = new ArrayList<>();
//		for(int i = 0; i < productList.length; i++) {
//			 reviewTotal.add(productService.getTotal(productList[i]));
//		}
//		model.addAttribute("reviewTotal", reviewTotal);
//		return "product/kangarooProductList";
//	}
	
	// 제품 목록 페이지 화면처리
	@RequestMapping("/kangarooProductList")
	public void kangarooProductList(Model model) {
		String[] productList = {"ALTON", "MOTOVELO", "Nio-NQ-01", "One-Step-10D", "Switch-S10", "ZETA", "M365", "PRC-456"};
		ArrayList<Integer> reviewTotal = new ArrayList<>();
		for(int i = 0; i < productList.length; i++) {
			 reviewTotal.add(productService.getTotal(productList[i]));
		}
		model.addAttribute("reviewTotal", reviewTotal);
		
	}
	
	ProductHelpVO helpVO;
	@ResponseBody
	@CrossOrigin("*")
	@PostMapping(value = "/helpCountChange")
	public int helpCountUp(@RequestBody ProductHelpVO vo) {
		
		helpVO = productService.helpSelect(vo);
		
		int result = 1;
		if(helpVO == null) {
//			System.out.println("insert로 넣어줘야함");
			result = productService.helpInsert(vo);
		} else {
			System.out.println("헬프카운트가 0인지 1인지 확인하고 또 나눠줌..... 아.. 이렇게 하는게 맞는거야?");
			if(helpVO.getHelpcount() == 1) {
//				System.out.println("0으로 바꿔줍시다");
				result = productService.helpUpdateZero(vo);
				result = 0;
			} else {
//				System.out.println("1로 바꿔줍시다");
				result = productService.helpUpdateOne(vo);
			}
		}
		
		ArrayList<Integer> helpCount = productService.helpTotal(vo);
		System.out.println(helpCount.toString());
		int total = 0;
		for(int i : helpCount) {
			total += i;
		}
		// total을 ProductReviewVO의 helpcount로 update시켜줍니다.
		int result2 = productService.updateTotal(vo, total);
		if(result2 == 1) {
			System.out.println("리뷰vo로 업데이트 성공");
		} else {
			System.out.println("리뷰vo로 업데이트 실패");
		}
		
		return result;
	}

}
