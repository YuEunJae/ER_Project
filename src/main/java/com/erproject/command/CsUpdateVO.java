package com.erproject.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CsUpdateVO {

	private String no;
	private String writer;
	private String title;
	private String content;
	private String main_Categori;
	private String tow;
	
	private List<NoticeImageVO> imageList;
	private List<String> imgFile;
	private List<MultipartFile> file;
}
