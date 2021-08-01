<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error Page</title>

	 <script src="https://www.littlesnippets.net/css/codepen-result.css"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
    
     <!-- 부트스트랩 js를 사용하기 위해서 jquery라이브러리 참조 -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
      <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
 
     <!-- 부트스트랩 js참조 -->
     <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
     <!-- 제이쿼리 -->
     <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>

	<style>
        .errorPage {
            text-align: center;
        }

        .error-title {
            font-size: 52px;
            color: cornflowerblue;
        }
        
        .btn-signature1 {
		    text-align: center;
		    color: white;
		    background-color: cornflowerblue;
		    border: none;
		}
		
		.btn-signature2 {
		    text-align: center;
		
		    color: white;
		    background-color: rgb(171, 188, 227);
		    border: none;
		}

    </style>
    
</head>
<body>

	<div class="container">
	        <div class="row errorPage">
	            <div class="xol-xs-12">
	                <div class="errorImg">
	                    <img src="${pageContext.request.contextPath }/resources/img/errorImage.png">
	                </div>
	
	                <div class="errorText">
	                    <p class="error-title">잘못된 접근 입니다.</p>
	                    <p class="error-content">요청하신 페이지가 사라졌거나, 잘못된 경로를 요청 하셨어요 :)</p>
	                </div>
	
	                <div class="errorBtn">
	                    <button type="button" class="btn btn-default btn-signature1" id="btnHome">홈</button>
	                    <button type="button" class="btn btn-default btn-signature2" id="btnPrev">이전</button>
	
	                </div>
	                
	            </div>
	        </div>
	    </div>
	
</body>
	
	<script>
		var contextPath = "${pageContext.request.contextPath}/";
	
		$("#btnHome").click(function() {
			location.href=contextPath;
		});
		
		$("#btnPrev").click(function() {
			history.go(-1);
		});
	</script>

</html>