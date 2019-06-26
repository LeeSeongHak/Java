<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>js2</title>
<script>
var ar = [2,5,10,7,6,3];

//push - 배열 끝에 해당 요소 추가. pop - 배열 맨 끝 요소 하나 삭제. sort - 문자열정렬. splice(a, b, c) - ar[a]부터 b번째까지 없애고 c로 대체.
//reverse - 역순배열. 
console.log('배열내용:' + ar);
ar.push("ㅎㅇ");
ar.push("ㅎㅇ2");
console.log('배열내용:' + ar);
ar.pop();
console.log('배열내용:' + ar);
//sort는 '문자열 정렬'. 단어 길이에 상관없이 '첫번째 글자'에 의해 정렬되기 때문에 2, 5, 10, 7 정렬시 10, 2, 5, 7 순으로 정렬되는 것.
ar.sort();
console.log('배열내용:' + ar);
ar.splice(2, 2, 99);
console.log('배열내용:' + ar);
ar.reverse();
console.log('배열내용:' + ar);
ar.shift();
console.log('배열내용:' + ar);

function arrayTest1() {
	for(i = 0; i <= ar.length-1 ; i++){
		alert(ar[i]);
	}
}

//사용자의 화면에서 볼 수 있는 콘솔 내용. 해당 화면의 소스 검사를 통해 콘솔창에서 확인가능.
console.log('배열내용:' + ar);

var intervalID = setInterval(array, 1000);
var n = 0;

function array(){
	var dv = document.getElementById("div1");
	dv.innerHTML = ar[n];
	n++;
	if(n > ar.length - 1){
		n = 0;
	}
}

function arrayTest2(){
	var text = document.getElementById('text');
	if(text.value == "") return;
	ar.push(text.value);
	text.value ='';
	text.focus();
	console.log(ar);
}

</script>
</head>
<body>

<h1>[ JavaScript 기본 문법 ]</h1>

<li><a href="javascript:arrayTest1()">배열 사용</a></li>
<div id = "div1"></div>

<li>배열에 내용 추가</li>
<input type="text" id="text">
<input type="button" value="추가" onclick="arrayTest2()">
<br>

<li><a href="javascript:"></a></li>
<li><a href="javascript:"></a></li>
<li><a href="javascript:"></a></li>

</body>
</html>