<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>[ VO 객체로 전달 ]</h1>

<form action="param3form" method="post">
	이름 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>
	전화 : <input type="text" name="phone"><br>
	주소 : <input type="text" name="address"><br>
	메모 : <textarea rows="5" cols="30" name="textarea"></textarea>
	<input type="submit" value="전송">
</form>
</body>
</html>