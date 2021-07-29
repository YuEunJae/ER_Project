<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/qnaRegist.css?after">


<!-- 글 등록 폼 -->
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 content-wrap">
                        
                        <div class="titlebox">
                            <p>수정</p>
                        </div>
                        
                        <form action="CsUpdateOK" method="post" autocomplete="off" enctype="multipart/form-data">
                        
                        	<input type="hidden" name="no" value="${UpdateList.no }">
                            
                            <!-- 대분류 -->
                            <c:if test="${whereBoard eq 'FAQ' or whereBoard eq 'QNA' }">
                            <div class="form-title">
                                <label>대분류 : </label>
                                <select name="main_Categori">
                                    <option value="login" ${UpdateList.main_Categori eq '' or UpdateList.main_Categori eq null or UpdateList.main_Categori eq 'login' ? 'selected' : ''} >로그인</option>
                                    <option value="product" ${UpdateList.main_Categori eq 'product' ? 'selected' : '' }>제품</option>
                                    <option value="rental" ${UpdateList.main_Categori eq 'rental' ? 'selected' : '' }>대여</option>
                                    <option value="review" ${UpdateList.main_Categori eq 'review' ? 'selected' : '' }>리뷰</option>
                                </select>
                            </div>
                            </c:if>
    
    						
                            <!-- 일반,비밀 -->
                            <c:if test="${whereBoard eq 'QNA' }">
                            <div class="form-title">
                                <label>글종류 : </label>
                                <select name="tow">
                                    <option value="nomal" selected>일반글</option>
                                    <option value="secret">비밀글</option>
                                </select>
                            </div>
                            </c:if>
                            
                            <!-- 작성자 -->
                            <div class="form-title">
                                <label>작성자 : </label>
                                <input type="text" name="writer" value="${UpdateList.writer }" readonly>
                            </div>
                            
                            <!-- 제목 -->
                            <div class="form-title">
                                <label>제목 : </label>
                                <input type="text" name="title" class="input-title" placeholder="제목" value="${UpdateList.title }" required>
                            </div>
                            
                            
                            <!-- 내용 -->
                            <div class="form-title content">
                            	<div class="imageDiv">
                            	</div>
                                <label>내용 : </label >
                                <textarea name="content" placeholder="내용을 입력하세요.">${UpdateList.content }</textarea>
                            </div>
                            
                            <!-- 버튼 -->
                            <div class="content-btn">
                            	<c:if test="${userVO.userId eq 'master123' }">
                            		<label for="" class="file" >이미지 업로드</label>
                            	</c:if>
                                <button type="submit" class="btn btn-default btn-signature1">완료</button>
                                <button type="button" class="btn btn-default btn-signature2" onclick="location.href='csBoardList'">취소</button>
                                
                                <div class="fileDiv">
                                </div>
                            </div>
                            
                        </form>
                    </div>
                    
                </div>
            </div>
            
            <script>
	            var obj = {count: 0};
	            
	            <c:forEach var="imageList" items="${UpdateList.imageList}">
	            	$(".imageDiv").append(
	            			"<div class='content-view-img'>" +
	            			"<img src='view/${imageList.ni_Path }/${imageList.ni_Name}' alt='이미지' class='fileImg[" + obj.count + "]'>" +
	            			"<button type='button' class='imgDeleteBtn' data-info='file" + obj.count + "'>x</button>" +
	            			"</div>"
	            	);
	            	
	            	$(".fileDiv").append(
	            			"<input type='hidden' id='file" + obj.count + "' name='imgFile[" + obj.count + "]' value='${imageList.ni_Name}'>"
	            	);
	            	
	            	obj.count ++;
	            </c:forEach>
            </script>
            
            <script src="${pageContext.request.contextPath }/resources/js/csBoardUpdate.js"></script>