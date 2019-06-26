<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>[ project1 ]</title>
</head>
<body>

<c:choose>
	<c:when test="${sessionScope.loginId == null}">
		<h3 align="center"><a href="login"> 로그인 </a></h3>
		<h3 align="center"><a href="join"> 회원가입 </a></h3>
	</c:when>
	<c:otherwise>
		<h3 align="center"><a>${sessionScope.loginId}님(${sessionScope.loginName} 님)이 로그인하였습니다.</a></h3>
		<h3 align="center"><a href="logout"> 로 그 아 웃 </a></h3>
		<h3 align="center"><a href="updateForm"> 회원정보수정 </a></h3>
		
	</c:otherwise>
</c:choose>
<h3 align="center"><a href="board/board"> 게시판 가기 </a></h3>


</body>
</html>
