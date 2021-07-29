package com.erproject.user.mapper;




import org.apache.ibatis.annotations.Mapper;

import com.erproject.command.UserVO;


@Mapper
public interface UserMapper {
	
	public int join(UserVO vo); //가입요청
	
	//아이디 중복 확인 하기 ~
	
	public int idCheck(UserVO vo);
	//kakao
	public int kakaoCheck(String email);
	
	//로그인
	public UserVO login(UserVO vo); //로그인
	
	
	
	//마이페이지등록 
	public UserVO getInfo(String userId);
	public UserVO getInfo2(String userId);
	
	//마이페이지 수정
    public int update(UserVO vo);
    
    public int delete(UserVO vo);
    
    //카카오로그인 
    public int kakaojoin(UserVO vo);
   
	
	//비밀번호 찾기 이메일발송전 확인 
	public int forgotck(UserVO vo);
	
	//비밀번호 찾고~ 패스워드변경 
	public int pwUpdate(UserVO vo);
	
	//내가쓴글 qna 삭제링
	public int qnaDelete(String bno);
	public void qnaReDelete(String bno);
	
	public int rnoDelete(String rno);
	
	public int rentalNum();

	
	
	
 

}
