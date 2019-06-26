<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function onCompleteLoadGetPOIDataFromSearch(){
    jQuery("#searchResult").html("");
	var size = new Tmap.Size(22,30);
    var offset = newTmap.Pixel(-(size.w/2), -size.h);
	if(jQuery(this.responseXML).find("searchPoiInfopoispoi").text() != ''){
	    jQuery(this.responseXML).find("searchPoiInfopoispoi").each(function(){
			
	    	var name = jQuery(this).find("name").text();
			var upperAddrName = jQuery(this).find("upperAddrName").text();
			var middleAddrName = jQuery(this).find("middleAddrName").text();
			var lowerAddrName = jQuery(this).find("lowerAddrName").text();
			var upperBizName = jQuery(this).find("upperBizName").text();
			var middleBizName = jQuery(this).find("middleBizName").text();
			var lowerBizName = jQuery(this).find("lowerBizName").text();
			var detailBizName = jQuery(this).find("detailBizName").text();
			var coordX = jQuery(this).find("frontLon").text();
			var coordY = jQuery(this).find("frontLat").text();
			var trLonLat = get3857LonLat(coordX, coordY);
			var nameArray = [];
			nameArray = name.split("(");
			
			if(name.length>20){
				name = nameArray[0]+'<br/>('+nameArray[1];
			}                                                              
			
			if(jQuery(this).index() >= 10){
				jQuery("#searchResult").append('<div><spanclass="num">'+(jQuery(this).index()+1)+'</span>&nbsp;<spanclass="imgSpan"><imgsrc="http://map.nate.com/img/contents/ico_spot.png"></span><spanclass="poiResultList"><ahref="javascript:selectPoi('+coordX+','+coordY+')"style="text-decoration:none; *margin-top:-10px;">'+name+'</a></span></div><br/><br/>');
				var icon = new Tmap.IconHtml("<imgsrc=http://map.nate.com/img/contents/ico_spot.png/>", size, offset);
			}
			
			else{
				jQuery("#searchResult").append('<div><spanclass="num">'+(jQuery(this).index()+1)+'</span>&nbsp;<spanclass="imgSpan"><img src="img/ico_cg1_b_'+(jQuery(this).index()+1)+'.png"></span><spanclass="poiResultList"><ahref="javascript:selectPoi('+coordX+','+coordY+')"style="text-decoration:none;*margin-top:-10px;">'+name+'</a></span></div><br/><br/>');
				var icon = newTmap.IconHtml("<imgsrc='img/ico_cg1_b_"+(jQuery(this).index()+1)+".png'/>",size, offset);
			}
			
			var label = new Tmap.Label("&nbsp;상호명 : "+ name + "<br/><br/>&nbsp;주소 : " + upperAddrName + " " +middleAddrName + "" + lowerAddrName+"<br/><br/>&nbsp;구분 : "+upperBizName + "&nbsp;&gt;&nbsp;"+middleBizName + "&nbsp;&gt;&nbsp;" + lowerBizName +"&nbsp;&gt;&nbsp;" + detailBizName);
			var marker = new Tmap.Markers(newTmap.LonLat(coordX, coordY), icon, label)            
			markers.addMarker(marker);
			marker.events.register('mouseover',marker, onMarkerOver);
			marker.events.register('mouseout',marker, onMarkerOut);
		});
	}
	else if(jQuery(this.responseXML).find("error").text() != ''){
		var errorMessage= jQuery(this.responseXML).find("error message").text();
		alert(errorMessage);
	}
	else{
        alert('검색결과가없습니다.');
	}

	if(jQuery(this.responseXML).find("searchPoiInfopoispoi").text() != ''){
		map.zoomToExtent(markers.getDataExtent());
	}
	else{
		map.setCenter(newTmap.LonLat(14134074.680985, 4517814.0870894),15);
		markers.clearMarkers();   
	}
}
</script>
</head>
<body>

</body>
</html>