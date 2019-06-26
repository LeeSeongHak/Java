<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script
	src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=99ed5523-2eb1-46fb-8cf0-60d0377b2345"></script>
<script>
/**
* HashMap 객체 정의
*/
HashMap = function() {
	this.initialize();
};
HashMap.prototype = {
	oStruct : null,
	sSize : 0,
	/**
	 * 객체 생성시
	 */
	initialize : function() {
		this.oStruct = {};
		return;
	},
	/**
	 * 내용 전체 삭제
	 */
	clear : function() {
		this.oStruct = {};
		this.sSize = 0;
		return;
	},
	/**
	 * key가 있는지 판단
	 */
	containsKey : function(sKey) {
		for ( var x in this.oStruct) {
			if (x == sKey && this.oStruct[sKey] != undefined) {
				return true;
			}
		}
		return false;
	},
	/**
	 * value가 있는지 판단
	 */
	containsValue : function(value) {
		for ( var prop in this.map) {
			if (this.map[prop] == value) {
				return true;
			}
		}
		return false;
	},
	/**
	 * key의 collection을 가져옴
	 */
	keySet : function() {
		var keySet = new Array();
		for ( var x in this.oStruct) {
			if (this.oStruct[x] != undefined) {
				keySet.push(x);
			}
		}
		return keySet;
	},
	/**
	 * key의 value를 가져옴
	 */
	get : function(sKey) {
		if (!this.containsKey(sKey)) {
			return null;
		}
		return this.oStruct[sKey];
	},
	/**
	 * 값이 있는지 판단
	 */
	isEmpty : function() {
		return (this.sSize <= 0) ? true : false;
	},
	/**
	 * 값을 입력
	 */
	put : function(sKey, oObj) {
		oOldObj = null;
		if (this.containsKey(sKey)) {
			oOldObj = this.get(sKey);
		}
		else {
			this.sSize++;
		}
		this.oStruct[sKey] = oObj;
		return oOldObj;
	},
	/**
	 * 값을 지움
	 */
	remove : function(sKey) {
		if (!this.containsKey(sKey)) {
			return null;
		}
		oldObj = this.oStruct[sKey];
		this.oStruct[sKey] = undefined;
		this.sSize--;
		return oldObj;
	},
	/**
	 * 전체 크기
	 */
	size : function() {
		return this.sSize;
	},
	toString : function() {
		var str = '[';
		for ( var x in this.oStruct) {
			str += x + ' : ' + this.oStruct[x] + ',';
		}
		str += ']';
		return str;
	}
};
  
var map;
var gAppKey = "99ed5523-2eb1-46fb-8cf0-60d0377b2345";
var map;
var markerLayer;
var marker;
var _MarkersMap = new HashMap();
var tData;
function initTmap(){
	
	if (!navigator.geolocation){
	    alert('사용자의 브라우저는 지오로케이션을 지원하지 않습니다.');
	    return;
	}
	
	// 현재 위치정보 딱 한번 얻기
    navigator.geolocation.getCurrentPosition(success, error, optionCall);
    
  	//geolocation 옵션. accuracy - true 일시 정확성 높아짐. 대신 응답 느려질 수 있음 / maximumage - 캐시된 위치값의 유효시간 / timeout - 위치를 받아올 때 까지의 대기시간.
    var optionCall = { enableHighAccuracy: true, maximumAge: 0, timeout: 5000 };
	
    // 위치정보 얻기 성공시 자동으로 호출되는 콜백함수. 인자는 Position 객체
  	function success(position) {
	    lat = position.coords.latitude;
	    lng = position.coords.longitude;
	    
	    setCenter(lng, lat);
  	};
	
  	function error() {
  	    alert('사용자의 위치를 찾을 수 없습니다.');
  	  };
	
	// map 생성
	// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
	map = new Tmap.Map({div:'map_div', width:'100%', height:'400px'});
	
	function setCenter(lng,lat){	
		map.setCenter(new Tmap.LonLat(lng, lat).transform("EPSG:4326", "EPSG:3857"), 15);
	}
	
	markerLayer = new Tmap.Layer.Markers();//맵 레이어 생성
    map.addLayer(markerLayer);//map에 맵 레이어를 추가합니다.
	
	tData = new Tmap.TData();//REST API 에서 제공되는 경로, 교통정보, POI 데이터를 쉽게 처리할 수 있는 클래스입니다.

}   
 /**
  * < POI 검색결과 창 닫기 >
  */
 $(document).ready(function() {
     $('#close').click(function() {
     	$("#searchResult").hide();
     });
   });
 /**
  * POI 이벤트 관련 
  */
 var PR_3857 = new Tmap.Projection("EPSG:3857");		// Google Mercator 좌표계인 EPSG:3857
 var PR_4326 = new Tmap.Projection("EPSG:4326");		// WGS84 GEO 좌표계인 EPSG:4326
 /**
  * EPSG:3857를 EPSG:4326로 좌표변환~
  * @param x
  * @param y
  * @returns
  */
 function get4326LonLat(x, y){
 	return new Tmap.LonLat(x, y).transform(PR_3857, PR_4326);
 }
 /**
  *  EPSG:4326를 EPSG:3857로 좌표변환~
  * @param x
  * @param y
  * @returns
  */
 function get3857LonLat(x, y){
 	return new Tmap.LonLat(x, y).transform(PR_4326, PR_3857);
 }
 /**
  * 마우스커서가 대상 객체 위에 위치했을 때 발생 하는 이벤트
  * @param evt
  */
 function onMarkerOver(evt){	
 	this.popup.show();	// Label을 보여줍니다.
 }
 /**
  * 마우스커서가 대상 객체 위를 벗어 났을 때 발생 하는 이벤트
  * @param evt
  */
 function onMarkerOut(evt){
     this.popup.hide();	// Label을 숨김니다.
 }
 /** 
  * 마우스 커서가 대상 객체 위에 위치한 상태에서 마우스 버튼을 클릭 했을때 발생 하는 이벤트
  */
 function onClickMarker(evt){
 	map.removeAllPopup();
 	var popupId = this.id;	
 	if(_MarkersMap.get(popupId) == null){
 		map.addPopup(this);	// Map에 팝업 객체를 등록합니다.
 		_MarkersMap.put(popupId, this);
 	}else{
 		map.removePopup(this);	// Map에 팝업 객체를 제거합니다.
 		_MarkersMap.remove(popupId);
 	}
 }
 /**
  * Marker 추가 
  */
 function addMarkers(img, x, y, label, id){
 	var lonlat = new Tmap.LonLat(x, y);//마커 좌표 설정합니다.
 	var size = new Tmap.Size(24,38);//아이콘 크기 설정합니다.
 	var offset = new Tmap.Pixel(-(size.w/2), -size.h);//아이콘 중심점 설정합니다. 	
 	var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png',size, offset);//마커 아이콘 설정합니다. 
 	var labelText 	= new Tmap.Label('<div>'+label+'</div>');// Label 객체 생성합니다.
 	marker = new Tmap.Markers(lonlat, icon, labelText);//마커 생성합니다.
 	markerLayer.addMarker(marker);//마커 레이어에 마커 추가합니다.
 	if(id){		
 		_MarkersMap.put(id, marker);			
 	}else{		
 		_MarkersMap.put(img, marker);	
 	}
 }
 /**
  * Marker 전체 삭제 
  */
 function delTotMarker(){
 	var makerKeySet = _MarkersMap.keySet();
 	for(var i=0; i < makerKeySet.length; i++){
 		markerLayer.removeMarker(_MarkersMap.get(makerKeySet[i]));		// MarkerLayer에서 Marker를 제거합니다.
 		_MarkersMap.get(makerKeySet[i]).destroy();					// Tmap.Marker 객체를 메모리에서 제거합니다.
 		_MarkersMap.remove(makerKeySet[i]);							// HashMap에서 모든 객체를 제거합니다.
 	}
 }
 /**
  * 해당 Marker를 삭제
  * @param id
  */
 function removeMarker(id){
 	try{
 		markerLayer.removeMarker(_MarkersMap.get(id));//레이어의 마커를 삭제합니다.
 	}catch(err){
 	}
 }
 /**
  * 마커에 이벤트를 등록
  * @param id
  */
 function addMarkerEvent(id){
 	marker = _MarkersMap.get(id);
 	marker.events.register("mouseover", marker, onMarkerOver);//마커 마우스오버 이벤트 등록합니다.
 	marker.events.register("mouseout" , marker, onMarkerOut);//마커  마우스 아웃 이벤트 등록합니다.
 }
 /** 
  * popup창 생성/추가
  * @param x
  * @param y
  * @param popupText
  * @param id
  */
 function addMarkerPopup(x, y, popupText, id){
 	marker = _MarkersMap.get(id);
 	var lonlat = new Tmap.LonLat(x, y);	// LonLat 객체 생성합니다.	
 	var content ="<div style=' position: relative; border-bottom: 1px solid #dcdcdc; line-height: 18px; padding: 0 35px 2px 0;'>"+
			    "<div style='font-size: 12px; line-height: 15px;'>"+
			        "<span style='display: inline-block; width: 14px; height: 14px; background-image: url(/resources/images/common/icon_blet.png); vertical-align: middle; margin-right: 5px;'></span>"+popupText+
			    "</div>"+
			 "</div>";	
 	var popup  = new Tmap.Popup("popup"+id,  lonlat,  new Tmap.Size(300,50), content,  false);//팝업을 생성합니다.
 	popup.autoSize=true;//popup 사이즈 자동 조절		                         
 	marker.events.register("click", popup, onClickMarker);//클릭시 팝업을 보여줍니다.
 }

var cnt = 1; 
 //POI 통합 검색 함수입니다. 
function getTotPOISearch() {
 	var searchKeyword 	= $('#inp_keyword').val();
 	
 	if(searchKeyword == ''){
 		alert('검색어를 입력해 주세요');
 		return;
 	}
	var lonlat = map.getCenter(); // 지도 중심좌표를 가져옵니다.
	var url = "https://api2.sktelecom.com/tmap/pois";//POI 검색 api url 입니다
	var params = {
		"version" : "1"//버전
		,"page" : "1"//페이지
		,"count"  : "20"//페이지당 검색수
		,"searchKeyword" : searchKeyword //검색어
		,"searchtypCd" : "R"//R: 거리순 / A:정확도순
		,"radius"  : "1" //검색반경
		,"centerLon" : lonlat.lon //경도
		,"centerLat" : lonlat.lat //위도
		,"appKey"  : gAppKey //앱키(서버키)
		,"reqCoordType" : "EPSG3857"
		,"resCoordType" : "EPSG3857"
	};
	
	$.get( url, params, function(data){
 		if( data ) {
 			// POI 통합검색 요청 성공 시 작업
 			markerLayer.clearMarkers(); // 기존 마커를  모두 삭제합니다.
 			var arrPoi = data.searchPoiInfo.pois.poi;//api를 요청 결과를 담는 변수입니다.
 			var id, name, frontLat, frontLon;			
 			var upperAddrName, middleAddrName, lowerAddrName, detailAddrName;
 			var str = "", popupText = "";
 			var bounds = new Tmap.Bounds();
 			
 			$("#searchCount").html(data.searchPoiInfo.count);//검색 결과의 수를 html에 출력합니다.
 			for( var i in arrPoi ) {
 				id			= arrPoi[i].id;//요청 결과에서 id를 추출합니다.
 				name 		= arrPoi[i].name;
 				frontLat 	= arrPoi[i].frontLat;
 				frontLon 	= arrPoi[i].frontLon;			

 				upperAddrName		= arrPoi[i].upperAddrName;//요청 결과에서 주소를 추출합니다.
 				middleAddrName		= arrPoi[i].middleAddrName;
 				lowerAddrName		= arrPoi[i].lowerAddrName;
 				detailAddrName		= arrPoi[i].detailAddrName;
 				
 				//마우스 오버시 출력할 텍스트입니다.
 				str += '<tr>';
 				str += '<td>'+name+'</td>';
 				str += '</tr>';		
 				
 				//popup에 출력할 텍스트입니다.
 				popupText += '<tr>';
 				popupText += '<td>'+upperAddrName+' '+middleAddrName+' '+lowerAddrName+' '+detailAddrName+' - '+name+'</td>';
 				popupText += '</tr>';
 				
 				// Marker를 추가하는 함수입니다.
 				addMarkers('point.png', frontLon, frontLat, name, id);

 				// Marker에 Popup을 추가합니다.
 				addMarkerPopup(frontLon, frontLat, popupText, id);
 				//팝업 텍스트를 초기화합니다.
 				popupText = '';	
 				
 				// Marker에 event를 추가하는 함수입니다.
 				addMarkerEvent(id);
 				
 				bounds.extend( new Tmap.LonLat(frontLon, frontLat) ); // 마커가 보이도록 바운드 확장합니다.
 			}
 			
 			// 모든 마커가 보이도록 줌레벨 조정합니다.
 			map.zoomToExtent(bounds);
 			
 			$("#searchTbody").html(str);//str을 id가 searchTbody인 태그 안에 출력
 			$("name").html(name);
 			if(cnt == 1){
 				$("#startCoordX").html(frontLon);
 				$("#startCoordY").html(frontLat);
 			}
 			if(cnt == 2){
 				$("#endCoordX").html(frontLon);
 				$("#endCoordY").html(frontLat);
 			}
 			cnt++;
			$('#searchResult').css('display', 'block');//id가 searchResult인 태그 css 수정
 		}
 		else {
 			alert("검색결과가 없습니다");
 		}
 	});
}

function coord(){
	if(cnt == 1){
		var startX = document.getElementById('startCoordX');
		var startY = document.getElementById('startCoordY');
		//alert(startX.value);
		//alert(startY.value);
	}
	else{
		var endX = document.getElementById('endCoordX');
		var endY = document.getElementById('endCoordY');
		//alert(endX.value);
		//alert(endY.value);
	}
	cnt++;
	
	var name = document.getElementById('name');
	//alert(name.value);
	
}
</script>
</head>
<body onload="initTmap()">

<!-- poi 통합 검색 html 소스 -->
<div class="map_wrap" style="border: none;">
<div id="menu_wrap" class="bg_white">
	<div class="option">
		<div>
			<div class="search_btn">
				<input id="inp_keyword" type="text" placeholder="경로 검색하기" />
				<input
					type="button" value="검색"
					onclick="javascript:getTotPOISearch()" />
			<br>
			<input id="start" type="text" placeholder="출발지" readOnly/>
			<input id="end" type="text" placeholder="도착지" readOnly/>
			<input
				type="button" value="경로 검색하기"
			/>
			<input id="name"/>
			<input id="startCoordX"/>
			<input id="startCoordY"/>
			<input id="endCoordX"/>
			<input id="endCoordY"/>
			<br>
		</div>
	</div>
</div>
<hr>
<div id="searchResult" style="display: none;">
<div class="title">
	검색 결과(<span id="searchCount">0</span>) <input type="button"
		value="닫기" id="close" style="float: right;">
			</div>
			<table>
				<tbody id="searchTbody" onclick="coord()">
				</tbody>
			</table>
		</div>
	</div>
</div>

<div id="map_div"></div>
</body>
</html>