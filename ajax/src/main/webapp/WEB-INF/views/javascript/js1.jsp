<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>js1</title>
<script>

/* //3초마다 함수를 실행합니다.
setTimeout(function () {
	alert('3초가 지났습니다. ㅇㅂㅇ!');
}, 3000);

//1초마다 함수를 실행합니다.
var intervalID = setInterval(function (){
	alert('<p>' + new Date() + '</p>');
}, 1000);

//10초 후 함수를 실행합니다.
setTimeout(function (){
	//타이머를 종료합니다
	clearInterval(intervalID);
}, 10000); */

var intervalIID = setInterval(time, 1000);
var n = 1;
function time(){
var dvv = document.getElementById("div2");
dvv.innerHTML = n + '초';
n++;
}

function test1(){
	alert('test1() 실행');
}
function test2(str, num){
	alert('전달된 문자열 : ' + str);
	var s = sum(num);
	alert(num + '까지의 합계 : ' + s);
}

function sum(n){
	var s = 0;
	for (var i = 1; i <= n; i++){
		s += i;
	}
	return s;
}

//전역변수 num1은 새로고침하면 초기화됨.
var num1 = 0;
function test3() {
	var num2 = 0;
	num1++;
	num2++;
	alert('num1 : ' + num1 + '\nnum2 : ' + num2);
}

function test4() {
	//주로 새창 띄울 때 그 창에 띄울 내용을 만들 때 write를 씀. 단, 현재 페이지에서 벗어나므로 현재 값을 유지하려면 innerHTML을 사용해야한다.
	document.write('출력한 내용');
}

function test5() {
	var dv = document.getElementById("div1");
	dv.innerHTML = '출력한 내용';
}

function test6() {
	var sel = confirm('계속 하시겠습니까?');
	alert(sel);
	var input = prompt('입력하세요');
	alert(input);
	//정수인경우는 곱하기 2해서 결과 출력. 아닌 경우는 계산할 수 없다는 메세지 출력.
	if(isNaN(input)){
		alert('숫자가 아닙니다.');
	}
	else{
		var n = parseInt(input);
		n = n * 2
		alert(n);
		alert(n * 3);
	}
}

</script>
</head>
<body>
<!--사용자에게 보이는 주석 -->
<%--사용자에게 안보이는 주석--%>
<h1>[ JavaScript 기본 문법 ]</h1>
<ul>
<li><a href="javascript:test1()">함수 정의, 호출</a></li>
<li><a href="javascript:test2('abc',5)">parameter의 전달과 리턴값</a></li>
<li><a href="javascript:test3()">전역변수와 지역변수(로컬변수)</a></li>
<li><a href="javascript:test4()">출력1 - write()함수</a></li>
<li><a href="javascript:test5()">출력2 - innerHTML</a></li>
<div id="div1"></div>
<li><a href="javascript:test6()">기타 함수</a></li>
<div id="div2"></div>
<li><a href="javascript:test()"></a></li>
<li><a href="javascript:test()"></a></li>
<li><a href="javascript:test()"></a></li>
</ul>
</body>
</html>