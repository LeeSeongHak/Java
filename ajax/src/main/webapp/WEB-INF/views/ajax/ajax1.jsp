<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax1</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>

//1 : jsp부터 서버까지 갔다가 다시 돌아오는 과정을 출력문을 넣어 확인. json은 이용해 java AL을 javascript에 추가.
$(document).ready(function(){
	$('#bt1').on('click', call1);
	$('#bt2').on('click', call2);
});

//이 함수는 쭉 실행하다가 ajax를 만난 순간 url로 가버림. 따라서 ajax 밑에 넣는 코드는 아무 쓸모 없다.
function call1(){
	alert('call1 실행');
	
	$.ajax({
		//url : 어디로 갈지. controller의 경로와 맞아야함. 상대경로로 중간에 ../ 등의 경로가 추가될 수도 있음.
		url: 'ajaxtest1',
		//type : 요청을 get방식으로 보낼 것인가, post방식으로 보낼 것인가.
		type: 'GET',
		//dataType : 데이터를 가져올 때 어떤 타입으로 가져올지. 보통 text 아니면 json이 들어간다.
		dataType: 'text',
		//요청 성공시 어떻게 할 것인지. 방법 1: 다른 함수로 보내기. 뒤에 ()붙이면 안됨. ()붙이는 것은 그 함수를 지금 이 자리에서 실행한다는 뜻이므로.
		success: output1,
		//요청 실패시 어떻게 할 것인가. 방법 2: 안에 함수 넣어버리기(추가할 내용이 짧을 때 유용).
		error: function (e, request, status, error) {
			//에러 발생시 에러 내용을 문자열로 출력하는 명령어.
			alert(JSON.stringify(e));
			alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});	
}

function output1(){
	alert('output1로 돌아옴');
}

function call2(){
	alert('call2 실행');
	$.ajax({
		url: 'ajaxtest2',
		type: 'GET',
		dataType: 'text',
		data: {str : 'abcd'},
		success: output2,
		error: function (e) {
			alert(JSON.stringify(e));
		}
	});
}

function output2(s){
	alert('서버에서 가져온 값 : ' + s);
}

</script>
</head>
<body>
<h1>[ Ajax로 서버와 통신하기 ]</h1>

<p><input type="button" id="bt1" value="서버호출"></p>
<p><input type="button" id="bt2" value="서버와 데이터 주고받기"></p>


</body>
</html>