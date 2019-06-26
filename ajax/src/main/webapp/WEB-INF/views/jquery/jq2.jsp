<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery 2</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
//ready 함수는 이 페이지가 실행될 때 제일 먼저 실행되는 것. ready가 여러개 있으면 순서대로 모두 실행됨.
$(document).ready(function() {
	//객체에 이벤트 연결
	$('#bt1').on('click', bt1Click);
	$('#bt2').on('click', bt2Click);
	$('#bt3').on('click', bt3Click);
	$('#img2').hide();
	$('#img1').on('mouseover', img2Open);
	$('#img1').on('mouseout', img2Close);
	$('#img3').on('mouseover', img4Open);
	$('#img3').on('mouseout', img4Close);
	$('#text1').on('keyup', outputText);
	$(window).scroll(function (){
		var scrollHeight = $(window).scrollTop() + $(window).height();
		var documentHeight = $(document).height();
		if (scrollHeight == documentHeight) {
			for (var i = 0; i < 10; i++) {
				$('<h1>Infinity Scroll</h1>').appendTo('body');
			}
		}
	})
});

$(document).ready(function () {
	for (var i = 0; i < 20; i++){
		$('<h1>Infinity Scroll</h1>').appendTo('body');
	}
});

function bt1Click(){
	alert('클릭 이벤트');
}

function bt2Click(){
	$('#bt1').off('click');
}

function bt3Click(){
	$('#bt1').off('click');
	$('#bt1').on('click', bt1Click);
}

function img2Open(){
	$('#img2').show();
}

function img2Close(){
	$('#img2').hide();
}

function img4Open(){
	$('#img4').html('<img src="resources/image/dd.gif" width="600" height="600" align="middle">');
}

function img4Close(){
	//empty - 문서 객체 내부를 비우는 것. remove - 문서 객체 자체를 지워버리는 것. 태그까지 지워버려서 일회용 되는거같다.
	//$('#img4').empty();
	$('#img4').html('');
}

//연관검색어(DB연동필요), 아이디중복확인(DB연동필요), 글자 수
function outputText(){
	// 1) val() - 현재 값을 읽어오는 기능. 2) val(내용) - 현재 값을 내용으로 고치는 기능.
	var s = $('#text1').val();
	$('#textDiv').html(s);
}

</script>
</head>
<body>
<h1>[ jQuery 이벤트 처리 ]</h1>

<input type="button" id="bt1" value="버튼1"><br>
<input type="button" id="bt2" value="버튼2"><br>
<input type="button" id="bt3" value="버튼3"><br>
<br><br>
<img src="resources/image/1212.gif" id="img1" align="top">
<img src="resources/image/1213.gif" id="img2" width="600" height="600" align="middle">
<br><br>
<img src="resources/image/1213.gif" id="img3" align="top">
<span id="img4"></span>
<br><br>

<p><input type="text" id="text1"></p>
<div id="textDiv"></div>


</body>
</html>