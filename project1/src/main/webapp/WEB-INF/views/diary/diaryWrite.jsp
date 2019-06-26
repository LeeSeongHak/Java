<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diaryWrite</title>

<link href="resources/css/home.css" rel="stylesheet" type="text/css">
<script src="resources/js/jquery-3.3.1.min.js"></script> 
<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" >  
<!--  jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style>
textarea { 
    width: 100%; 
    margin-bottom: 10px; 
    background: rgba(0,0,0,0.3);
    border: none;
    outline: none;
    padding: 10px;
    font-size: 15px;
    color: #fff;
    text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
    border: 1px solid rgba(0,0,0,0.3);
    border-radius: 4px;
    box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
    -webkit-transition: box-shadow .5s ease;
    -moz-transition: box-shadow .5s ease;
    -o-transition: box-shadow .5s ease;
    -ms-transition: box-shadow .5s ease;
    transition: box-shadow .5s ease;
    font-family: 'Open Sans', sans-serif;
}
body{ color:white; font-size:15px;}
input{font-size:15px;}
.diaryTable {color:white; margin:auto; font-size:15px;} 
</style>
<script>
$(document).ready(function(){
	$( "#datepicker" ).datepicker({
   	 changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달', 
        dateFormat: "yy'년  'mm'월  'dd'일'",
        changeMonth: true, 
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   });
   $('#datepicker').datepicker('setDate', 'today');
   $('#writeBtn').on('click', check);
});

function check(){
	var date = $('#datepicker').val();
	var content = $('#content').val();
	if(date == ''){
		alert('날짜를 입력해주세요.');
		return;
	}
	if(content == ''){
		alert('내용을 입력해주세요.');
		return;
	}
	diaryWrite();	
} 
//버튼 누르면 일기작성
function diaryWrite(){
	
	$.ajax({
		url:'diaryWrite',
		type:'post',
		data: $('#diaryForm').serialize(),
		
		success: function(){ alert('저장되었습니다.');},
		error: function(e){ var popup = window.open('', '', 'widht=auto, height=auto'); popup.document.write(e.responseText);}
	});
} 
</script>
 </head>
<body><br><br><h2 align="center">오늘 하루 어땠나요?</h2></p>
<form id="diaryForm">
<table class="diaryTable">
	<tr>
		<td >날짜</td>
		<td><input type="text" id="datepicker" name="inputdate" size="50"></td>
	</tr>
	<tr>
		<td >제목</td>
		<td><input type="text" id="title" name="title" size="50"></td>
	</tr>
	<tr>
		<td >날씨</td>
		<td><input type="text" id="weather" name="weather" size="50"></td>
	</tr>
	<tr>
		<td >기분</td>
		<td><input type="text" id="emotion" name="emotion" size="50"></td>
	</tr>
	
	<tr>
		<td >글내용</td>
		<td><textarea rows="5" cols="30" id="content" name="content"></textarea></td>
	</tr>
	<!-- <tr>
		<td >사진</td>
		<td><input type="button" value="파일선택" size="80"></td>
	</tr> -->
</table>
</form>
<input type="button" value="작성" id="writeBtn" size="30">
</body>
</html>