<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
<%-- <script src="${pageContext.request.contextPath}/resources/js/kakao.js"></script>  --%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>



    <section class="login-body">
        <div class="container">
            <div class="row">
             
                <div class="info-title" style="margin-top: 10px ;">
                    <p>로그인</p>
                </div>
                <aside class="col-md-6">

                    <form action="loginForm" method="post" class="box">
                        <div class="form-login">
                            <label for="">ID</label>
                            <input type="text" class="form-control" name="userId"  autocomplete="off" required>
                        </div>

                        <div class="form-login">
                            <label for="">PASSWORD</label>
                            <input type="password" class="form-control"  name="userPw" autocomplete="off" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                        <button type="button" class="btn btn-primary btn-block" onclick="location.href='userForgot'">Forgot Password</button>


                    </form>
                </aside>
                
                

                <aside class="col-md-6" style="text-align: center;">
                    <div class="sub">
                        카카오 로그인으로 회원가입 없이 <br>
                        쉽게 로그인 해보세요 !
                    </div>
            
                        <a id="custom-login-btn" href="javascript:loginWithKakao()" >
                            <img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_wide.png"/></a>

                </aside>
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
    
        //카카오초기화
        Kakao.init('142afd9b0883708f95203d9b9c24ca2b');
        Kakao.isInitialized();
    
        //3.데모버전으로 들어가서 카카오 로그인 코드를 확인
        function loginWithKakao() {
            Kakao.Auth.login({
            	
                success: function (authObj) {
                    console.log(authObj); 
                    
                    Kakao.Auth.setAccessToken(authObj.access_token);
                    getInfo();
                },

                fail: function (err) {
    
                    alert(JSON.stringify(err))
                }
            })
        }
    
        //4.익세스토큰을 발급받고 , 아래 함수를 호출시켜서 사용자정보를 받아옴.
        function getInfo() {
    
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                   
                var email = res.kakao_account.email;
                	console.log(res);
           
                    console.log(email);

                	
                	 location.href='kakaoForm?userId='+email; 
        
                },
                fail: function (error) {
                    alert(
                        '카카오로그인에 실패했습니다 확인하세요 : ' + JSON.stringify(error))
                },
                
    
            })
            
        };
                
        

    </script> 
  
   
 
    

   
    
    
</body>
</html>