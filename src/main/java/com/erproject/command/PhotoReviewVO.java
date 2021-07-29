package com.erproject.command;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PhotoReviewVO {

	private int pno;
	private String pcode;
	private String photoImage;
	private String photoWriter;
	private String photoTitle;
	private int photoStar;
	private String photoContent;
	private List<MultipartFile> photoFile;
	private String created;
	
	
	
	
}
