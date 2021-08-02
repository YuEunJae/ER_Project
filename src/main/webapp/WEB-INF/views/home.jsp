<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
 
  
  
  <section class="one">
       
           <div class="index1">
              <div class="oneMain">
                  <div class="oneTitle">
                    <h3>아무거나 타지말고</h3>
                    <h3>비교하고 타자! </h3>
                  </div>
 
                  <div class="oneLogo" >
                    <h2><img src="${pageContext.request.contextPath}/resources/img/logo2.png" alt=""></h2>

                    <div class="wrapBtn">
                        <button class="button"><span class="glyphicon glyphicon-search gly"></span>비교하기</button>
                        <button class="button"><span class="glyphicon glyphicon-cloud gly"></span>리뷰쓰기</button>
                        <button class="button" onclick="location.href='product/kangarooProductList'"><span class="glyphicon glyphicon-tags gly"></span>제품상세</button>
                      </div>
            
                  </div>

              </div>
              
                <div class="twoMain" style="width: 40%; float: right;">
             
                
                <div id="app">
                  <input type="checkbox" id="toggle" name="toggle" />
                  
                  <div class="background">
                    <div class="bg-content">
                      <div class="drip"></div>
                      <div class="drip"></div>
                      <div class="drip"></div>
                    </div>
                    <div class="bg-description">
                      <div class="drip"></div>
                      <div class="drip"></div>
                      <div class="drip"></div>
                    </div>
                  </div>
                  
                  <div class="labelcontent" >
    
                    <header class="kNum-header"  style="font-style: italic; font-size: 1em;">현재 대여가능 킥보드 수 </header>
                    
                    <label class="button kNumBtn" id="kickNumBtn" for="toggle" style="color: cornflowerblue; margin:0;"></label>
                  </div>
                  <div class="description">
                    <header class="kNum-header" style="font-style: italic; font-size: 1.3em;">
                      <input type="text" value="" id="kickNum" style="background-color:cornflowerblue; text-align:center; border:none">
                    </header>
                  
                  </div>
                  
                </div>

              </div>

            </div>

        </div>
    </section>
    
    <script>
    
    $("#kickNumBtn").click(function(){
    	
    
    	var kickNum = $("#kickNum");
    	
    	$.ajax({
    		type:"get",
    		url:"kickNum",
    		dataType: "json",
    		success:function(data){
    			
    			kickNum.val(data);
    			
    		},
    		error : function(status , error){
    			
    			console.log(staus, error);
    		}
    		
    	})
    });
    
    
    </script>

    <section class="two">
        
        <div class="blob">
            <svg xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 310 350">
            <path d="M156.4,339.5c31.8-2.5,59.4-26.8,80.2-48.5c28.3-29.5,40.5-47,56.1-85.1c14-34.3,20.7-75.6,2.3-111  c-18.1-34.8-55.7-58-90.4-72.3c-11.7-4.8-24.1-8.8-36.8-11.5l-0.9-0.9l-0.6,0.6c-27.7-5.8-56.6-6-82.4,3c-38.8,13.6-64,48.8-66.8,90.3c-3,43.9,17.8,88.3,33.7,128.8c5.3,13.5,10.4,27.1,14.9,40.9C77.5,309.9,111,343,156.4,339.5z"/>
            </svg>
          </div>
        <div class="index2-content">

                  <h1>어디서나<br>쉽고 빠르게 </h1>
    
              <div class="blob2"> 
                <div class="flip-card-container">
                    <div class="flip-card">
                  
                     <div class="card-front">
                        
                          <div class="img-bg"></div>
                          <img src="${pageContext.request.contextPath }/resources/img/kickal.png" >
                   
                      </div> 
              
                  </div>
              </div>


        </div>
        
        
      <!--기존 인덱스2와 붙이기 -->
            <div class="container index-two">
                <div class="row">
                    
                    <div class="pre">
                        <div>Let's enjoy kangaroo !</div>
                        <p>캥거루는 실제 사용자들의 사용리뷰로 더욱 만족스런 소비를 도와드립니다</p>
                    </div>
                    
                    
                    <div class="main-pre">
                        <div><img src="${pageContext.request.contextPath }/resources/img/what.png" width=300px height="250px" alt=""></div>
                        <div class="pre-title">검색하고</div>
                        <div class="pre-con">나와 가까운 킥보드를 검색해보세요</div>
                    </div>
                    
                    <div class="main-pre">
                        <div><img src="${pageContext.request.contextPath }/resources/img/smile.png" width="300px" height="250px" alt=""></div>
                        <div class="pre-title">비교하고</div>
                        <div class="pre-con">킥보드의 가격, 성능등을 비교해보세요</div>
                    </div>
                    
                    <div class="main-pre">
                        <div class="pre-img"><img src="${pageContext.request.contextPath }/resources/img/good.png" width="280px" height="250px" alt=""></div>
                        <div class="pre-title">
                            <span class="hig">리뷰쓰고</span></div>
                        <div class="pre-con">리뷰를 작성하고 포인트를 받아가세요</div>
                    </div>
                    
                    
                </div>
               
            </div>
  
        
    </section>

  <div class=""style="width: 100%; height: 150px; background-color: #6495ed;">
	<div class=""><p style="color: white; text-align: center; font-size: 3em; font-style: italic;"><br>무엇이든 물어보세요</p>
		<p style="color: white; text-align: center; font-size: 1.5em; font-style: italic; margin-top: -8px;">1:1문의, 자주하는질문등을 통해 여러분의 궁금증을 해결해드립니다</p>
	</div>
 </div>

<section class="threeB">
      
        <div class="man">
            <div class="manhead"></div>
            <div class="manbody"></div>
            <div class="manfeet">
              <div class="manfoot"></div>
              <div class="manfoot"></div>
            </div>
          </div>

          <div>
            <div class="wrapBtn">
                <button class="button" onclick="location.href='${pageContext.request.contextPath }/Notice'"><span class=""></span>Notice</button>
                <button class="button" onclick="location.href='${pageContext.request.contextPath }/FAQ'"><span class=""></span>FaQ</button>
                <button class="button" onclick="location.href='${pageContext.request.contextPath }/QNA'"><span class=""></span>QnA</button>
              </div>
          </div>
       
    
        </div>
    
   
        


      
   </section>




    <!--글자 생성 js!! + 판움직이기 !-->
    <script>
    
        
        $(".hover").mouseleave( //마우스떠나면 
            
        function () {
            
            $(this).removeClass("hover");
        }
        );

    </script>
       
        </section>