<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join" method="post" onsubmit="return check()">
		아이디 : <input type="text" name="id" id="id"><br>
		비밀번호 : <input type="text" name="password" id="password"><br>
		이름 : <input type="text" name="name" id="name"><br>
		<input type="submit" value="가입하기">
	</form>

</body>
</html>