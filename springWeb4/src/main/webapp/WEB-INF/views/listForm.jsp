<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 목록 출력</title>
<link href="resources/css/memberlist.css" rel="stylesheet" type="text/css">
<script>
	function goDelete(id){
		if (confirm("삭제?")){
			location.href='delete2?id=' + id;
		}
	}
</script>
</head>
<body>
<h1>전체 목록 출력</h1>

<table>
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>삭제</td>
	</tr>
	<c:forEach var="i" begin="0" end="${list.size() - 1}">
	<tr>
		<!-- href="value값?id=~~~" 방식임. -->
		<td><a href="search2?id=${list.get(i).getId()}">${list.get(i).getId()}</a></td> <!-- id=~~가 get방식이므로 post 방식으로 만든 메소드를 같은 value의 get방식 메소드로 하나 더 만들어줘야함. -->
		<td>${list.get(i).password}</td>
		<td>${list.get(i).name}</td>
		<td><a href="delete2?id=${list.get(i).id}"><button>삭제</button></a></td>
	</tr>
	
	<!-- 하이퍼링크를 이용한 삭제 기능 -->
	<td><a href="delete2?id=${list[i].id}">삭제</a></td>
	
	<!-- 버튼과 자바스크립트를 이용한 삭제 기능 -->
	<td><input type="button" value="삭제" onclick="goDelete('${list[i].id}')"></td>
	
	</c:forEach>
</table>


</body>
</html>