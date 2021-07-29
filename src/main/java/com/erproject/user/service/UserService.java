package com.erproject.user.service;

import com.erproject.command.UserVO;


public interface UserService {
	
	
	public int join(UserVO vo); //가입요청

	//중복체크 
	public int idCheck(UserVO vo);
	
	//kakao
		public int kakaoCheck(String email);
	
	//로그인
	public UserVO login(UserVO vo); //로그인
	
	//정보 마이페이지
	public UserVO getInfo(String userId);


	public UserVO getInfo2(String userId);

	//마이페이지 수정
	public int update(UserVO vo);
	
	//삭제
	public int delete(UserVO vo);
	

	//카카오로그인
	public int kakaojoin(String id, String email);
	
	//비밀번호 찾기 이메일발송전 확인 
	public int forgotck(UserVO vo);
	
	//비밀번호 찾고~ 패스워드변경 
	public int pwUpdate(UserVO vo);
	
	
	//마이페이지 내가쓴글 삭제~~~~거의마지막이당~야호
	public int qnaDelete(String[] bno);
	
	public int rnoDelete(String[] rno);
	
	//홈화면 잔여대여대수
	
	public int rentalNum();

	
}