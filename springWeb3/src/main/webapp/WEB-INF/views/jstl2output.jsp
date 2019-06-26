<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="ko" scope="request" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${num1} <br>
	${num2} <br>
	${num3} <br>
	
	<c:choose>
		<c:when test="${num1 >= 100}">
			num1은 100보다 큽니다.<br>
		</c:when>
		<c:otherwise>
			num1은 100보다 작습니다.<br>
		</c:otherwise>
	</c:choose>
	<br><br>

	${today}
	<br>
	<li>fmt:parseDate type 속성 - 기본값 : date</li>
	<fmt:formatDate value="${today}" type="time"/><br>
	<fmt:formatDate value="${today}" type="date"/><br>
	<fmt:formatDate value="${today}" type="both"/><br>
	<br>
	<li>fmt:parseDate dateStyle 속성 - 기본값 : default</li>
	<fmt:formatDate value="${today}" type="date" dateStyle="default"/><br>
	<fmt:formatDate value="${today}" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${today}" type="date" dateStyle="medium"/><br>
	<fmt:formatDate value="${today}" type="date" dateStyle="long"/><br>
	<fmt:formatDate value="${today}" type="date" dateStyle="full"/><br>
	<br>
	<li>fmt:parseDate timeStyle 속성 - 기본값 : default<li>
	<fmt:formatDate value="${today}" type="time" timeStyle="default"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="short"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="medium"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="long"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="full"/><br>
	<br>
	<li>fmt:parseDate pattern 속성</li>
	<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 E요일"/><br>
	<fmt:formatDate value="${today}" pattern="hh시 mm분 55초"/><br>
	<!-- 01/10 10:33 형식으로 출력해보기 -->
	<fmt:formatDate value="${today}" pattern="MM/dd hh:mm"/>
	<br><br>		
	
	
	<p>${num1}</p>
	<fmt:formatNumber value="${num1}" pattern="#,#.00" /><br>
	<fmt:formatNumber value="${num2}" pattern="#,###.00" /><br>
	<fmt:formatNumber value="${num3}" pattern="#,###.00" /><br>
	<fmt:formatNumber value="${num3}" pattern="0.0 %" /><br>
	
	
	
</body>
</html>