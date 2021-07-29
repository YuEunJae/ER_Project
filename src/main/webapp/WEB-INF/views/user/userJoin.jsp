<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">



    <section class="login-big-group">
        <div class="container">
            <div class="row" style="margin-bottom:15px;">
                <div class="col-lg-6 col-md-6 col-sm-8 col-xs-8 join-form">

                    <div class="info-title">
                        <p>회원가입</p>
                    </div>
                    
                    <form class="join" action="joinForm" id="joinForm" method="post" >
                    
                        <div class="join-group">
                            <label>ID</label>
                            <div class="j-group">
                                <input type="text" autocomplete="off" class="form-control j-left" placeholder="4~12 길이의 영소문자를 이용한 아이디를 입력하세요" name=userId id="userId" required>  
                                <button class="btn CheckBtn" type="button" id="idCheck">Check ID</button>
                            </div>
                            <span id="msgId"></span>
                        </div>
                        
                        
                        

                        <div class="join-group">
                            <label>Password</label>
                            <input type="password" autocomplete="off" class="form-control" placeholder="8~16 길이의 영소문자와 숫자를 이용한 패스워드를 입력하세요" name="userPw" id="userPw" style="margin-bottom: 5px;" required> 
                        </div>
                        <span id="msgPw"></span>

                        <div class="join-group">
                            <label>Password Check</label>
                            <input type="password" autocomplete="off" class="form-control" placeholder="" name="pwCheck" id="pwCheck" style="margin-bottom: 5px;" required> 
                        </div>
                        <span id="msgPw-c"></span>

                        <div class="join-group">
                            <label>Name</label>
                            <input type="text" autocomplete="off"  class="form-control"  name="userName" id="userName"> 
                        </div>

                        <div class="join-group">
                          <label>Phone number</label>
                            <input type="text" autocomplete="off" class="form-control" name="userPhone" id="userPhone" placeholder="010XXXXXXXX">
                        </div>

                        <div class="join-group">
                            <label for="email">Email</label><br/>
                            <div class="email-group">
                                <input type="text" autocomplete="off" class="form-control email-left" name="userEmail1" id="userEmail1">
                                <select class="form-control email-right" name="userEmail2" id="userEmail2" >
                                
                                    <option>@naver.com</option>
                                    <option>@daum.net</option>
                                    <option>@gmail.com</option>
                                    <option>@hanmail.com</option>
                            
                                </select>
                                  
                            </div>
                            
                        </div>
                        
                        

                        <div class="join-group">
                            <label>Address</label>
                            <div class="j-group">
                                <input type="text" class="form-control j-left" name="addrZipNum" id="addrZipNum" placeholder="우편번호">
                                <button type="button" class="btn CheckBtn"  onclick="goPopup()">Find Address</button>
                            </div>
                            <input type="text" class="form-control addr-top" id ="addrBasic" name="addrBasic" placeholder="기본주소">
                            <input type="text" class="form-control " name="addrDetail" id="addrDetail" placeholder="상세주소">

                          </div>
  
                        <div class="join-btn" >
                            <button type="submit" class="btn btn-block joinBtn" id="joinBtn">join</button>
                           
                        </div>

                        </div>

                        
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
        /*아이디중복검사*/
        var id = document.getElementById("userId");
        id.onkeyup = function () {
            /*자바스크립트의 정규표현식 입니다*/
            /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반환*/
            var regex = /^[A-Za-z0-9+]{4,12}$/;
            if (regex.test(document.getElementById("userId").value)) {
                id.style.borderColor = "cornflowerblue";
                document.getElementById("msgId").innerHTML = "아이디 중복검사는 필수입니다";
                document.getElementById("msgId").style.color="cornflowerblue";
               
            } else{
                   if(id.value.length >=12) {
                       id.style.borderColor = "red";
                       document.getElementById("msgId").innerHTML = "아이디는 최대 12자입니다"; 
                       document.getElementById("msgId").style.color="red";             

                   } else if (id.value.length <4) {
                    id.style.borderColor = "red";
                       document.getElementById("msgId").innerHTML = "아이디는 최소 4자입니다";        
                       document.getElementById("msgId").style.color="red";  
                   }
                }
            }

            //비밀번호 검사

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
                        msgPw.innerHTML = "비밀번호는 최소 8자입니다";
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
    
    <script>
		//아이디 중복체크
		$("#idCheck").click(function() {
			
			var userId = $("#userId").val();
			
			if( userId == '' || userId.length < 4 ) {
				$("#userId").focus(); //포커싱 함수
				alert("아이디 형식을 확인하세요");
				return; //함수종료
			}
			
			
			
			$.ajax({
				type: "post",
				url : "idCheck",
				contentType: "application/json",
				data : JSON.stringify({"userId" : userId}),
				success : function(data) {
					
					if(data == 0) { //사용가능
						$("#userId").attr("readonly", true); 
						$("#msgId").html("사용가능한 아이디 입니다");
					} else { //중복
						$("#msgId").html("중복된 아이디입니다");
					}
					
				},
				error : function(status, error) {
					alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
				}
				
			})
		});
		
		
		//폼검증
		$("#joinBtn").click(function() {

			if( $("#userId").attr("readonly") != 'readonly' ) { 
				alert("아이디 중복검사는 필수 입니다.");
				$("#userId").focus();
				return; //종료~
				
				
			} else if( $("#userPw").val() == '' || ($("#userPw").val() != $("#pwCheck").val() )) {
				alert("비밀번호를 확인하세요"); //비번확인
				$("#userPw").focus();
				return;
			} else if( $("#userName").val() == '' ) {
				alert("이름은 필수입니다"); //이름확인
				$("#userName").focus();
				return;
				
			} else if( $("userPhone").val() ==''){
				alert("전화번호는 필수입니다"); //전번확인
				$("userPhone").focus();
				return;
				
			} else if($("userEmail1").val()== '') {
				alert("이메일은 필수입니다."); //이메일확인 
				$("userEmail1").focus();
				return;
				
			} else {
				$("#joinForm").submit(); //전송
			}
			
		})
		

		//엔터값 처리 (form태그에 keyup이벤트, 엔터값이 아니라면 처리x)
		$("#joinForm").keyup(function(event) {
			if(event.keyCode != 13) { //엔터의 키값
				return; //함수 종료
			}
			
			$("#joinBtn").click(); //폼검증 함수 호출
		});
	</script>
    
    
    
    
    <script>
	//주소 팝업
	function goPopup() {
		var pop = window.open("${pageContext.request.contextPath}/resources/pop/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			document.getElementById("addrBasic").value = roadAddrPart1;

			document.getElementById("addrDetail").value = addrDetail;

			document.getElementById("addrZipNum").value = zipNo;
	}
</script>

    
   