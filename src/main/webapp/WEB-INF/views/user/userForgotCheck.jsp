<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">

      <section class="forgot-body">
        <div class="container">
           
            
                <div class="forgot-form">

                    <div class="info-title" style="margin-top: 10px ;">
                        <p>비밀번호 찾기</p>
                    </div>
    
                    <div class="forgot-wrap">
    
                        <form action="codeCheck" method="post" >
                        <input type="hidden"  name="codeNum" value="<%=request.getParameter("codeNum")%>">
                        <input type="hidden" name="userId" value="<%=request.getParameter("userId")%>">
    
                            <div class="forgot-group" style="margin-bottom:5px;">
                                <label>인증번호</label>
                                    <input type="text" id="emailCode" name="emailCode" autocomplete="off" class="form-control forgot-control" required>  
                            </div>
                            <span id="msgCode"></span>
    
                          
                            
                             <button type="submit" id="checkFind" class="btn btn-primary btn-block" style="margin-top:30px;">인증하기</button>
                            
                            
    
                        </form>


                </div>
                </div>
                </div>
                </section>
                
     <script>
    
    	window.onload = function() {
    		var msg = "${msg}";
    		if(msg != "") {
    			alert(msg);
    		}
    		
    	}
    	
    </script>
    
    <script>
    
    var emailCode =document.getElementById("emailCode");
    var msgCode = document.getElementById("msgCode");
    
    emailCode.onkeyup = function(){
    	
    	if( emailCode.value.length > 6){ //6자리 미만일때!
    		
    		emailCode.style.borderColor="red";
    		msgCode.innerHTML="인증번호는 6자리 입니다";
    		msgCode.style.color="red";
    		
    	} else if(emailCode.value.length ==6 ){
    		
    		emailCode.style.borderColor = "cornflowerblue";
    		msgCode.innerHTML = "올바른 인증번호양식입니다";      
    		msgCode.style.color="cornflowerblue";
    		
    		
    	} 
    	
    }
    
    
   
    
    </script>
                
                
