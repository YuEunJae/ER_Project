package com.erproject.command;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaVO {

	private int qna_No;
	private String qna_Writer;
	private String qna_Title;
	private String qna_Content;
	private String qna_MainCategori;
	private String qna_Tow; // 글 종류 ( 일반글, 비밀글 )
	private String qna_IsAnswer; // 답변 여부
	private String qna_View;
	private String qna_Regdate;
	private String qna_UpdateDate;
	
	private List<QnaAnswerVO> qnaAnswerList;
	
}
