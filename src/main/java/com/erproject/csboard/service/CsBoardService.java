package com.erproject.csboard.service;

import java.util.List;
import java.util.Map;

import com.erproject.command.CsUpdateVO;
import com.erproject.command.FaqVO;
import com.erproject.command.NoticeVO;
import com.erproject.command.QnaAnswerVO;
import com.erproject.command.QnaVO;
import com.erproject.util.Criteria;
import com.erproject.util.OrderUtil;

public interface CsBoardService {
	
	public int noticeRegist(NoticeVO vo); // 노티스 게시판 글 등록 
	public int faqRegist(FaqVO vo); // faq 게시판 글 등록
	public int qnaRegist(QnaVO vo); // qna 게시판 글 등록
	public int qnaAnswerRegist(QnaAnswerVO vo); // qna 게시판 답변 글 등록
	public int getNoticeTotal(OrderUtil orderUtil); // 노티스 게시판 총 게시글 수
	public int getFaqTotal(OrderUtil orderUtil); // FAQ 게시판 총 게시글 수
	public int getQnaTotal(OrderUtil orderUtil); // QnA 게시판 총 게시글 수
	public List<NoticeVO> noticeGetList(OrderUtil orderUtil, Criteria cri); // 노티스 게시판 글 불러오기
	public List<FaqVO> faqGetList(OrderUtil orderUtil, Criteria cri); // faq 게시판 글 불러오기
	public List<QnaVO> qnaGetList(OrderUtil orderUtil, Criteria cri); // qna 게시판 글 불러오기
	public int countView(String whereboard, int bno); // 조회수 올리기
	public int delete(String whereboard, int bno); // 글 삭제
	public CsUpdateVO getUpdateList(String whereBoard, int bno); // 수정할 리스트 가져오기
	public int updateList(String whereBoard, CsUpdateVO vo); // 게시판 수정
}