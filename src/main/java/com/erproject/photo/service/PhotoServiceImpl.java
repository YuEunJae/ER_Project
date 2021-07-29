package com.erproject.photo.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.erproject.command.APP_CONSTANT;
import com.erproject.command.PhotoReviewVO;
import com.erproject.command.ProductInfoVO;
import com.erproject.photo.mapper.PhotoMapper;
import com.erproject.util.Criteria;

@Service("photoService")
public class PhotoServiceImpl implements PhotoService {

	@Autowired
	private PhotoMapper photoMapper;

	@Override
	public ArrayList<PhotoReviewVO> photoReviewGetList(String pcode) {
		
		return photoMapper.photoReviewGetList(pcode);
	}
	
	@Override
	public ProductInfoVO productGet(String pcode) {
		
		return photoMapper.productGet(pcode);
	}
	
	@Override
	public ArrayList<ProductInfoVO> productGetList(){
		return photoMapper.productGetList();
	}

	@Override
	public int photoReviewRegist(PhotoReviewVO photoReviewVO) {
		
		try {
			
			if(photoReviewVO.getPhotoFile().size() > 0) {
				
				
				File folder = new File(APP_CONSTANT.UPLOAD_PATH + File.separator + "photoReview");
				
				if(!folder.exists()) {
					folder.mkdirs();
				}
				
				MultipartFile file = photoReviewVO.getPhotoFile().get(0);
				
				
				String fileRealName = file.getOriginalFilename();
				
				Long size = file.getSize();
				
				String uploadPath = folder.getPath();
				
				if(fileRealName.lastIndexOf(".") != -1) {
					String fileExtention = fileRealName.substring(fileRealName.lastIndexOf(".") , fileRealName.length() );
					UUID uuid = UUID.randomUUID();
					String uuids = uuid.toString().replaceAll("-", "");
					
					String fileName = uuids + fileExtention;
					
					File saveFile = new File(uploadPath + File.separator + fileName);
					file.transferTo(saveFile);
					
					photoReviewVO.setPhotoImage(fileName);
					
				}				
			}
			else {
				photoReviewVO.setPhotoImage("");

			}
				

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return photoMapper.photoReviewRegist(photoReviewVO);
	}
	
	
}
