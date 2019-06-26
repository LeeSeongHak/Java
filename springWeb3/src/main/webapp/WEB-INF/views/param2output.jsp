<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="param2Post" method="post">
	문자열 : <input type="text" name="str"><br>
	숫자 : <input type="text" name="num"><br>
	라디오버튼	<input type="radio" name="radio" value="선택1">선택1
			<input type="radio" name="radio" value="선택2">선택2
			<br>
	셀렉트	<select name="sel">
				<option value="옵션1">옵션1</option>
				<option value="옵션2">옵션2</option>
				<option value="옵션3">옵션3</option>
			</select>
			<br>
			<textarea rows="3" cols="30" name="text"></textarea>
			<br>
			<input type="checkbox" name="check" value="체크1">체크1
			<input type="checkbox" name="check" value="체크2">체크2
			<input type="checkbox" name="check" value="체크3">체크3
			<br>
			<input type="submit" value="전송">
</form>
</body>
</html>