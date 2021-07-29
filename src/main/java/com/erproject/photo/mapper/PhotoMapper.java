package com.erproject.photo.mapper;

import java.util.ArrayList;
import java.util.List;

import com.erproject.command.PhotoReviewVO;
import com.erproject.command.ProductInfoVO;
import com.erproject.util.Criteria;

public interface PhotoMapper {
	
	public ArrayList<PhotoReviewVO> photoReviewGetList(String pcode); // 포토리뷰를 가져오는 함수
	
	public ProductInfoVO productGet(String pcode );
	
	public ArrayList<ProductInfoVO> productGetList(); // 포토리뷰를 가져오는 함수
	
	public int photoReviewRegist(PhotoReviewVO photoReviewVO);


}

