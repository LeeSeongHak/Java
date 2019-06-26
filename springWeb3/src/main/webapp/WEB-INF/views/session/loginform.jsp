<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function check(){
		var id = document.getElementById("id");
		var pw = document.getElementById("password");
		
		if(id.value.length < 3){
			alert('아이디를 3글자 이상 입력하세요.')
			id.focus();	//ID입력란에 포커스 이동
			id.select();	//기존 입력된 문자열을 선택된 상태로 만들어 줌
			return false;
		}
		if(pw.value.length < 3){
			alert('비밀번호를 3글자 이상 입력하세요.')
			pw.focus();
			pw.select();
			return false;
		}	
		return true;
	}
	<c:if test="${error != null}">
		alert('${error}');
	</c:if>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>
</head>
<body>

	<form action="login" method="post" onsubmit="return check()">
		아이디 : <input type="text" name="id" id="id"><br>
		비밀번호 : <input type="password" name="password" id="password"><br>
		<%-- <div class="erMsg">${error}</div> --%>
		
		<input type="submit" value="전송">
	</form>

</body>
</html>