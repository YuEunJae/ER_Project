<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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

    </header>


    

 
    