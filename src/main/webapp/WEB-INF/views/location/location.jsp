<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/map.css">
    <!-- 지도 js -->
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4306199893f86fa673fc035ff7b9639a"></script> -->
    <!-- services 라이브러리 불러오기 -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4306199893f86fa673fc035ff7b9639a&libraries=services"></script> -->
    <!-- 클러스터 라이브러리 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4306199893f86fa673fc035ff7b9639a&libraries=clusterer"></script>
 
    <div class="here">킥보드 위치 보기</div>
    <!-- 바디영역 -->
    <div class="mainBody">
        <!-- 지도를 표시할 div 입니다 -->
        <div id="map" style="width:60%;height:600px; margin-right: 1%; margin-left: 4%; box-sizing: border-box;"></div>


    <!-- 상품 리스트를 표시하는 div입니다. -->
    <div class="info">
        <div class="info-header">사용가능한 킥보드</div>
            <ul id="kick-list" class="kick-list">
                <!-- forEach써서 리스트 목록 나오게설정 -->
                <c:forEach var="kickInfo" items="${kickList}">
                <li id="list${kickInfo.getMarkNo()}">
                    <!-- 기본정보 리스트 -->
                    <div id="list${kickInfo.getMarkNo()}" class="kick-info-list">
                        <div class="mask">
                            <div>${kickInfo.getPCode()}</div>
                            <div>${kickInfo.getCCode()}</div>
                            <br>
                            <div>상세보기</div>
                        </div>
                        <img src="${pageContext.request.contextPath }/resources/img/productimg/${kickInfo.getProductInfoVO().getPimg1()}"alt="" class="kick-img">  
                    </div>
                    <!-- 상세정보 -->
                    <div id="detail${kickInfo.markNo}" class="kick-info-detail">
                        <div class="detail-fix">
                            <div class="detail-info">
                                <div style="border-bottom: 0.5px solid #ccc; padding: 10px; margin-bottom: 10px;">
                                    <div>모델명 : ${kickInfo.getPCode()}</div>
                                    <div>회사명 : ${kickInfo.getCCode()}</div>
                                </div>
                                <div style="border-bottom: 0.5px solid #ccc; padding: 10px; margin-bottom: 10px;">
                                     <div>좌표 정보</div>
                                     <div style="padding: 5px;">좌표 (${kickInfo.location_x}, ${kickInfo.location_y})</div>
                                </div>
                            </div>
                            <img src="${pageContext.request.contextPath }/resources/img/productimg/${kickInfo.getProductInfoVO().getPimg1()}" alt="" class="detail-img">  
                        </div>
                        <div class="spec">
							상세정보 <br>
							스팩1. ${kickInfo.getProductInfoVO().getPspec1()}<br>
							스팩2. ${kickInfo.getProductInfoVO().getPspec2()}<br>
							스팩3. ${kickInfo.getProductInfoVO().getPspec3()}<br>
                            <a class="moveDetial" href="${pageContext.request.contextPath}/product/productMain?pcode=${kickInfo.getPCode()}">더 많은 정보 보러가기</a>
                        </div>
                        <div>
                            <button class="btn btn-default btn-signature1" onclick="location.href='${pageContext.request.contextPath}/csBoard/csBoardList'">문의하기</button>
                            <button class="btn btn-default btn-signature2">예약하기</button>
                        </div>                           
                    </div>           
                </li>
                </c:forEach>                
            </ul>
        </div>
	</div>
	
	<script>
		$(document).ready(function(data) {
			$.ajax({
	            type : "get", //요청방식
	            url : "getMarkInfo",
	            dataType : "json", //요청 데이터 형식
	            contentType : "application/json",//보내는 데이터에 대한 타입
	            success : function(kickInfo) {//성공시 돌려받을 콜백
	                    
	                var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	                    mapOption = { 
	                    center: new kakao.maps.LatLng(37.54920197, 126.92320251), // 지도의 중심좌표
	                    level: 5 // 지도의 확대 레벨
	                };
	                   
	                var originMap = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	                    selectedMarker = null;
	                
	                var clusterer = new kakao.maps.MarkerClusterer({
	                    map: originMap, // 마커들을 클러스터로 관리하고 표시할 지도 객체
	                    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
	                    minLevel: 7, // 클러스터 할 최소 지도 레벨
	                    disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
	                });
	                var markers = [];
	                
					for (var i = 0; i < kickInfo.length; i++) {
						position = {
							title : 'list' + i,
							latlng : new kakao.maps.LatLng(
								kickInfo[i].location_x,
								kickInfo[i].location_y
							)
						}
						var marker = addMarker(position, originMap);
			            markers[i] = marker;  // 배열에 생성된 마커를 추가합니다
					}	    		
					var size = $("#kick-list").find("li").length;
					
					for (var i = 0; i < size; i++) {
						(function(i) {
							$('#list' + i).click(function() {
								clickMark(markers[i]);
							});
						})(i);
					}
					clusterer.addMarkers(markers);
					clickClusterer(clusterer, originMap);
	                console.log("success");
	            },
	            error : function(status, error) {//실패시 결과를 돌려받을 콜백
	                console.log(status, error);
	            }
	        })


			
		})

	    // 마커 이미지의 이미지 주소입니다
	    var imageNormal ="https://i1.daumcdn.net/dmaps/apis/n_local_blit_04.png";
	        imageClick = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	      
	    // 마커 이미지의 이미지 크기 입니다
	    var markerSize = new kakao.maps.Size(24, 35);
	        overMarkerSize = new kakao.maps.Size(36, 42);
	        
	    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다  
	    var normalImage = overMarkerImage(markerSize),
	        overImage = overMarkerImage(overMarkerSize),
	        clickImage = createMarkerImage(markerSize);
	    //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
      	
	    function clickClusterer(clusterer, originMap){	
			kakao.maps.event.addListener( clusterer, 'clusterclick', function( cluster ) {
				// 현재 지도 레벨에서 1레벨 확대한 레벨
		        var level = originMap.getLevel()-1;

		        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
		        originMap.setLevel(level, {anchor: cluster.getCenter()});
			});
	    }
	    
        function addMarker(position, originMap) {
            normalImage = overMarkerImage(markerSize),
            overImage = overMarkerImage(overMarkerSize),
            clickImage = createMarkerImage(markerSize);
            
            // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
            var marker = new kakao.maps.Marker({
                map: originMap, // 마커를 표시할 지도
                position: position.latlng, // 마커를 표시할 위치
                title : position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : normalImage // 마커 이미지 
            });

            // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
            //marker.normalImage = normalImage;

            // 마커에 mouseover 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {

                // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
                // 마커의 이미지를 오버 이미지로 변경합니다
                if (!selectedMarker || selectedMarker !== marker || selectedMarker.getImage()!==clickImage) {
                    marker.setImage(overImage);
                }
            });

            // 마커에 mouseout 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {

                // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
                // 마커의 이미지를 기본 이미지로 변경합니다
                if (!selectedMarker || selectedMarker !== marker || selectedMarker.getImage()!==clickImage) {
                    marker.setImage(normalImage);
                }
            });

            // 마커에 click 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                clickMark(marker);
                //getKickList(marker.Fb);                
            });
            
			return marker;
        }
        function clickMark(marker) {
            // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
            // 마커의 이미지를 클릭 이미지로 변경합니다
            if (!selectedMarker || selectedMarker !== marker) {
                
                // 클릭된 마커 객체가 null이 아니면
                // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                !!selectedMarker && selectedMarker.setImage(normalImage);
                
                // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
                marker.setImage(clickImage);
                
                //panTo(marker);
                
            } else if(selectedMarker){
                if(marker.getImage()==clickImage) {
                    marker.setImage(normalImage);
                } else {
                    marker.setImage(clickImage);
                }
            }
            
            hideKickList(marker.Fb)
            getKickList(marker.Fb);
            // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
            selectedMarker = marker;
            
        }
        
        function panTo(marker) {
            // 이동할 위도 경도 위치를 생성합니다 
            var moveLatLon = new kakao.maps.LatLng(marker.getPosition().Ma, marker.getPosition().La);
            
            // 지도 중심을 부드럽게 이동시킵니다
            // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
            map.panTo(moveLatLon);            
        }    

	    // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        //selectedMarker = marker;
        function getKickList(list){         
            //maker.Fb = list + i
            var size = $("#kick-list").find("li").length;
            var leng = list.substring(4, list.length);

            if($('#detail'+leng).css("display") == "none"){   
                for(var j=0;j<size;j++){
                    if(leng==j){
                        jQuery('#detail'+j).slideDown(50);
                    } else {
                        jQuery('#detail'+j).slideUp(50);
                    }
                }
            } else {
                jQuery('#detail'+leng).slideUp(50);
            }
        }
        
        function hideKickList(list){
            var size = $("#kick-list").find("li").length;
            var leng = list.substring(4, list.length);
   
            if($('#list'+leng).css("display") != "none"){   
            	 for(var j=0;j<size;j++){
                     if(leng==j){
                         jQuery('#list'+j).slideDown(50);
                     } else {        
                     	if($('#list'+j).css("display") == "none"){
                     		jQuery('#list'+j).slideDown(50);
                     	} else{                		
                         	jQuery('#list'+j).slideUp(50);
                     	}
                     }
                 }
            } else {
            	for(var j=0;j<size;j++){
            		if(leng==j){
                        jQuery('#list'+j).slideDown(50);
                    } else {
                    	if($('#list'+j).css("display") != "none"){
                        	jQuery('#list'+j).slideUp(50);
                    	}
                    }		
            	}
            }
        }
        
        function createMarkerImage(markerSize) {
            var markerImage = new kakao.maps.MarkerImage(
                imageClick, // 스프라이트 마커 이미지 URL
                markerSize // 마커의 크기
            );
    
            return markerImage;
        }
        function overMarkerImage(markerSize) {
            var overImage =null;
            var markerImage = new kakao.maps.MarkerImage(
                imageNormal,
                markerSize // 마커의 크기
            );
    
            return markerImage;
        }
	</script>