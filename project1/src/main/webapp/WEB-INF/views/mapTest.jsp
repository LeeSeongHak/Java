<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:1500px;height:800px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ea65279ab9874eb15c5fd98582cf9af"></script>
	<script>
		var container = document.getElementById('map');
		var lat = $('#lat1').html();
		
		var lon = $('#lon1').html();
		var options = {
			center: new daum.maps.LatLng(lat, lon),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
<div id="lat1">${sessionScope.lat}</div>
<div id="lon1">${sessionScope.lng}</div>
</body>
</html>