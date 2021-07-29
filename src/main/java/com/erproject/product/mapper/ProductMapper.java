package com.erproject.product.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.erproject.command.ProductHelpVO;
import com.erproject.command.ProductInfoVO;
import com.erproject.command.ProductReviewVO;

@Mapper
public interface ProductMapper {

	public int reviewRegist(ProductReviewVO vo); // 제품 후기 등록
//	public ArrayList<ProductReviewVO> reviewGetList(String pcode); // 메인 화면에 후기 리스트 가져오기
	
	public ArrayList<ProductReviewVO> reviewGetList(Map<String, String> map); // 메인 화면에 후기 리스트 가져오기 + 페이지네이션
	public int getTotal(@Param("pcode") String pcode); // 전체 게시글 수 가져오기
	
	public ProductReviewVO getDetail(int rno); // 후기 상세에서 보여질 데이터 가져오기
	public int update(ProductReviewVO vo); // 후기 업데이트
	public int delete(int rno); // 후기 삭제
	
	// 제품 페이지에 처리할 제품 정보 관련 메서드
	public ProductInfoVO productGetList(@Param("pcode") String pcode);
	
	// 별점만 리스트로 가져오는 메서드
	public ArrayList<Integer> starGetList(String pcode);
	
	// 후기 중복 확인 메서드
	public int productReviewCheck(@Param("userId") String userId, @Param("pcode") String pcode);
	
//	// 도움 카운트 플러스 메서드
//	public int helpCountUp(@Param("vo") ProductReviewVO vo);
//	
//	// 도움 카운트 조회 메서드
//	public int helpCountSelect(@Param("vo") ProductReviewVO vo);
//	
//	// 도움 카운트 마이너스 메서드
//	public int helpCountDown(@Param("vo") ProductReviewVO vo);
//	
//	// 도움 카운트 마이너스 하지않음 메서드
//	public int helpCountDownNo(@Param("vo") ProductReviewVO vo);
	
	
	// 비동기처리 도움 카운트 메서드 모음입니다...
	// 헬프카운트 조회하기 위한 메서드
	public ProductHelpVO helpSelect(@Param("vo") ProductHelpVO vo);
	// 없을 경우 insert해주는 메서드 
	public int helpInsert(@Param("vo") ProductHelpVO vo);
	// 헬프카운트 다시 1로 업데이트 메서드 
	public int helpUpdateOne(@Param("vo") ProductHelpVO vo);
	// 헬프카운트 다시 0으로 업데이트 메서드
	public int helpUpdateZero(@Param("vo") ProductHelpVO vo);
	// pcode, rno에 해당하는 전체 헬프카운트를 조회해서 리뷰vo에 업데이트 시켜줘야함
	public ArrayList<Integer> helpTotal(@Param("vo") ProductHelpVO vo);
	// update시켜줍시다.
	public int updateTotal(@Param("vo")ProductHelpVO vo, @Param("total") int total);
	
}
