<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hyungki.css">
</head>

<!-- 후기 수정 페이지 -->
    <section class="sect-main">
        <div class="container" style="margin-bottom: 75px;">
            <div class="row">
                <div class="write-wrap">
                        <div class="titlebox">
                            <p>Review Page</p>
                        </div>
                        
                        <form action="reviewUpdate" method="post">
                        	<input type="hidden" id="pcode" name="pcode" value="${vo.pcode }">
                            <div>
                                <label>작성 날짜:  </label>
                                <fmt:formatDate value="${vo.updatedate }" pattern="yyyy년 MM월 dd일"/>
                            </div>   
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" name='rno' value="${vo.rno }" readonly>
                            </div>
                            <div class="form-group">
                                <label>작성자(회원ID)</label>
                                <input class="form-control" name='writer' value="${vo.writer }" readonly>
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name='title' value="${vo.title }">
                            </div>
                            <div class="form-group">
                                <label>별점</label>
                                <select class="sel-star form-control" name="star"><!-- 삼항연산자 사용해서 selected 적용하기 -->
                                    <option value="5" ${vo.star == 5 ? 'selected' : '' }>★★★★★(5점)</option>
									<option value="4" ${vo.star == 4 ? 'selected' : '' }>★★★★☆(4점)</option>
									<option value="3" ${vo.star == 3 ? 'selected' : '' }>★★★☆☆(3점)</option>
									<option value="2" ${vo.star == 2 ? 'selected' : '' }>★★☆☆☆(2점)</option>
									<option value="1" ${vo.star == 1 ? 'selected' : '' }>★☆☆☆☆(1점)</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name='content' >${vo.content }</textarea>
                            </div>
                            
							<div class="modi-wrap">
								<c:if test="${sessionScope.userVO.userId == vo.writer }">
                            	<button type="submit" class="btn btn-default reviewModiSaveBtn">저장</button>
                            	<%-- <button type="button" class="btn btn-default reviewModiListBtn" onclick="location.href='productMain?pcode=${vo.pcode}&pnScroll=true'">목록</button> --%>
                            	<button type="button" class="btn btn-default reviewModiDelBtn" onclick="location.href='reviewDelete?pcode=${vo.pcode}&rno=${vo.rno}' " >삭제</button>
                    			</c:if>
                    			<c:if test="${sessionScope.userVO.userId != vo.writer }">
                    			<button type="button" class="btn btn-default reviewModiListBtn" onclick="location.href='productMain?pcode=${vo.pcode}&pnScroll=true'">목록</button>
                    			</c:if>
							</div>
                    
                    </form>
                                    
                </div>
            </div>
        </div>
        </section>

        