<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!--최서익 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/servicePage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fullpage.min.css">
    <script src="${pageContext.request.contextPath }/resources/js/fullpage.min.js"></script>
	<!--최서익 -->

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

			<button id="btn1" value="1">버튼1</button>
			<button id="btn2" value="2">버튼2</button>
			<button id="btn3" value="3">버튼3</button>


			<!-- 채팅 -->
			<div class="s4-bottom">
				<div class="s4-title">채팅</div>
				<div class="s4-content" id="messages"></div>
				<!-- 세션아이디 -->
				<input type="text" id="sender" value="${userId}" style="display: none;">
				<input type="text" id="bno" value="2" style="display: none;" >

				<div class="s4-input">
					<input type="text" id="messageinput" class="s4-mesege"
						onkeyup="if(window.event.keyCode==13){send()}" maxlength='20'/>
					<button id="s4-btn" onclick="send();">전송</button>
				</div>

			</div>




<!-- websocket javascript -->
  <script>
  
        var ws;
        var messages = document.getElementById("messages");
        var mesege = document.querySelector("#messageinput");
        var bno = document.getElementById("bno").value;
       
        var btn1 = document.querySelector("#btn1");
        var btn2 = document.querySelector("#btn2");
        var btn3 = document.querySelector("#btn3");
        
        
        
        btn1.onclick = function() {
        	bno = 1;
        	openSocket();
        } 
        
        btn2.onclick = function() {
        	bno = 2;
        	openSocket();
        }
        
        btn3.onclick = function() {
        	bno = 3;
        	openSocket();
        }
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                /* writeResponse("WebSocket is already opened."); */
                return;
            }
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://localhost:8181/erproject/echo/" + bno);
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
                writeResponse("대화 종료");
            }
            
        }
        
        
        
        function send(){
        	
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value+","+bno;
            ws.send(text);
            text = "";
            messageinput.value = "";
            messages.scrollTop = messages.scrollHeight;
        }
        
        function writeResponse(text){
        	
         	var text2 = text;
         	
			if (text2.indexOf("<나>") == 0) {
	            
				messages.innerHTML += '<br/><div class="s4-chat1">'+text+'</div>';
	            messages.scrollTop = messages.scrollHeight;
	            
			}
			
			else {
				
				messages.innerHTML += '<br/><div class="s4-chat2">'+text+'</div>';
	            messages.scrollTop = messages.scrollHeight;
         	}
			
			

    
        }
       


        
  </script>





</body>
</html>