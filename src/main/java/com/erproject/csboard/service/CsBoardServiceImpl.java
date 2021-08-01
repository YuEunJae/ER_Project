package com.erproject.csboard.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.erproject.command.APP_CONSTANT;
import com.erproject.command.CsUpdateVO;
import com.erproject.command.FaqImageVO;
import com.erproject.command.FaqVO;
import com.erproject.command.NoticeImageVO;
import com.erproject.command.NoticeVO;
import com.erproject.command.QnaAnswerVO;
import com.erproject.command.QnaVO;
import com.erproject.csboard.mapper.CsBoardMapper;
import com.erproject.util.Criteria;
import com.erproject.util.OrderUtil;

@Service("csBoardService")
public class CsBoardServiceImpl implements CsBoardService{

	@Autowired
	private CsBoardMapper csBoardMapper;
	
	@Override
	public int noticeRegist(NoticeVO vo) {
		
		int result = csBoardMapper.noticeRegist(vo);
		
		try {
			
			for(int i = 0 ; i < vo.getFile().size() ; i++) {
				
				File folder = new File(APP_CONSTANT.UPLOAD_PATH + "Notice"); // 폴더 생성위치
				
				if(!folder.exists()) { // 해당 경로에 폴더가 없다면
					folder.mkdir(); // 폴더 생성
				}
				
				MultipartFile file = vo.getFile().get(i);
				
				if(file == null) continue;
				
				// 파일명
				String fileRealName = file.getOriginalFilename();
				// 사이즈
				Long size = file.getSize();
				
				// 저장된 전체경로
				String uploadPath = folder.getPath(); // 폴더명을 포함한 경로
				
				// 확장자
				if(fileRealName.lastIndexOf(".") != -1) {
					String fileExtention = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );
					UUID uuid = UUID.randomUUID();
					String uuids = uuid.toString().replaceAll("-", "");
					
					// 업로드 파일명
					String fileName = uuids + fileExtention;
					
					File saveFile = new File(uploadPath + fileName);
					file.transferTo(saveFile); // 파일쓰기
					
					NoticeImageVO imageVO = new NoticeImageVO();
					imageVO.setNotice_No(csBoardMapper.getNoticeCurrent());
					imageVO.setNi_Path("Notice");
					imageVO.setNi_Name(fileName);
					
					csBoardMapper.noticeImageUpload(imageVO);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@Override
	public int faqRegist(FaqVO vo) {
		
		int result = csBoardMapper.faqRegist(vo);
		
		try {
			
			for(int i = 0 ; i < vo.getFile().size() ; i++) {
				
				File folder = new File(APP_CONSTANT.UPLOAD_PATH  + "FAQ"); // 폴더 생성위치
				
				if(!folder.exists()) { // 해당 경로에 폴더가 없다면
					folder.mkdir(); // 폴더 생성
				}
				
				MultipartFile file = vo.getFile().get(i);
				
				if(file == null) continue;
				
				// 파일명
				String fileRealName = file.getOriginalFilename();
				// 사이즈
				Long size = file.getSize();
				
				// 저장된 전체경로
				String uploadPath = folder.getPath(); // 폴더명을 포함한 경로
				
				// 확장자
				if(fileRealName.lastIndexOf(".") != -1) {
					String fileExtention = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );
					UUID uuid = UUID.randomUUID();
					String uuids = uuid.toString().replaceAll("-", "");
					
					// 업로드 파일명
					String fileName = uuids + fileExtention;
					
					File saveFile = new File(uploadPath + fileName);
					file.transferTo(saveFile); // 파일쓰기
					
					FaqImageVO imageVO = new FaqImageVO();
					imageVO.setFaq_No(csBoardMapper.getFaqCurrent());
					imageVO.setFi_Path("FAQ");
					imageVO.setFi_Name(fileName);
					
					csBoardMapper.faqImageUpload(imageVO);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int qnaRegist(QnaVO vo) {
		return csBoardMapper.qnaRegist(vo);
	}
	
	@Override
	public int qnaAnswerRegist(QnaAnswerVO vo) {
		
		int result = csBoardMapper.qnaAnswerRegist(vo); // qna게시판 답변 등록
		
		if(result == 1) {
			csBoardMapper.qnaAnswerUpdate(vo.getQna_No()); // qna 글 답변 등록 성공시, qna 테이블 ISANSWER Y 변경
		} else {
			
		}
		
		return result;
	}
	
	@Override
	public int getFaqTotal(OrderUtil orderUtil) {
		return csBoardMapper.getFaqTotal(orderUtil);
	}
	
	@Override
	public int getNoticeTotal(OrderUtil orderUtil) {
		return csBoardMapper.getNoticeTotal(orderUtil);
	}
	
	@Override
	public int getQnaTotal(OrderUtil orderUtil) {
		return csBoardMapper.getQnaTotal(orderUtil);
	}
	
	@Override
	public List<NoticeVO> noticeGetList(OrderUtil orderUtil, Criteria cri) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("searchType", orderUtil.getSearchType());
		map.put("searchName", orderUtil.getSearchName());
		map.put("orderType", orderUtil.getOrderType());
		
		map.put("pageNum", Integer.toString(cri.getPageNum()));
		map.put("amount", Integer.toString(cri.getAmount()));
		
		return csBoardMapper.noticeGetList(map);
	}
	
	@Override
	public List<FaqVO> faqGetList(OrderUtil orderUtil, Criteria cri) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("searchType", orderUtil.getSearchType());
		map.put("searchName", orderUtil.getSearchName());
		map.put("orderType", orderUtil.getOrderType());
		map.put("listOrder", orderUtil.getListOrder());
		
		map.put("pageNum", Integer.toString(cri.getPageNum()));
		map.put("amount", Integer.toString(cri.getAmount()));

		return csBoardMapper.faqGetList(map);
	}
	
	@Override
	public List<QnaVO> qnaGetList(OrderUtil orderUtil, Criteria cri) {
		
		Map<String, String> map = new HashMap<>();
		
		map.put("searchType", orderUtil.getSearchType());
		map.put("searchName", orderUtil.getSearchName());
		map.put("orderType", orderUtil.getOrderType());
		map.put("listOrder", orderUtil.getListOrder());
		
		map.put("pageNum", Integer.toString(cri.getPageNum()));
		map.put("amount", Integer.toString(cri.getAmount()));
		
		return csBoardMapper.qnaGetList(map);
	}
	
	@Override
	public int countView(String whereboard, int bno) {
		
		int result = 0;
		
		if(whereboard.equals("Notice")) {
			result = csBoardMapper.noticeView(bno);
		} else if(whereboard.equals("FAQ")) {
			result = csBoardMapper.faqView(bno);
		} else if(whereboard.equals("QNA")) {
			result = csBoardMapper.qnaView(bno);
		}
		
		return result;
		
	}
	
	@Override
	public int delete(String whereboard, int bno) {
		
		int result = 0;
		
		if(whereboard.equals("Notice")) {
			csBoardMapper.noticeImageDelete(bno);
			result = csBoardMapper.noticeDelete(bno);
		} else if(whereboard.equals("FAQ")) {
			csBoardMapper.faqImageDelete(bno);
			result = csBoardMapper.faqDelete(bno);
		} else if(whereboard.equals("QNA")) {
			csBoardMapper.qnaAnswerDelete(bno);
			result = csBoardMapper.qnaDelete(bno);
		}
		
		return result;
	}
	
	@Override
	public CsUpdateVO getUpdateList(String whereBoard, int bno) {
		
		CsUpdateVO vo = null;
		
		if(whereBoard.equals("Notice")) {
			vo = csBoardMapper.getNoticeUpdateList(bno);
		} else if (whereBoard.equals("FAQ")) {
			vo = csBoardMapper.getFaqUpdateList(bno);
		} else if (whereBoard.equals("QNA")) {
			vo = csBoardMapper.getQnaUpdateList(bno);
		}
		
		return vo;
	}
	
	@Override
	public int updateList(String whereBoard, CsUpdateVO vo) {
		
		System.out.println(whereBoard);
		System.out.println(vo);
		
		int result = 0;
		
		// 기존 이미지 데이터베이스 삭제
		if(whereBoard.equals("Notice")) {
			csBoardMapper.noticeImageDelete(Integer.parseInt(vo.getNo()));
		} else if (whereBoard.equals("FAQ")) {
			csBoardMapper.faqImageDelete(Integer.parseInt(vo.getNo()));
		} else if (whereBoard.equals("QNA")) {
			
		}
		
		if(vo.getImgFile() != null) {
			
			// 이미지 데이터베이스에 추가
			for(int i = 0 ; i < vo.getImgFile().size(); i++) {
				if(vo.getImgFile().get(i) == null) continue;
				
				Map<String, String> map = new HashMap<>();
				
				map.put("bno", vo.getNo());
				map.put("imgPath", whereBoard);
				map.put("imgName", vo.getImgFile().get(i));
				
				if(whereBoard.equals("Notice")) {
					csBoardMapper.noticeImageUpdate(map);
				} else if (whereBoard.equals("FAQ")) {
					csBoardMapper.faqImageUpdate(map);
				}
			}
		}
			
			
		// 추가된 이미지 로컬 저장 + 데이터베이스 저장
		if(whereBoard.equals("QNA") == false) {
			try {
				
				File folder = null; // 폴더 생성위치
				
				if(whereBoard.equals("Notice")) {
					folder = new File(APP_CONSTANT.UPLOAD_PATH + "Notice");
				} else if (whereBoard.equals("FAQ")) {
					folder = new File(APP_CONSTANT.UPLOAD_PATH + "FAQ");
				}
				
					if(!folder.exists()) { // 해당 경로에 폴더가 없다면
						folder.mkdir(); // 폴더 생성
					}
				
				for(int i = 0 ; i < vo.getFile().size() ; i++) {
					
					
					MultipartFile file = vo.getFile().get(i);
					
					if(file == null) continue;
					
					// 파일명
					String fileRealName = file.getOriginalFilename();
					// 사이즈
					Long size = file.getSize();
					
					// 저장된 전체경로
					String uploadPath = folder.getPath(); // 폴더명을 포함한 경로
					
					// 확장자
					if(fileRealName.lastIndexOf(".") != -1) {
						String fileExtention = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );
						UUID uuid = UUID.randomUUID();
						String uuids = uuid.toString().replaceAll("-", "");
						
						// 업로드 파일명
						String fileName = uuids + fileExtention;
						
						File saveFile = new File(uploadPath + fileName);
						file.transferTo(saveFile); // 파일쓰기
						
						if(whereBoard.equals("Notice")) {
							NoticeImageVO imageVO = new NoticeImageVO();
							imageVO.setNotice_No(Integer.parseInt(vo.getNo()));
							imageVO.setNi_Path("Notice");
							imageVO.setNi_Name(fileName);
							
							csBoardMapper.noticeImageUpload(imageVO);
						} else if (whereBoard.equals("FAQ")) {
							FaqImageVO imageVO = new FaqImageVO();
							imageVO.setFaq_No(Integer.parseInt(vo.getNo()));
							imageVO.setFi_Path("FAQ");
							imageVO.setFi_Name(fileName);
							
							csBoardMapper.faqImageUpload(imageVO);
						}
						
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		}
		
		
		
		// 게시판 수정
		if(whereBoard.equals("Notice")) {
			result = csBoardMapper.noticeUpdate(vo);
		} else if (whereBoard.equals("FAQ")) {
			result = csBoardMapper.faqUpdate(vo);
		} else if (whereBoard.equals("QNA")) {
			result = csBoardMapper.qnaUpdate(vo);
		}
		
		return result;
	}
	
}