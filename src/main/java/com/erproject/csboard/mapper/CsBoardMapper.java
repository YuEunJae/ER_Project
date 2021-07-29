package com.erproject.csboard.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.erproject.command.CsUpdateVO;
import com.erproject.command.FaqImageVO;
import com.erproject.command.FaqVO;
import com.erproject.command.NoticeImageVO;
import com.erproject.command.NoticeVO;
import com.erproject.command.QnaAnswerVO;
import com.erproject.command.QnaVO;
import com.erproject.util.OrderUtil;

@Mapper
public interface CsBoardMapper {

	public int noticeRegist(NoticeVO vo); // Notice 글 등록
	public int faqRegist(FaqVO vo); // faq 게시판 글 등록
	public int qnaRegist(QnaVO vo); // qna 게시판 글 등록
	
	public int qnaAnswerRegist(QnaAnswerVO vo); // qna 게시판 답변 글 등록
	public void qnaAnswerUpdate(int bno); // 답변 등록시 qna 게시판 ISANSWER 수정
	
	public int getNoticeTotal(OrderUtil orderUtil); // 노티스 게시판 총 게시글 수
	public int getFaqTotal(OrderUtil orderUtil); // FAQ 게시판 총 게시글 수
	public int getQnaTotal(OrderUtil orderUtil); // QnA 게시판 총 게시글 수
	
	public List<NoticeVO> noticeGetList(Map<String, String> map); // 노티스 게시판 글 불러오기
	public List<FaqVO> faqGetList(Map<String, String> map); // faq 게시판 글 불러오기
	public List<QnaVO> qnaGetList(Map<String, String> map); // qna 게시판 글 불러오기
	
	public int noticeView(int bno); // notice 게시판 조회수 증가
	public int faqView(int bno); // faq 게시판 조회수 증가
	public int qnaView(int bno); // qna 게시판 조회수 증가
	
	public int noticeDelete(int bno); // notice 게시판 글 삭제
	public void noticeImageDelete(int bno); // noticeImage 삭제
	public int faqDelete(int bno); // bno 게시판 글 삭제
	public void faqImageDelete(int bno); // faqImage 삭제
	public int qnaDelete(int bno); // qna 게시판 글 삭제
	public void qnaAnswerDelete(int bno); // qnaAnswer 삭제
	
	public int getNoticeCurrent(); // notice 게시판 현재 글 번호
	public int getFaqCurrent(); // qna 게시판 현재 글 번호
	public void noticeImageUpload(NoticeImageVO vo); // notice 게시판 이미지 업로드
	public void faqImageUpload(FaqImageVO vo); // faq 게시판 이미지 업로드
	
	public CsUpdateVO getNoticeUpdateList(int bno); // Notice 수정할 리스트
	public CsUpdateVO getFaqUpdateList(int bno); // Faq 수정할 리스트
	public CsUpdateVO getQnaUpdateList(int bno); // QnA 수정할 리스트
	
	public int noticeImageUpdate(Map<String, String> map); // Notice 이미지 수정
	public int faqImageUpdate(Map<String, String> map); // Notice 이미지 수정
	
	public int noticeUpdate(CsUpdateVO vo); // Notice 수정 요청
	public int faqUpdate(CsUpdateVO vo); // faq 수정 요청
	public int qnaUpdate(CsUpdateVO vo); // QnA 수정 요청
	
}