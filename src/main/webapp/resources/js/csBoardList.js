 /* 컨트롤러 이동 스크립트 */ 
var userId;
var socketPath;
	
	$(document).ready( function() {
		
        // 글쓰기 등록
   		$("#registBtn").click( function() {
   			
   			$("#registForm > input[name=whereBoard]").attr("value", $(".content-header .active").html() );
   			
   			// 어떤 게시판?
   			var whereBoard = $(".content-header .active").html();
   			
   			if(whereBoard == "Notice"){
   				$("#registForm").attr("action","noticeRegist");
   				$("#registForm input[id=boardWriter]").attr("name", "notice_Writer");
   				$("#registForm input[id=boardTitle]").attr("name", "notice_Title");
   				$("#registForm textarea[id=boardContent]").attr("name", "notice_Content");
   			} else if ( whereBoard == "FAQ") {
   				$("#registForm").attr("action","faqRegist");
   				$("#registForm input[id=boardWriter]").attr("name", "faq_Writer");
   				$("#registForm input[id=boardTitle]").attr("name", "faq_Title");
   				$("#registForm textarea[id=boardContent]").attr("name", "faq_Content");
   			}

            setCookie("whereboard", whereBoard);
   			$("#registForm").submit();
   			
   		}); // click
   		
   		// 게시판 순서
   		$(".list-option > select").change( function() {
   			
   			var whereBoard = $(".content-header .active").html();
   			setCookie("whereboard", whereBoard)
   			
   			$("#listForm").submit();
   			
   		}); // 게시판 순서
   		
   		// 대분류
   		$(".list-mainCategori > select").change( function() {
            
            var whereBoard = $(".content-header .active").html();
            setCookie("whereboard", whereBoard);

            $("#listForm").submit();

        }); // 대분류

        // 페이지네이션 클릭
        $(".content-page").on("click", "a", function() {
            event.preventDefault();

            document.pageForm.pageNum.value = event.target.dataset.pagenum;
		    document.pageForm.submit();
        });
   		
	}); // ready
	
	// 글 삭제
	function deleteList(bno) {
		
		var whereBoard = $(".content-header .active").html();
		
		location.href = "delete?whereboard=" + whereBoard + "&bno=" + bno;
		
	}

/* 동적 작동 */

    /* 쿠키를 통해 현재 게시판 탐색 */
    $(document).ready( function() {
    
   		// 만약 쿠키가 없다면?
   		if(getCookie("whereboard") == undefined){
    		setCookie("whereboard", "Notice");
    	}
        
        /* 전에 보여지던 게시판 */
        var preActive = document.querySelector("body > div.active");
        if(preActive != null){
            preActive.classList.remove("active");
            preActive.classList.add("hidden");
        }

        /* 현재 보여질 헤더, 게시판, 페이지네이션 */
        var active = getCookie("whereboard");
        $("#" + active).addClass("active");
        document.querySelector( document.querySelector( "#" + active).dataset.select ).classList.add("active");
        document.querySelector( document.querySelector( "#" + active).dataset.select ).classList.remove("hidden")
        document.querySelector( ".content-page > " + document.querySelector( "#" + active).dataset.select ).classList.add("active");
        document.querySelector( ".content-page > " + document.querySelector( "#" + active).dataset.select  ).classList.remove("hidden");

        listOption(); // 처음에 대분류를 화면에 표시할지 메서드 실행
        registBtn(); // 글쓰기 버튼 표시 여부
    });

    /* 헤더 active */
    $(".content-header").on("click", "a", function () {
        event.preventDefault();

        var preActive = document.querySelector("body > div.active");
        preActive.classList.remove("active");
        preActive.classList.add("hidden");

        var prePaging = document.querySelector(".content-page > .active");
        prePaging.classList.remove("active");
        prePaging.classList.add("hidden");

        $(".content-header > li > .active").removeClass("active");
        $(this).addClass("active");

        var currentActive = document.querySelector( event.target.dataset.select );
        currentActive.classList.remove("hidden");
        currentActive.classList.add("active");

        var currentPaging = document.querySelector( ".content-page > " + event.target.dataset.select );
        currentPaging.classList.remove("hidden");
        currentPaging.classList.add("active");

        $(".post-regist").css("display", "none");

        listOption(); // 대분류 보여줄지 말지

        setCookie("whereboard", $(".content-header .active").html());

        init(); // 설정되어있던 pageNum 등 초기화
        
        registBtn(); // 글쓰기 버튼 표시 여부
        
        
        document.pageForm.submit();
    });

    /* 대분류 */
    function listOption() {
        if( $(".content-header .active").html() == 'Notice'){
            $(".list-mainCategori").css("display", "none");
        } else  {
            $(".list-mainCategori").css("display", "inline-block");
        }
    }
    
    /* 글쓰기버튼 hidden 처리 */
    function registBtn() {
    	
    	var whereboard = getCookie("whereboard");
    	
    	if(whereboard == 'Notice' || whereboard == 'FAQ'){
    		
    		if(userId != 'master123'){
    			if($("#regist").hasClass("hidden") == false){
        			$("#regist").addClass("hidden");
    			}
    		} else {
    			$("#regist").removeClass("hidden");
    		}
    		
    	} else if(whereboard == 'QNA'){
    		
    		if(userId == '' || userId == 'master123'){
    			if($("#regist").hasClass("hidden") == false){
        			$("#regist").addClass("hidden");
    			}
    		} else {
    			$("#regist").removeClass("hidden");
    		}
    		
    	}
    	
    }
    
    /* 글등록 hidden */
    $("#regist").click( function() {
        
        /* QNA 게시판에서 글쓰기를 누를경우 페이지 이동 */
        var currnetTab = $(".content-header .active").html();
        if( currnetTab == 'QNA'){
            location.href="qnaRegist.html";
            return;
        } else if  ( currnetTab == 'FAQ' ){
        	
            if( $("#boardCategori").hasClass("hidden") == true){
                $("#boardCategori").removeClass("hidden");
            }

        } else {

            if( $("#boardCategori").hasClass("hidden") == false){
                $("#boardCategori").addClass("hidden");
            }

        }
        
        /* QNA 게시판이 아닌 경우에 글쓰기를 누를경우, 숨겨져있던 글쓰기 나옴 */
        $(".post-regist").toggle("hidden");
        
    });

    /* 글 상세 */
    var preTarget;
    function contentView(bno, writer, tow) {
        event.preventDefault();
        
        // 비밀글 체크
        if(getCookie("whereboard") == 'QNA'){
        	if(tow == 'secret'){
        		
    	        if(userId != writer && userId != 'master123'){
    	        	alert("비밀글은 본인만 열람 가능합니다.");
    	        	return;
    	        }
        	}
        }
        
        /* 현재 누른 타겟 */
        var currentTarget = event.target.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.classList;
        currentTarget.add("active");
        currentTarget.toggle("hidden");
        
        /* 전에 눌러져 있던 타겟  */
        if(preTarget != null && preTarget != currentTarget){
            preTarget.remove("active");
            preTarget.add("hidden");
        }

        preTarget = currentTarget;
    
        /* 게시글 조회 수 증가 */
        var whereboard = $(".content-header .active").html();
        var changeTarget = event.target.parentElement.nextElementSibling.nextElementSibling.nextElementSibling;
        $.ajax({
            type: "post",
            url: "countView",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({"whereboard": whereboard, "bno": bno}),
            success : function(data) {

                if(data == 1){
                    var plus = (changeTarget.innerHTML*1) + 1; // string -> number + 1
                    changeTarget.innerHTML = plus;
                } 

            },
            error: function(status, error){
                console.log(status, error);
            }
        });
	}

    /* 글 상세 - 답변 */
    $(".content-notice-box3").on("click", "button", function() {
        if(  $(this).attr("id") != 'btn-reply' ) return;

        var currentTarget = event.target.parentElement.nextElementSibling.classList;
        console.log(currentTarget);
        currentTarget.toggle("hidden");
    });
    
    /* 컨트롤러로 넘어갈 때, 변수 처리 */
    function init() {
    	document.pageForm.pageNum.value = 1;
    	document.pageForm.searchType.value = '';
    	document.pageForm.searchName.value = '';
    	document.pageForm.listOrder.value = '';
    }

	/* 이미지 업로드 처리 */
	//자바 스크립트 파일 미리보기 기능
    var obj = {count: 0};
    $("#registBtn").click(function() {
        obj.count = 0;
    })
	function readURL(input) {
    	if (input.files && input.files[0]) {
    		
            /* 파일 업로드 */
            var file = input.files[0].name;
            file = file.slice(file.lastIndexOf(".", file.length) + 1 , file.length); // 파일 확장자
            
            console.log(file);
            
            if(file != 'png' && file != 'jpg' && file != 'bmp'){
                alert("이미지 파일형태만 등록가능 합니다(jpg, png, bmp)");
                $("#file" + obj.count).val('');
                return;
            } else if (file == '' || file == null){
                alert("이미지 파일형태만 등록가능 합니다(jpg, png, bmp)");
                $("#file" + obj.count).val('');
                return;
            } else {
                var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
                //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
                reader.readAsDataURL(input.files[0]); 
                
                $(".fileDiv").append(
                		"<div class='imageFile'>" +
                		"<img class='fileImg[" + obj.count + "]'  src=''>" +
                		"<button type='button' class='imgDeleteBtn' data-info='file" + obj.count + "'>x</button>" +
                		"</div>"
                		);
                
                reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                    $("img[class='fileImg[" + obj.count + "]']").attr("src", event.target.result); 
                    $("#file" + obj.count)[0].files = input.files;
                    obj.count++;
                    $("#registForm .imageBtn").append("<input type='file' id='file" + obj.count + "' name='file[" + obj.count + "]' class='btn btn-default btn-upload '>");
                    $("label[class='file']").attr("for", "file" + obj.count);
                }
            }
    	}
    }
    
    $(".imageBtn").on("change", "input[type='file']", function() {

        readURL(this); //this는 #file자신 태그를 의미
    });

    $(".fileDiv").on("click", "button[class='imgDeleteBtn']", function() {

        event.target.parentElement.classList.add("hidden");
        $("#" + event.target.dataset.info).remove();
    })


/* 1:1채팅 소켓 */

	// 웹소켓
    var websocket;
	var chatLog = $(".chat");
	var enterChatCount = 0;
	
	// 채팅 Input 포커스 시
	$("#chat").focus(function() {
		if(enterChatCount == 0){
			connect();
			enterChatCount++;
		}
	});
	
	// 채팅 보낼 상대 클릭
	var chatTarget;
	chatLog.on("click", "span", function() {
        if(userId != 'master123') return;

        chatTarget = $(this).html();
        $("#chat").val("(" + chatTarget + "에게) ");
        
        $("#chat").focus(); // 메세지 포커스
    });
	
	// 채팅 엔터
	$("#chat").keyup(function() {
		if(event.keyCode != 13) return;
		chattingSend();
	});
	
	// 채팅 보내기 클릭 시
	$("#chatBtn").click(function() {
		chattingSend();
	});
	
	// 메세지 보내기
	function chattingSend() {
		if($("#chat").val() =='') return;
			
		var chatMsg = $("#chat").val();
		$("#chat").val("");
		
		if(userId != 'master123'){
			var appendMsg = "<p><나> :" + chatMsg + "</p>";
			chatLog.append(appendMsg);
		
			sendMessage(userId + ",master123," + chatMsg);				
		} else {
			chatLog.append("<p>나 : " + chatMsg + "</p>");
			
			chatMsg = chatMsg.substring(chatMsg.indexOf(")") + 1, chatMsg.length);
			sendMessage(userId + "," + chatTarget + "," + chatMsg);
		}
		
		divScrollControl();
	}

    //입장 버튼을 눌렀을 때 호출되는 함수
    function connect() {
        // 웹소켓 주소
        var wsUri = "ws://" + socketPath;
        // 소켓 객체 생성
        websocket = new WebSocket(wsUri);
        //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
        websocket.onopen = onOpen;
        websocket.onmessage = onMessage;
        websocket.sendMessage = sendMessage;
        websocket.onclose = onClose;
        
    }
    
    //웹 소켓에 연결되었을 때 호출될 함수
   	function onOpen() {
   		chatLog.append("<p>연결 되었습니다.</p>");
    }
    
    // * 1 메시지 전송
    function sendMessage(message) {
    	websocket.send(message);
    }
   
    // * 2 메세지 수신
    function onMessage(event) {
    	chatLog.append("<p>" + event.data + "</p>");
    	divScrollControl();
    }
    
    // 웹 소켓이 종료되었을 때 호출될 함수
    function onClose(event) {
    	chatLog.append("<p> 채팅이 종료되었습니다. </p>");
    	divScrollControl();
    }
    
    // 채팅창 스크롤 아래로 내리기
    function divScrollControl() {
    	chatLog.scrollTop(chatLog[0].scrollHeight);
    }
