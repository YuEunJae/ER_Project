<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/qnaRegist.css">
</head>

	<!-- 글 등록 폼 -->
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    
                    <div class="titlebox">
                        <p>QnA</p>
                    </div>
                    
                    <form action="qnaRegistOK" method="post" autocomplete="off">
                        
                        <!-- 대분류 -->
                        <div class="form-title">
                            <label>대분류 : </label>
                            <select name="qna_MainCategori">
                                <option value="login" selected>로그인</option>
                                <option value="product">제품</option>
                                <option value="rental">대여</option>
                                <option value="review">리뷰</option>
                            </select>
                        </div>

                        <!-- 일반,비밀 -->
                        <div class="form-title">
                            <label>글종류 : </label>
                            <select name="qna_Tow">
                                <option value="nomal" selected>일반글</option>
                                <option value="secret">비밀글</option>
                            </select>
                        </div>
                        
                        <!-- 작성자 -->
                        <div class="form-title">
                            <label>작성자 : </label>
                            <input type="text" name="qna_Writer" value="${userVO.userId }" readonly>
                        </div>
                        
                        <!-- 제목 -->
                        <div class="form-title">
                            <label>제목 : </label>
                            <input type="text" name="qna_Title" class="input-title" placeholder="제목" required>
                        </div>
                        
                        <!-- 내용 -->
                        <div class="form-title content">
                            <label>내용 : </label >
                            <textarea name="qna_Content" placeholder="내용을 입력하세요." required></textarea>
                        </div>
                        
                        <!-- 버튼 -->
                        <div class="content-btn">
                            <button type="submit" class="btn btn-default btn-signature1">등록</button>
                            <button type="button" class="btn btn-default btn-signature2" onclick="location.href='csBoardList'">목록</button>
                        </div>
                        
                    </form>
                </div>
                
            </div>
        </div>