<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jq1</title>

<script src="resources/js/jquery-3.3.1.min.js"></script>

<script>
//초기과정은 ready 안에서 한다.
//기본 선택자(태그, 클래스, 아이디) - 반드시 선택자를 ''로 감싸줘야 한다.
$(document).ready(function() {
	$('h1').css('color', '#00008B');
	$('p').css('color', '#9400D3');
	$('p.bluetext').css('color', '#8B0000');
	$('#redtext').css('color', '#FF1493');
});

//클래스 선택자 - '.클래스명.클래스명'의 형태.
$(document).ready(function() {
	$('h1.item').css('color', 'orange');
	$('.item.select').css('color', 'red');
});

//자손 선택자 - '요소 A > 요소 B'의 형태.div 안에 있는 모든 선택자를 대상.
$(document).ready(function() {
	$('div > *').css('color', 'red');
});

//후손 선택자 - '요소 A 요소 B'의 형태. 요소 A의 후손으로 범위를 한정.
/* $(document).ready(function () {
	$('body *').css('color', 'pink');
}); */

//속성 선택자 - '요소[속성 = 값]'의 형태(=,|=, ~=, ^=, $=, *= 등의 종류가 있다). 기본 선택자 뒤에 붙여 사용하는 것으로서, form 등에 활용.
$(document).ready(function () {
	$('input[type="text"]').val('Hello jQuery..!');
});

//필터 선택자 - ': 기호'를 포함하는 선택자를 의미.속성 선택자를 조금 더 간단한 방법으로 사용 하는 것.
$(document).ready(function () {
	// 5초 후에 코드를 실행합니다.
	setTimeout(function () {
		// 변수를 선언합니다.
		var value = $('select > option:selected').val();
		
		// 출력합니다.
		alert(value);
	}, 5000);
});

//위치 필터 선택자 - '요소:odd(홀수번째 문서 객체 선택) or even(짝수) or first(첫) or last(마지막)'등의 형태.
$(document).ready(function (){
	$('tr:odd').css('background', 'PINK');
	$('tr:even').css('background', '#9F9F9F');
	$('tr:first').css('background', 'yellow');
});

</script>

</head>
<body>
<h1>[ jQuery 기본 문법 ]</h1>
<p>p태그를 이용한 문자열</p>
<p class="bluetext">class를 이용한 문자열</p>
<p id="redtext">id를 이용한 문자열</p>
<img src="resources/image/dd.gif"><br>

<h1 class="item">Header-0</h1>
<!-- class명이 "item ~~~" 인 두가지 이상의 클래스를 가지는 태그도, 첫 태그가 item으로 다른 것과 묶여서 정의된다. 이것만 정의하고싶으면 .item.select 이런식으로 불러오기.-->
<h1 class="item select">Header-1</h1>
<h1 class="item">Header-2</h1>

<div>
	<ul>
		<li>apple</li>
		<li>bag</li>
		<li>cat</li>
	</ul>
</div>

<input type="text" />
<input type="password" />
<input type="radio" />
<input type="checkbox" />
<input type="file" />

<select>
	<option>Apple</option>
	<option>Bag</option>
	<option>Cat</option>
	<option>Dog</option>
	<option>Elephant</option>
</select>

<table>
	<tr><th>이름</th><th>혈액형</th><th>지역</th></tr>
	<tr><th>마이크 밀러</th><th>A</th><th>충북 제천</th></tr>
	<tr><th>마츠모토</th><th>B</th><th>마라도</th></tr>
	<tr><th>왕</th><th>AB</th><th>울릉도</th></tr>
</table>

</body>
</html>