<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/dongyeon.css">
</head>


<section class="sect-main">

	<div class="titlebox">
	    <p>Review</p>
	</div>
	
	<div class="photoBox">
    	<div class="photoList">
				<div class="photo">
            		<div class=photo-image style="margin : 0 auto;">   
               			<img src="${pageContext.request.contextPath }/img/productimg/altonimg1.png" alt=""  height="262px">
					</div>

					<div class="photo-content">
						<div class="info">
       						<span>${product.pname} </span>
   						</div>
					</div>
				</div>					
    	</div>
	</div>

	<div class="container" style="margin-bottom: 75px;">
		<div class="row">
	    	<div class="write-wrap">
	            
	            
	            <form action="registForm" method="post"  enctype="multipart/form-data">
	            
	
	                <div class="form-group">
	                    <label>제목</label>
	                    <input class="form-control" name='photoTitle' value="" type="text">
	                </div>
	
	                <div class="form-group">
	                    <label>별점</label>
	                    <select class="sel-star form-control" name="photoStar">
	                        <option value="5">★★★★★(5점)</option>
	                        <option value="4">★★★★(4점)</option>
	                        <option value="3">★★★(3점)</option>
	                        <option value="2">★★(2점)</option>
	                        <option value="1">★(1점)</option>
	                        <option value="0">0점</option>
	                    </select>
	                </div>
	                
	                <div class="form-group">
	                    <label>내용</label>
	                    <textarea class="form-control" rows="10" name="photoContent"></textarea>
	                </div>
	                    
	                <div class="form-group row">
	                    <label for="inputFile" class="col-sm-2 col-form-label"><strong>첨부파일</strong></label>
	                    <div class="col-sm-10">
	                    	<div class="custom-file" id="inputFile">
	                    		<input name="photoFile" type="file" class="custom-file-input" id="customFile">
	                    		<label class="custom-file-label" for="customFile">파일을 선택해주세요</label>
	                    	</div>
	                    </div>
	                </div>
	                                             	            
	            	<div class="titlefoot">
	            		<input type="hidden" name="pcode" value="${product.pcode}">
	                	<button type="button" class="btn btn-default reviewListBtn" onclick="location.href='photoList'">목록</button>
	                	<button type="submit" class="btn btn-default reviewRegistBtn">등록</button>
	            	</div>
	        	</form>
	    	</div>
		</div>
	</div>
</section>