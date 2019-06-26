<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax2</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
	//버튼을 누르면 함수 실행
	$('#formButton1').on('click', formSubmit1);
	$('#formButton2').on('click', formSubmit2);
	$('#formButton3').on('click', formSubmit3);
	$('#bt1').on('click', getJson1);
	$('#bt2').on('click', getJson2);
	$('#bt3').on('click', getJson3);
})	

function formSubmit1(){
	var name = $('#name').val();
	var age = $('#age').val();
	var phone = $('#phone').val();
	
	$.ajax({
		url: 'insert1',
		type: 'POST',
		//{} - 자바의 vo객체로 생각하면 됨. 앞의 name은 속성(변수명). 뒤의 name은 입력하여 들어가는 값. ex)name: 홍길동
		data: {name: name, age: age, phone: phone},
		//값을 입력하고 해당 칸을 빈칸으로 만들기 위해서 form의 id를 불러와 그 사이의 val 값을 공백으로 넣어줌.
		success: function() {alert( '저장되었습니다.'); $('#name').val(''); $('#age').val(''); $('#phone').val('');},
		error: function(e) {alert( JSON.stringify(e)); }
	});
}

function formSubmit2(){
	var name = $('#name2').val();
	var age = $('#age2').val();
	var phone = $('#phone2').val();
	
	$.ajax({
		url: 'insert2',
		type: 'POST',
		data: {name: name, age: age, phone: phone},
		success: function(){alert('성공'); $('#name2').val(''); $('#age2').val(''); $('#phone2').val('');},
		error: function(e){alert(Json.Stringify(e));}
	});
}

function formSubmit3(){
	$.ajax({
		url: 'insert3',
		type: 'POST',
		data: $('#writeForm3').serialize(),
		success: function () {alert('성공'); $('#name3').val(''); $('#age3').val(''); $('#phone3').val('');},
		error: function(e){alert(Json.Stringify(e));}
	});
}

function getJson1(){
	$.ajax({
		url: 'jsontest',
		type: 'GET',
		dataType: 'text',
		success: function (ob) {
			$('#outputDiv1').html(ob);
		},
		error: function (e) {alert(Json.Stringify(e));}
	});
}

function getJson2(){
	$.ajax({
		url: 'jsontest',
		type: 'GET',
		dataType: 'json',
		//json 사용시 리턴값이 to string이 없는 vo 객체로 오기 때문에, 여기서 직접 출력을 해주어야한다. json 쓰다가 값이 안나올 땐 타입을 text로 바꿔서 확인해보기. []가 있을 경우 배열.
		success: function (ob) {
			var str = '이름은 ' + ob.name;
			str += ', 나이는 ' + ob.age;
			str += ', 전화번호는 ' + ob.phone;
			$('#outputDiv2').html(str);
		},
		error: function (e) {alert(Json.Stringify(e));}
	});
}

function getJson3(){
	$.ajax({
		url: 'jsontest',
		type: 'GET',
		dataType: 'json',
		//json 사용시 리턴값이 to string이 없는 vo 객체로 오기 때문에, 여기서 직접 출력을 해주어야한다. json 쓰다가 값이 안나올 땐 타입을 text로 바꿔서 확인해보기. []가 있을 경우 배열.
		success: function (ob) {
			var name = '<table border="1"><th>이름 </th><td>' + ob.name;
			var age = '</td></tr><tr><th>나이 </th><td>' + ob.age;
			var phone = '</td></tr><tr><th>전화</th><td>' + ob.phone + '</td></tr></table>';
			$('#outputDiv3').html(
					name + age + phone
			);
		},
		error: function (e) {alert(Json.Stringify(e));}
	});
}
</script>
</head>
<body>
<h1>[ Ajax로 서버와 통신하기2 ]</h1>
<p>1. 서버로 각각의 parameter를 전달</p>
<form id="writeForm1">
이름 <input type="text" id="name"><br>
나이 <input type="text" id="age"><br>
전화 <input type="text" id="phone"><br>
	<input type="button" id="formButton1" value="저장"><br>
</form>

<p>2. 서버로 VO 객체를 전달</p>
<form id="writeForm2">
이름 <input type="text" id="name2"><br>
나이 <input type="text" id="age2"><br>
전화 <input type="text" id="phone2"><br>
	<input type="button" id="formButton2" value="저장"><br>
</form>

<p>3. 서버로 Form을 전송</p>
<form id="writeForm3">
이름 <input type="text" name="name" id="name3"><br>
나이 <input type="text" name="age" id="age3"><br>
전화 <input type="text" name="phone" id="phone3"><br>
	<input type="button" id="formButton3" value="저장"><br>
</form>

<p>4. 서버에서 문자열 받기</p>
<input type="button" id="bt1" value="실행1"><br>
<div id="outputDiv1"></div>

<p>5. 서버에서 객체 받기</p>
<input type="button" id="bt2" value="실행2"><br>
<div id="outputDiv2"></div>

<p>6. 서버에서 객체 받아 표로 만들기</p>
<input type="button" id="bt3" value="실행3"><br>
<div id="outputDiv3"></div>


</body>
</html>