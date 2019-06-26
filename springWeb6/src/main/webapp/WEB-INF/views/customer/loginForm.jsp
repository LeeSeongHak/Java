<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로 그 인</title>
</head>
<script>
function check(){
	var id = document.getElementById("custid");
	var pw = document.getElementById("password");
	
	if(id.value.length < 3){
		alert('아이디를 3글자 이상 입력하세요.');
		return false;
	}
	
	if(pw.value.length < 3){
		alert('비밀번호를 3글자 이상 입력하세요.');
		return false;
	}
	return true;
}
</script>
<body>
<div align="center">
<h3>[ 로 그 인 ]</h3>
<form action="login" method="post" onsubmit="return check()">
	아이디 <input type="text" id="custid" name="custid">
	비밀번호 <input type="text" id="password" name="password">
	<input type="submit" value="로그인하기">
</form>
</div>
</body>
</html>