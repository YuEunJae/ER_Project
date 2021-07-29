package com.erproject.photo.service;

import java.util.ArrayList;

import com.erproject.command.PhotoReviewVO;
import com.erproject.command.ProductInfoVO;

public interface PhotoService {
	
	public ArrayList<PhotoReviewVO> photoReviewGetList(String pcode); // 포토리뷰를 가져오는 함수
	public ProductInfoVO productGet(String pcode);
	public ArrayList<ProductInfoVO> productGetList();
	public int photoReviewRegist(PhotoReviewVO photoReviewVO);
}
