<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/dongyeon.css">
<style>
.selected {
	border: 1px solid red;
}
</style>
</head>

<section class="sect-main">
	<div class="container" style="margin-bottom: 75px;">
		<div class="row">
			<div class="write-wrap">
				<div class="titlebox">
					<p>포토리뷰</p>
				</div>
			</div>
		</div>
		<div class="row product-list-wrap">
			<div class="container product-list">
				<div class="row photo">
			
					<c:forEach var="productInfo" items="${productList }">
		
						  <div class="col-md-3 col-sm-6">
						    <div class='thumbnail photo-image ${productInfo.pcode == pcode ? "selected" : ""}' data-pcode="${productInfo.pcode}" onclick="location.href='photoList?pcode=${productInfo.pcode}'">
						      <img src="${pageContext.request.contextPath }/resources/img/productimg/${productInfo.pimg1}" >
						      <div class="caption">
						        <p>${productInfo.pname}</p>
						      </div>
						    </div>
						  </div>
					</c:forEach>
				</div>	
			</div>
			<hr />
		</div>

	
		<div class="row photo-review-list">
			<ul class="media-list">

				<c:forEach var="item" items="${list}" >
					<div class="media col-md-6 col-sm-12">
						<div class="review-item">
							<div class="media-left media-middle photo-image" >
								<img class="media-object" src="view/photoReview/${item.photoImage}" onerror="this.src = '${pageContext.request.contextPath }/resources/img/Noimg.png'" />
							</div>
							
							<div class="media-body">
								<div class="photoBno">${item.created}</div>
								<h4 class="media-heading photo-title ">${item.photoTitle}</h4>
								<div class="photoWriter">작성자 : ${item.photoWriter}</div>
								<div class="photoContent ">${item.photoContent}</div>
								<div class="photoStar">					
									<c:choose>
										<c:when test="${item.photoStar == 5 }">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</c:when>
										
										<c:when test="${item.photoStar == 4 }">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
										</c:when>
										
										<c:when test="${item.photoStar == 3 }">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
										</c:when>
										
										<c:when test="${item.photoStar ==2 }">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
										</c:when>
										
										<c:otherwise>
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
											
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
											<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					
				</c:forEach>
			
			</ul>
		</div>
		
		<!-- 글쓰기 -->
		<div class="btn-right btn-regist">
			<form action="writeReviewRegist" method="GET">
				<input type="hidden" name="pcode" value="${pcode }" id="selected-pcode">
				<button type="submit" class="btn btn-signature2" id="regist">글쓰기</button>
			</form>
		</div>
	</div>

</section>


