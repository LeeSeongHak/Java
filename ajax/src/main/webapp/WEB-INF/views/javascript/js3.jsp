<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>js3</title>
<script>
function stringTest1(){
	var text = document.getElementById('text');
	var output = document.getElementById('output');
	var n = text.value.length;
	output.innerHTML = n;
}

function stringTest2(){
	var text = document.getElementById('text');
	var output2 = document.getElementById('output2');
	var s = text.value.charAt(0);
	output2.innerHTML = s;
}

</script>
</head>
<body>
<h1>[ JavaScript의 객체 ]</h1>

<p>문자열 입력 : <input type="text" id="text"></p>
<div id="output"></div>
<p><input type="button" value="문자열 길이" onclick="stringTest1()"></p>
<div id="output2"></div>
<p><input type="button" value="0번 글자" onclick="stringTest2()"></p>

</body>
</html>