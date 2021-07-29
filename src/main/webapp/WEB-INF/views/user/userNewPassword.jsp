<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">

      <section class="forgot-body">
        <div class="container">
           
             
                <div class="forgot-form">

                    <div class="info-title" style="margin-top: 10px ;">
                        <p>새 비밀번호 설정</p>
                    </div>
    
                    <div class="forgot-wrap">
    
                        <form action="pwUpdate" method="post" >
                        
                        <input type="hidden" name="userId" value="<%=request.getParameter("userId")%>">
                            <div class="forgot-group">
                                <label>새 비밀번호</label>
                                    <input type="password" id="userPw" name="userPw" autocomplete="off" placeholder="8~16 길이의 영소문자와 숫자를 이용한 새 패스워드를 입력하세요" class="form-control forgot-control" required>  
                            </div>
                             <span id="msgPw"></span>
    
                            <div class="forgot-group"  style="margin-top:30px;">
                                <label>새 비밀번호 확인</label>
                                <input type="password" id="pwCheck" name="pwCheck" autocomplete="off" class="form-control forgot-control" required> 
                            </div>
                            <span id="msgPw-c"></span>
                            
                            
                             <button type="submit" class="btn btn-primary btn-block" style="margin-top:20px;">비밀번호변경</button>
                            
    
                        </form>


                </div>
                </div>
                </div>
                </section>
                
                <script>
                
                var pw = document.getElementById("userPw");
                var msgPw =document.getElementById("msgPw");
                    pw.onkeyup = function () {
                    	
                    	var regex = /^[A-Za-z0-9+]{8,16}$/;
                        if (regex.test(pw.value)) {
                            pw.style.borderColor = "cornflowerblue";
                            msgPw.innerHTML = "사용가능한 패스워드입니다";
                            msgPw.style.color="cornflowerblue";
                        } else {
                            if(pw.value.length < 8) {
                                pw.style.borderColor = "red";
                                msgPw.style.color="red";
                                msgPw.innerHTML = "비밀번호는 대문자로 시작하며 최소 9자입니다";
                            } else {
                                pw.style.borderColor = "red";
                                msgPw.style.color="red";
                                msgPw.innerHTML = "비밀번호는 최대 16자입니다";
                            }
                        }
                    }
                   //checkPw 확인 
                    var pwCheck = document.getElementById("pwCheck");
                    
                    pwCheck.onkeyup = function () {
                    	var regex = /^[A-Za-z0-9+]{8,16}$/;
                        if (pwCheck.value == document.getElementById("userPw").value) {
                            pwCheck.style.borderColor = "cornflowerblue";
                            document.getElementById("msgPw-c").style.color="cornflowerblue";
                            document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
                        } else {
                            pwCheck.style.borderColor = "red";
                            document.getElementById("msgPw-c").style.color="red";
                            document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치하지않습니다";
                        }
                    }
                    
                    
            </script>
                
                
                
              
                
                
                