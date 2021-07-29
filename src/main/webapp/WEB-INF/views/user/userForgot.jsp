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
    
                        <!-- <form action="userForgotCheck" method="post" > -->
                        <form action="findPw"id="findPw" method="post" >
    
                           
                        <div class="join-group">
                            <label>ID</label>
                            <div class="j-group">
                                <input type="text" autocomplete="off"  class="form-control j-left" placeholder="아이디를 입력하세요" name="userId" id="userId" required>  
                                <button class="btn CheckBtn" type="button" id="idCheck">Check Id</button>
                                <span id="msgId"></span>
                            </div>
                        </div>
                        
    
                            <div class="join-group" style="margin-top:20px; margin-bottom: 20px;">
                                <label>Email</label>
                            <div class="forgot-group">
                                <input type="email" autocomplete="off" id="userEmail" name="userEmail" placeholder="@포함 , 전체 이메일을 입력하세요 ex)abc123@naver.com" class="form-control forgot-control" required> 
                                </div>
                            </div>
                            
                            
                             <button type="submit" id="forgotBtn"  class="btn btn-primary btn-block" >비밀번호찾기</button>
                            
    
                        </form>




				<script>
					//아이디 중복체크
					$("#idCheck")
							.click(
									function() {

										/* var userId =$("#userId").val; */

										var userId = $("#userId").val();

										if (userId == '' || userId.length < 4) {
											$("#userId").focus(); //포커싱 함수
											alert("아이디 형식을 확인하세요");
											return; //함수종료
										}

										$
												.ajax({
													type : "post",
													url : "idCheck",
													contentType : "application/json",
													data : JSON.stringify({
														"userId" : userId
													}),
													success : function(data) {

														if (data == 0) { //사용불가 
															$("#msgId").html("등록되어있지 않은 아이디 입니다 . 다시 입력해주세요");
														

														} else { //사용가능 
															$("#userId").attr("readonly",true);
															$("#msgId").html("등록된 회원입니다 이메일 입력후 인증번호를 발송받으세요");
														}

													},
													error : function(status,
															error) {
														alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");

													}

												})
									});
				</script>
                        
              
                        
                 

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
<!--     
    				<script>
					$("#forgotBtn").click(function() {

						if ($("#userId").attr("readonly") != 'readonly') {
							alert("아이디인증은 필수입니다.");
							$("#userId").focus();
							return;

						} else if ($("#userEmail").val() == '') {
							alert("비밀번호확인을 위한 이메일입력은 필수입니다");
							$("#userEmail").focus();

							return;
						} else {
							$("#findPw").submit();
						}

					})

					//엔터값 처리 (form태그에 keyup이벤트, 엔터값이 아니라면 처리x)
					$("#findPw").keyup(function(event) {
						if (event.keyCode != 13) { //엔터의 키값
							return; //함수 종료
						}

						$("#forgotBtn").click(); //폼검증 함수 호출
					});
				</script>
     -->






