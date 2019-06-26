<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check(){
	//이름, 비밀번호, 글 내용 모두 필수 항목임. 체크할 것!
	var name = document.getElementById("name");
	var pw = document.getElementById("password");
	
	if(name.value.length < 3){
		alert('이름을 3글자 이상 입력하세요.')
		name.focus();	//ID입력란에 포커스 이동
		name.select();	//기존 입력된 문자열을 선택된 상태로 만들어 줌
		return false;
	}
	if(pw.value.length < 3){
		alert('비밀번호를 3글자 이상 입력하세요.')
		pw.focus();
		pw.select();
		return false;
	}	
	return true;
	
	var con = document.getElementById("content");
	con = con.replace("\r\n","<br/>");
}
</script>
<link href="resources/css/writeform.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1 align="center">[ 방명록 글쓰기 ]</h1>
<div align="center">
<form action="write" method="post" onsubmit="return check()">
이      름		<input type="text" id="name" name="name"><br>
비밀번호	<input type="password" id="password" name="password"><br><br>
		<textarea id="content" name="content" rows="5" cols="50"></textarea><br><br>
		<input type="submit" value="완료">
</form>
</div>
</body>
</html>