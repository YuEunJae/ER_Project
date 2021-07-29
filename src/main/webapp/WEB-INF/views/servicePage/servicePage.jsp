<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

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
	

  <div id="fullpage">
    <!-- 첫번째 화면 -->
    <div class="section servicepage-s1">
    
          <div class="s1-header">
          <a href="" class="s1header-logo"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt=""></a>
          <a href="${pageContext.request.contextPath }/user/userLogin" class="s1header-login">Login</a>
          <a href="${pageContext.request.contextPath }/user/userJoin" class="s1header-join">Join</a>
          <a href="${pageContext.request.contextPath }/user/userMypage" class="s1header-mypage">Mypage</a>
      </div>


      
      <div class="s1-pp">
        <p class="s1-p">Kangaroo</p>
        <p class="s1-p2">Electric scooter</p>
      </div>

    </div>
    
    <!-- 두번째 화면 -->
    <div class="section servicepage-s3">
       
        <div class="s3-top">
          <strong>how to use</strong>
        </div>

        <div class="s3-img">
          <img src="${pageContext.request.contextPath }/resources/img/use1.png">
          <div class="s3-content">
            <strong>전동킥보드 찾고</strong>
            <p>가까운 곳에 있는 킥보드를 찾아요</p>
          </div>
        </div>

        <div class="s3-img">
          <img src="${pageContext.request.contextPath }/resources/img/use2.png">
          <div class="s3-content">
            <strong>쉽게 타고</strong>
            <p>안전하고 빠르게 목적지로 이동해요</p>
          </div>
        </div>

        <div class="s3-img">
          <img src="${pageContext.request.contextPath }/resources/img/use3.png">
          <div class="s3-content">
            <strong>주차하고</strong>
            <p>적당한 위치에 주차하고 반납해주세요</p>
          </div>
        </div>


    </div>
    
    <!-- 세번째 화면 -->
    <div class="section servicepage-s2">
      
    <div class="s2-management">

        <div class="s2-top">
          <strong>Believe in kangaroo</strong><br/>
        </div>

        <div class="s2-middle">
          
          <div class="s2-img">
            <img src="${pageContext.request.contextPath }/resources/img/manage1.jpg">
            <div>
              <p class="s2-p1"> 체계적인 관리</p>
              <p class="s2-p2"> 매일 킥보드를 수거해서 상태를 정검하고 가장 타기 좋은 상태로 만듭니다.</p>
            </div>
          </div>

          <div class="s2-img">
            <img src="${pageContext.request.contextPath }/resources/img/manage2.jpg">
            <div>
              <p class="s2-p1"> 꼼꼼한 정비</p>
              <p class="s2-p2"> 라이더의 안전과 최고의 성능을 위해 전문가들이 철저하게 관리합니다.</p>
            </div>
          </div>

          <div class="s2-img">
            <img src="${pageContext.request.contextPath }/resources/img/manage3.jpg">
            <div>
              <p class="s2-p1"> 스마트한 배치</p>
              <p class="s2-p2"> 데이터 분석을 통해 라이더가 가장 많이 타는 곳에 킥보드를 배치합니다.</p>
            </div>
          </div>



        </div>
  

    </div>

    </div>
    
    <!-- 네번째 화면 -->
    <div class="section servicepage-s4">
      
      <div class="s4-top">
        <strong class="s4-strong">Safety Rules</strong>
      </div>

         <div class="s4-middle">

            <div class="s4-p">
              <p>1. 헬멧 착용하기</p>
            </div>

            <div class="s4-p">
              <p>2. 운전면허 필수 </p>
            </div>

            <div class="s4-p">
              <p>3. 음주운전 금지</p>
            </div>

            <div class="s4-p">
              <p>4. 인도주행 금지</p>
            </div>

            <div class="s4-p">
              <p>5. 교통법규 준수</p>
            </div>

            <div class="s4-p">
              <p>6. 바른주차</p>
            </div>

            <div class="s4-p">
              <p>7. 보행자 배려</p>
            </div>

            <div class="s4-p">
              <p>8. 다인승 금지</p>
            </div>

            <div class="s4-p">
              <p>9. 도로상태 확인</p>
            </div>

            <div class="s4-p">
              <p>10. 주행전 안전확인</p>
            </div>
        </div>


	
      <div>

      </div>
    </div>
    
    <!-- 다섯번째 화면 -->
    <div class="section servicepage-s5">

      <div class="s5-top">
          <strong>graph</strong>
      </div>
      
      <div class="s5-chart2">
    
      	<div>#점유율</div>
    
        <div class="chart-div">
            <canvas id="pieChartCanvas" width="300px" height="300px"></canvas>
            <div id='legend-div' class="legend-div"></div>
        </div>
      </div>
      
      <div class="s5-chart1">
        <canvas id="myChart" style="height:30vh; width:50vw"></canvas>
      </div>

    </div>

		<div class="section servicepage-s7">
			<div class="s7-title" id="s7-title">
				<strong>communication</strong>
			</div>
			
			<div class="s4-btn2" id="s4-btn2">
				<button id="s7btn1" value="1">자유채팅방</button>
				<button id="s7btn2" value="2">후기채팅방</button>
				<button id="s7btn3" value="3">이용채팅방</button>
			</div>


			
			<!-- 채팅 -->
			<div class="s4-bottom" id="s4-bottom" >
				<button id="s4-close">채팅방 나가기</button>
				<div class="s4-title" id="s4-title">채팅</div>
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

		</div>




		<!-- 마지막 화면 -->
    <div class="section servicepage-s6">
      <p class="s6-p">Kangaroo Partner</p>
      <div class="s6-img">
        <img src="${pageContext.request.contextPath }/resources/img/Sponsor.png">
      </div>
    </div>


</div>


<!-- websocket javascript -->
  <script>
  
        var ws;
        var messages = document.getElementById("messages");
        var mesege = document.querySelector("#messageinput");
        var bno = document.getElementById("bno").value;
       
        var btn1 = document.querySelector("#s7btn1");
        var btn2 = document.querySelector("#s7btn2");
        var btn3 = document.querySelector("#s7btn3");
        
        var s4close = document.getElementById("s4-close");
        
        
        s4close.onclick = function() {
        	
        	while ( messages.hasChildNodes() ) {
        		messages.removeChild( messages.firstChild );
        		}

        	
        	
        	closeSoket();
        	document.getElementById("s7-title").style.display = "block";
        	document.getElementById("s4-btn2").style.display = "block";
        	document.getElementById("s4-bottom").style.display = "none";
        }
        
        btn1.onclick = function() {
        	bno = 1;
        	document.getElementById("s4-title").innerHTML = "자유채팅방";
        	document.getElementById("s7-title").style.display = "none";
        	document.getElementById("s4-btn2").style.display = "none";
        	document.getElementById("s4-bottom").style.display = "inline-block";
        	document.getElementById("s4-bottom").style.opacity = "1";
        	openSocket();
        } 
        
        btn2.onclick = function() {
        	bno = 2;
        	document.getElementById("s4-title").innerHTML = "후기채팅방";
        	document.getElementById("s7-title").style.display = "none";
        	document.getElementById("s4-btn2").style.display = "none";
        	document.getElementById("s4-bottom").style.display = "inline-block";
        	document.getElementById("s4-bottom").style.opacity = "1";
        	openSocket();
        }
        
        btn3.onclick = function() {
        	bno = 3;
        	document.getElementById("s4-title").innerHTML = "이용채팅방";
        	document.getElementById("s7-title").style.display = "none";
        	document.getElementById("s4-btn2").style.display = "none";
        	document.getElementById("s4-bottom").style.display = "inline-block";
        	document.getElementById("s4-bottom").style.opacity = "1";
        	openSocket();
        }
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                /* writeResponse("WebSocket is already opened."); */
                return;
            }
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/echo/" + bno);
            
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
       

       function closeSoket() {
    	   ws.close();
       }
        
  </script>


<!-- 풀페이지 -->
<script>
  
  new fullpage('#fullpage', {
    licenseKey: 'OPEN-SOURCE-GPLV3-LICENSE',
    sectionsColor: ['cornflowerblue', 'white', 'white', '#fff'],
    navigation: true, 
    navigationTooltips: ['Section 1', 'Section 2', 'Section 3', 'Section 4', 'Section 5', 'Section 6', 'Section 7']
  });



</script>

<!-- 그래프1 -->
<script>
  var ctx = document.getElementById('myChart');
  var myChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일','일요일'],
          datasets: [{
              label: '# 일별사용량',
              data: [${Mon}, ${Tue}, ${Wed}, ${Thu}, ${Fri}, ${Sat}, ${Sun}],
              backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 3)',
                  'rgba(255, 159, 64, 5)'
              ],
              borderWidth: 2
          }]
      },
      options: {
          responsive: false,
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          },
      }
  });
</script>

<!-- 그래프2 -->
<script>
  window.onload = function () {
  pieChartDraw();
  document.getElementById('legend-div').innerHTML = window.pieChart.generateLegend();
    }

	let pieChartData = {
	  labels: ['Xiaomi', 'Nio', 'Switch', 'Roku', 'Wing'],
	  datasets: [{
	      data: [${Xiaomi}, ${Nio}, ${Switch}, ${Roku}, ${Wing}],
	      backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)']
	  }] 
	};

let pieChartDraw = function () {
  let ctx = document.getElementById('pieChartCanvas').getContext('2d');
  
  window.pieChart = new Chart(ctx, {
      type: 'pie',
      data: pieChartData,
      options: {
          responsive: false,
          legend: {
              display: false
          },
          legendCallback: customLegend
      }
  });
};

let customLegend = function (chart) {
  let ul = document.createElement('ul');
  let color = chart.data.datasets[0].backgroundColor;

  chart.data.labels.forEach(function (label, index) {
      ul.innerHTML += `<li><span style="background-color: ${color[index]}"></span>${label}</li>`;
  });

  return ul.outerHTML;
};

</script>




</body>
</html>