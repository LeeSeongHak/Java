<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<li>숫자 출력</li>
${number}<br>

<c:if test="${number > 100}">
<p>number는 100보다 크다.</p>
</c:if>

<c:if test="${number < 100 }">
<p>number는 100보다 작다.</p>
</c:if>

<li>문자열 출력</li>
<h1>${str}<br></h1>

<c:if test="${str == '<marquee direction=up scrollamount=9 > abcd </marquee>'}">
<p>str은 abcd다.</p>
</c:if>

<li>List 출력</li>
${list}<br>
<li>phone 출력</li>
<h1> ${phone} </h1> <br> 

<li>data 출력</li>
<h1>${data}<br></h1>

<li>forEach 태그</li>
<c:forEach var="cnt" begin="1" end="5">
	<p>반복${cnt}</p>
</c:forEach>

<c:forEach var="i" begin="0" end="${list.size() - 1}">
	<p>${list.get(i)} / ${list[i]}</p>
</c:forEach>

<c:forEach var="value" items="${list}">
	<p>${value}</p>
</c:forEach>

<c:forEach var="i" begin="1" end="5">
	<p><c:if test="${str == '<marquee direction=up scrollamount=9 > abcd </marquee>' && number > 100 }">
		${i}
	</c:if></p>
</c:forEach>

<c:forEach var="value" items="${plist}">
	<p>${value}</p>
</c:forEach>

<table border="1">
	<tr>
		<td>이름</td>
		<td>나이</td>
		<td>연락처</td>
		<td>지역</td>
	</tr>
	<c:forEach var="i" begin="1" end="${plist.size() - 1}">
	<tr>
		<td>${plist.get(i).name}</td>
		<td>${plist.get(i).age}</td>
		<td>${plist.get(i).phone}</td>
		<td>${plist.get(i).address}</td>
	</tr>
	</c:forEach>
</table>

<c:forEach var="i" begin="0" end="${plist.size() - 1}">
	<p>${plist.get(i).name}</p>
</c:forEach>
<br><br>

<li>choose, when, otherwise 태그</li>
<c:choose>
	<c:when test="${number >= 100}">
		숫자가 100이상입니다.<br>
	</c:when>
	<c:otherwise>
		숫자가 100 이하입니다.<br>
	</c:otherwise>
</c:choose>
<br><br>

<li>foreach태그 안에 choose태그 넣어보기</li>
<li>choose태그에서는 when태그에 한번 걸리면 그 뒤에는 실행 안하고 바로 끝낸다. 따라서 각 경우당 when or otherwise는 1번만 실행한다.</li>
<c:forEach var = "i" begin="1" end="${plist.size() -1}">
	<c:choose>
		<c:when test="${plist.get(i).name == '이'}">
			 당신의 성은 ${plist.get(i).name} 입니다.<br>
		</c:when>
		<c:when test="${plist.get(i).age >= 20}">
			 당신의 나이는 ${plist.get(i).age} 입니다.<br>
		</c:when>
		<c:otherwise>
			 당신은 '이'가 아니고 20세 이상이 아닙니다.<br>
		</c:otherwise>
	</c:choose>
</c:forEach>
<br><br>

<li>문자열 분리 - forTokens</li>
	<p>${phone1}</p>

 		<c:forTokens var="token" items="${phone1}" delims="-">
		<p>분리된 문자열 : ${token}</p>
		</c:forTokens>

<li>특수문자 출력 - out</li>
	<p>${data}</p>
	<p><c:out value="${data}"></c:out>
	
<li>URL생성 - url</li>
<c:url value="/jsp1"></c:url>

<p><a href="/jsp1">jsp1로 이동</a></p>
<%-- html에서 정확한 경로를 쓰고 싶으면 아래와 같이 url 태그를 이용해서 써야함. --%>	
<p><a href="<c:url value="jsp1"></c:url>">jsp1로 이동</a></p>	
	
	
</body>
</html>