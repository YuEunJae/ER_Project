package com.erproject.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erproject.command.APP_CONSTANT;
import com.erproject.command.PhotoReviewVO;
import com.erproject.command.ProductInfoVO;
import com.erproject.command.UserVO;
import com.erproject.photo.service.PhotoService;
import com.erproject.product.service.ProductService;

@Controller
@RequestMapping("/photo")
public class PhotoListController {
	
	
	@Autowired
	@Qualifier("photoService")
	private PhotoService photoService;
	
	//홈화면의 리뷰쓰기란을 눌렀을 떄
	//결과적으로 제품목록과 제품에 대한 포토리뷰 목록을 보여준다
	@RequestMapping("/photoList")
	public void photoList(String pcode, Model model) {
		
		ArrayList<ProductInfoVO> productList = photoService.productGetList();;
		
		if(pcode == null || pcode.equals("")) {
						
			ProductInfoVO firstProduct = productList.get(0);

			pcode = firstProduct.getPcode();
		}
	
		System.out.println("pcode=" + pcode);
		
		ArrayList<PhotoReviewVO> list = photoService.photoReviewGetList(pcode);
		
		
		System.out.println(list.toString());
		System.out.println(productList.toString());
		
		model.addAttribute("pcode", pcode);
		model.addAttribute("list", list);
		model.addAttribute("productList", productList);
		
	}
	
	//글쓰기 버튼을 눌렀을 떄
	//글쓰기 화면을 보여줌
	
	@RequestMapping(value="/writeReviewRegist", params="pcode")
	public String writeReviewRegist(HttpSession session , Model model, @RequestParam("pcode") String pcode) {
		
		if(session.getAttribute("userVO") == null) {
			return "redirect:/user/userLogin";
		} 
		
		UserVO userVo = (UserVO)session.getAttribute("userVO");
		String userId = userVo.getUserId();
	
		ProductInfoVO product = photoService.productGet(pcode);
		
		model.addAttribute("product", product);
		
		return "photo/writeReviewRegist";
	}
	
	@RequestMapping(value="/registForm" , method=RequestMethod.POST)
	public String registForm(PhotoReviewVO vo , HttpSession session , Model model) {
		
		if(session.getAttribute("userVO") == null) {
			return "redirect:/user/userLogin";
		} 
		
		UserVO userVo = (UserVO)session.getAttribute("userVO");
		String userId = userVo.getUserId();

		vo.setPhotoWriter(userId);
		
		System.out.println("============================================");
		
		System.out.println(vo.toString());
		
		int result = photoService.photoReviewRegist(vo);
		
		System.out.println(result);
		
		return "redirect:/photo/photoList";
	}

	
	@ResponseBody
	@RequestMapping("view/photoReview/{fileName:.+}")
	public ResponseEntity<byte[]> view(@PathVariable("fileName") String fileName) {
		
		ResponseEntity<byte[]> result = null;
		
		try {
//			파일데이터를 바이트데이터로 변환해서 반환
			File file = new File(APP_CONSTANT.UPLOAD_PATH + File.separator + "photoReview" + File.separator + fileName);
			
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
