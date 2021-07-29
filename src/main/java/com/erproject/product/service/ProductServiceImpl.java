package com.erproject.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erproject.command.ProductHelpVO;
import com.erproject.command.ProductInfoVO;
import com.erproject.command.ProductReviewVO;
import com.erproject.product.mapper.ProductMapper;
import com.erproject.product.util.Criteria;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public int reviewRegist(ProductReviewVO vo) {
		
		return productMapper.reviewRegist(vo);
	}

	@Override
	public ProductReviewVO getDetail(int rno) {
		
		return productMapper.getDetail(rno);
	}

	@Override
	public int update(ProductReviewVO vo) {
		
		return productMapper.update(vo);
	}

	@Override
	public int delete(int rno) {
		
		return productMapper.delete(rno);
	}

	@Override
	public ProductInfoVO productGetList(String pcode) {
		
		return productMapper.productGetList(pcode);
	}

	@Override
	public ArrayList<ProductReviewVO> reviewGetList(String pcode, Criteria cri) {
		
		Map<String, String> map = new HashMap<>();
		map.put("pcode", pcode);
		map.put("pageNum", Integer.toString(cri.getPageNum()));
		map.put("amount", Integer.toString(cri.getAmount()));
		
		
		return productMapper.reviewGetList(map);
	}

	@Override
	public int getTotal(String pcode) {
		
		return productMapper.getTotal(pcode);
	}

	@Override
	public ArrayList<Integer> starGetList(String pcode) {
		
		return productMapper.starGetList(pcode);
	}

	@Override
	public int starTotalSum(ArrayList<Integer> starList) {
		
		int totalSum = 0;
		for(int i : starList) {
			totalSum += i;
		}
		
		return totalSum;
	}

	@Override
	public double starAverage(int starSum, int total) {
		
		double result = (starSum / (total*5.00)) * 5;
		
		return Math.round(result * 100) / 100.0;
		
	}

	@Override
	public int productReviewCheck(String userId, String pcode) {
		
		return productMapper.productReviewCheck(userId, pcode);
	}

	@Override
	public ProductHelpVO helpSelect(ProductHelpVO vo) {
		
		return productMapper.helpSelect(vo);
	}

	@Override
	public int helpInsert(ProductHelpVO vo) {
		
		return productMapper.helpInsert(vo);
	}

	@Override
	public int helpUpdateOne(ProductHelpVO vo) {
		
		return productMapper.helpUpdateOne(vo);
	}

	@Override
	public int helpUpdateZero(ProductHelpVO vo) {
		
		return productMapper.helpUpdateZero(vo);
	}

	@Override
	public ArrayList<Integer> helpTotal(ProductHelpVO vo) {
		
		return productMapper.helpTotal(vo);
	}

	@Override
	public int updateTotal(ProductHelpVO vo, int total) {
		
		return productMapper.updateTotal(vo, total);
	}

	
	
	

//	@Override
//	public int helpCountUp(ProductReviewVO vo) {
//		
//		return productMapper.helpCountUp(vo);
//	}
//
//	@Override
//	public int helpCountSelect(ProductReviewVO vo) {
//		
//		return productMapper.helpCountSelect(vo);
//	}
//	
//	@Override
//	public int helpCountDown(ProductReviewVO vo) {
//		
//		int result = productMapper.helpCountSelect(vo);
//		if(result == 0) {
//			return productMapper.helpCountDownNo(vo);
//		}
//		return productMapper.helpCountDown(vo);		
//	}


}
