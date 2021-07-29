package com.erproject.command;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaAnswerVO {

	private int qa_No; // 답변 번호
	private int qna_No; // QnA 게시판 게시글 번호
	private String qa_Writer; // 작성자
	private String qa_Content; // 내용
	private Timestamp qa_Regdate; // 생성일
	
}
