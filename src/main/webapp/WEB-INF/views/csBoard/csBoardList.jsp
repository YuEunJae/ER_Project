<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csBoard.css">
	<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/cookie.js"></script>

	<style>
		.content-view-wrap, .reply-comment {
		    white-space: pre-wrap;
		}
	</style>

	<!-- 본문 제목 -->
    <div class="col-xs-12">
        <div class="content-title">고객지원</div>
    </div>

    <!-- 본문 헤더 -->
    <div class="container">
        <ul class="row col-xs-12 content-header">
            <li class="col-xs-4"><a href="#" id="Notice" data-select=".content-notice-box1">Notice</a></li>
            <li class="col-xs-4"><a href="#" id="FAQ" data-select=".content-notice-box2">FAQ</a></li>
            <li class="col-xs-4"><a href="#" id="QNA" data-select=".content-notice-box3">QNA</a></li>
        </ul>
    </div>

    <!-- 글등록 -->
    <div class="container post-regist hidden2">
        <form action="noticeRegist" method="post" id="registForm" enctype="multipart/form-data">
        
        	<!-- 컨트롤러에 같이 넘겨줘야 하는 데이터 -->
        	<input type="hidden" id="boardWriter" name="" value="${userVO.userId }">
        	
        	<div class="categori" id="boardCategori">
	        	<label>대분류</label><br/>
	        	<select name="faq_MainCategori">
	        		<option value="login" selected>로그인</option>
                    <option value="product">제품</option>
	        		<option value="rental">대여</option>
	        		<option value="review">리뷰</option>
	        	</select>
	            
        	</div>
        	
            <!-- 제목 -->
            <label>제목</label><br/>
            <input type="text" id="boardTitle" name="" placeholder="제목을 입력하세요" autocomplete="off" style="width: 70%;" required><br/>
            <hr/>
            
            <!-- 이미지 업로드 미리보기 -->
            <div class="fileDiv">
			</div>
        	
            <!-- 내용 -->
            <label>내용</label><br/>
            <textarea id="boardContent" name="" class="regist-content" placeholder="내용을 입력하세요" required></textarea><br/>

            <div class="imageBtn">
            	<label for="file0" class="file" >이미지 업로드</label>
                <input type="file" id="file0" name="file[0]" class="btn btn-default btn-upload ">
                <button type="button" id="registBtn" class="btn btn-default btn-signature2">등록</button>
            </div>

        </form>
    </div>

    
    <!-- 게시판 상단 순서, 검색 -->
    <div class="container">
    
    	<form action="csBoardList" method="post" id="listForm">

	        <!-- 순서 -->
	        <div class="list-option">
	            <select name="orderType">
	                <option value="latestOrder" ${orderUtil.orderType eq '' or orderUtil.orderType eq 'latestOrder' ? 'selected' : ''}>최신순</option>
	                <option value="viewOrder" ${orderUtil.orderType eq 'viewOrder' ? 'selected' : '' }>조회순</option>
	            </select>
	        </div>
	
	        <!-- 대분류 -->
	        <div class="list-mainCategori">
	            <select name="listOrder">
	                <option value='' ${orderUtil.listOrder eq '' or OrderUtil.listOrder eq null ? 'selected' : ''}>대분류</option>
	                <option value="login" ${orderUtil.listOrder eq 'login' ? 'selected' : ''}>로그인</option>
	                <option value="product" ${orderUtil.listOrder eq 'product' ? 'selected' : ''}>제품</option>
	                <option value="rental" ${orderUtil.listOrder eq 'rental' ? 'selected' : ''}>대여</option>
                    <option value="review" ${orderUtil.listOrder eq 'review' ? 'selected' : ''}>리뷰</option>
	            </select>
	        </div>
	            
	        <!-- 검색 -->
	        <div class="search">
	            <select name="searchType">
                    <option value=''>검색타입</option>
	                <option value="title" >제목</option>
	                <option value="writer" >작성자</option>
	                <option value="tiwri" >제목+작성자</option>
	            </select>
	
	            <input type="text" name="searchName" placeholder="검색내용">
	            <button type="submit" class="btn btn-default btn-single btn-signature1">검색</button>
	        </div>
	        
    	</form>
    </div>

    <!-- 본문 게시판 1 -->
    <div class="container content-notice-box1 hidden">
        <div class="row col-xs-12 content-notice">
            <div class="content-header">
                <ul>
                    <li class="col-xs-2 col-sm-1">순번</li>
                    <li class="col-xs-3 col-md-6">제목</li>
                    <li class="col-xs-2 col-md-2">작성자</li>
                    <li class="col-xs-3 col-md-2">등록일</li>
                    <li class="col-xs-2 col-md-1">조회수</li>
                </ul>
            </div>
            <div class="content-section">
            	<c:forEach var="list" items="${noticeList }">
	            	<ul>
	                    <li class="col-xs-2 col-sm-1">${list.notice_No }</li>
	                    <li class="col-xs-3 col-md-6">
	                        <a href="#" id="a" onclick="contentView(${list.notice_No})">${list.notice_Title }</a>
	                    </li>
	                    <li class="col-xs-2 col-md-2">${list.notice_Writer }</li>
	                    <li class="col-xs-3 col-md-2">${list.notice_Regdate }</li>
	                    <li class="col-xs-2 col-md-1">${list.notice_View }</li>
	                    <li class="col-xs-12 content-view hidden">
	                    	<c:forEach var="imageList" items="${list.noticeImageList }">
		                        <div class="content-view-img">
		                            <img src="view/${imageList.ni_Path }/${imageList.ni_Name}" alt="이미지">
		                        </div>
	                        </c:forEach>
	                        <div class="content-view-wrap">${list.notice_Content }</div>
	                        <c:if test="${userVO.userId eq 'master123' }">
		                        <div class="content-view-btn">
		                            <button type="button" class="btn btn-default btn-signature1" onclick="location.href='csBoardUpdate?bno=${list.notice_No}'">수정</button>
		                            <button type="button" class="btn btn-default btn-signature2" onclick="deleteList(${list.notice_No});">삭제</button>
		                        </div>
	                        </c:if>
	                    ​</li>
	                </ul>
           		</c:forEach>
            </div>
        </div>

    </div>

    <!-- 본문 게시판 2 -->
    <div class="container content-notice-box2 hidden">
        <div class="row col-xs-12 content-notice">
            <div class="content-header">	
                <ul>
                    <li class="col-xs-2 col-sm-1">순번</li>
                    <li class="col-xs-3 col-md-6">제목</li>
                    <li class="col-xs-2 col-md-2">작성자</li>
                    <li class="col-xs-3 col-md-2">등록일</li>
                    <li class="col-xs-2 col-md-1">조회수</li>
                </ul>
            </div>
            <div class="content-section">
               <c:forEach var="list" items="${faqList }">
                	<ul>
	                    <li class="col-xs-2 col-sm-1">${list.faq_No }</li>
	                    <li class="col-xs-3 col-md-6">
	                        <a href="#" id="a" onclick="contentView(${list.faq_No })">${list.faq_Title }</a>
	                    </li>
	                    <li class="col-xs-2 col-md-2">${list.faq_Writer }</li>
	                    <li class="col-xs-3 col-md-2">${list.faq_Regdate }</li>
	                    <li class="col-xs-2 col-md-1">${list.faq_View }</li>
	                    <li class="col-xs-12 content-view hidden">
		                    <c:forEach var="imageList" items="${list.faqImageList }">
		                        <div class="content-view-img">
		                            <img src="view/${imageList.fi_Path }/${imageList.fi_Name}" alt="이미지">
		                        </div>
		                    </c:forEach>
	                        <div class="content-view-wrap">${list.faq_Content }</div>
	                        <c:if test="${userVO.userId eq 'master123' }">
		                        <div class="content-view-btn">
		                            <button type="button" class="btn btn-default btn-signature1" onclick="location.href='csBoardUpdate?bno=${list.faq_No}'">수정</button>
		                            <button type="button" class="btn btn-default btn-signature2" onclick="deleteList(${list.faq_No});">삭제</button>
		                        </div>
	                        </c:if>
	                    ​</li>
                	</ul>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 본문게시판3 -->
    <div class="container content-notice-box3 hidden">
        <div class="row col-xs-12 content-notice">
            <div class="content-header">
                <ul>
                    <li class="col-xs-2 col-sm-1">순번</li>
                    <li class="col-xs-3 col-md-6">제목</li>
                    <li class="col-xs-2 col-md-2">작성자</li>
                    <li class="col-xs-3 col-md-2">등록일</li>
                    <li class="col-xs-2 col-md-1">조회수</li>
                </ul>
            </div>
            <div class="content-section">
                <c:forEach var="list" items="${qnaList }">
                	<ul>
	                    <li class="col-xs-2 col-sm-1">${list.qna_No }</li>
	                    <li class="col-xs-3 col-md-6">
	                        <a href="#" id="a" onclick="contentView(${list.qna_No }, '${list.qna_Writer }', '${list.qna_Tow }')">
	                         	<c:if test="${list.qna_Tow eq 'secret' }">
			                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
									  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
									</svg>
								</c:if>
	                        	${list.qna_Title }
	                        </a>
	                    </li>
	                    <li class="col-xs-2 col-md-2">${list.qna_Writer }</li>
	                    <li class="col-xs-3 col-md-2">${list.qna_Regdate }</li>
	                    <li class="col-xs-2 col-md-1">${list.qna_View }</li>
	                    <li class="col-xs-12 content-view hidden">
	                        <div class="content-view-wrap">${list.qna_Content }</div>
	                        <div class="content-view-btn">
	                        	<c:if test="${userVO.userId eq list.qna_Writer }">
		                            <button type="button" class="btn btn-default btn-signature1" onclick="location.href='csBoardUpdate?bno=${list.qna_No}'">수정</button>
		                        </c:if>
		                        <c:if test="${userVO.userId eq 'master123' }">
		                            <button type="button" id="btn-reply" class="btn btn-default btn-signature1">답변</button>
		                         </c:if>
		                         <c:if test="${userVO.userId eq list.qna_Writer or userVO.userId eq 'master123' }">
		                            <button type="button" class="btn btn-default btn-signature2" onclick="deleteList(${list.qna_No})">삭제</button>
		                        </c:if>
	                        </div>
	                        <!-- 답변 -->
	                        <c:forEach items="${list.qnaAnswerList }" var="answerList">
		                        <div class="col-xs-12 content-reply">
		                            <div class="reply-id">
		                                <span>${answerList.qa_Writer } : </span>
		                            </div>
		                            <div class="reply-comment">${answerList.qa_Content }</div>
		                        </div>
	                        </c:forEach>
	                        
	                        <!-- 답변 폼 -->
	                        <form action="replyRegist" method="post" class="hidden">
	                            <textarea class="regist-reply" name="qa_Content" placeholder="답변쓰기"></textarea>
	
	                            <div class="btn-right">
	                                <button type="submit" class="btn btn-single btn-signature1">등록</button>
	                            </div>
	                            
	                            <input type="hidden" name="qna_No" value="${list.qna_No }">
	                            <input type="hidden" name="qa_Writer" value="master123">
	                        </form>
	                    ​</li>
                	</ul>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 페이지네이션 -->
    <form action="csBoardList" name="pageForm" method="post">
	    <div class="container content-page">
	        <ul class="paging content-notice-box1 hidden">
	
	            <!-- 이전 -->
	            <c:if test="${noticePage.prev }">
	            	<li class="prev"><a href="#" data-pagenum="${noticePage.startPage - 1}">이전</a></li>
				</c:if>
	
	            <!-- 페이지 -->
	            <c:forEach var="num" begin="${noticePage.startPage }" end="${noticePage.endPage }">
		            <li class="${noticePage.pageNum eq num ? 'active' : '' }">
                        <a href="#" data-pagenum="${num}">${num }</a>
                    </li>
	            </c:forEach>
	
	            <!-- 다음 -->
	            <c:if test="${noticePage.next }">
	            	<li class="next"><a href="#" data-pagenum="${noticePage.endPage + 1}">다음</a></li>
                </c:if>
	            
	        </ul>
	        <ul class="paging content-notice-box2 hidden">
	
	            <!-- 이전 -->
	            <c:if test="${faqPage.prev }">
	            	<li class="prev"><a href="#" data-pagenum="${faqPage.startPage - 1}">이전</a></li>
				</c:if>
	
	            <!-- 페이지 -->
	            <c:forEach var="num" begin="${faqPage.startPage }" end="${faqPage.endPage }">
		            <li class="${faqPage.pageNum eq num ? 'active' : '' }">
                        <a href="#" data-pagenum="${num}">${num }</a>
                    </li>
	            </c:forEach>
	
	            <!-- 다음 -->
	            <c:if test="${faqPage.next }">
	            	<li class="next"><a href="#" data-pagenum="${faqPage.endPage + 1}">다음</a></li>
	            </c:if>
	
	        </ul>
	        <ul class="paging content-notice-box3 hidden">
	
	            <!-- 이전 -->
	            <c:if test="${qnaPage.prev }">
            		<li class="prev"><a href="#">이전</a></li>
            	</c:if>
	
	            <!-- 페이지 -->
	            <c:forEach var="num" begin="${qnaPage.startPage }" end="${qnaPage.endPage }">
		            <li class="${qnaPage.pageNum eq num ? 'active' : '' }">
                        <a href="#" data-pagenum="${num}">${num }</a>
                    </li>
	            </c:forEach>
	
	            <!-- 다음 -->
	            <c:if test="${qnaPage.next }">
            		<li class="next"><a href="#">다음</a></li>
            	</c:if>
	
	        </ul>

            <!-- 글쓰기 -->
            <div class="btn-right">
                <button type="button" class="btn btn-default btn-signature1 btn-single" id="regist">글쓰기</button>
            </div>
            
            <input type="hidden" name="pageNum" value="1">
            <input type="hidden" name="orderType" value="${orderUtil.orderType }">
            <input type="hidden" name="searchType" value="${orderUtil.searchType }">
            <input type="hidden" name="searchName" value="${orderUtil.searchName }">
            <input type="hidden" name="listOrder" value="${orderUtil.listOrder }">
	        
	    </div>
    </form>
    
    <!-- 관리자와 1:1 채팅 -->
    <c:if test="${userVO != null }">
	    <aside class="chatting">
	        <div class="chat-wrap">
	
	            <p>관리자와 1:1 채팅</p>
	
	            <div class="chat"></div>
	            <input type="text" name="chat" id="chat">
	            <button type="button" class="btn btn-default btn-signature1" id="chatBtn">보내기</button>
	        </div>
	    </aside>
    </c:if>
    
    <script src="${pageContext.request.contextPath }/resources/js/csBoardList.js"></script>
    
    <script>
    	userId = "${userVO.userId}";
    	socketPath = "${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/csBoardSocket";
    	cookiePath = "${pageContext.request.contextPath }/";
    	
    	console.log(cookiePath);
    </script>
    
    <script>
	    /* 메시지 처리 */
		$(document).ready( function() {
			
			if(history.state == '' ) return;	
			
	    	var msg = '<c:out value="${msg }" />';
	    	if(msg != ''){
	    		alert(msg);
				// 기존 기록을 삭제하고 새로운 기록을 추가 ( 이렇게 변경된 값은 history.state로 데이터를 확인가능 )
				history.replaceState('', null, null);
	    	}
		});
    </script>
    