<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- <!DOCTYPE html>
 <header class="header-main">
        <div class="container">
            <div class="head-logo">
                <a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/img/logo.png" width="100px" height="80px"></a>


            </div>

            <div class="info-all">
            <c:choose>
            <c:when test="${sessionScope.userVO eq null }">
                <div class="head-info"><a href="${pageContext.request.contextPath }/user/userLogin">Login</a></div>
                <div class="head-info"><a href="${pageContext.request.contextPath }/user/userJoin">Join</a></div>
                <div class="head-info"><a href="${pageContext.request.contextPath }/servicePage/servicePage">Service</a></div>
            </c:when>
            
            <c:otherwise>   
                <div class="head-info"><a href="${pageContext.request.contextPath }/user/userMypage">Mypage</a></div>
                <div class="head-info"><a href="${pageContext.request.contextPath }/servicePage/servicePage">Service</a></div>
                <div class="head-info"><a href="${pageContext.request.contextPath }/user/userLogout">Logout</a></div>
                
            </c:otherwise>
            
            </c:choose>
            </div>
        </div>

    </header> --%>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
     
     <header>   
    
       <div class="s2-header">
      
       <c:choose>
       	<c:when test="${sessionScope.userVO eq null }">
          <a href="${pageContext.request.contextPath }/" class="s2header-logo"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>
          <a href="${pageContext.request.contextPath }/user/userLogin" class="s2header-login">Login</a>
          <a href="${pageContext.request.contextPath }/user/userJoin" class="s2header-join">Join</a>
          <a href="${pageContext.request.contextPath }/servicePage/servicePage" class="s2header-service">Service</a>
        </c:when>
        
        <c:otherwise>
          <a href="${pageContext.request.contextPath }/" class="s2header-logo"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>
          <a href="${pageContext.request.contextPath }/user/userLogout" class="s2header-login">Logout</a>
          <a href="${pageContext.request.contextPath }/servicePage/servicePage" class="s2header-outservice">Service</a>
          <a href="${pageContext.request.contextPath }/user/userMypage" class="s2header-mypage">Mypage</a>
        </c:otherwise>
        
        </c:choose>
        
       </div>
      
    </header> 

 
    