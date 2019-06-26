<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<!-- 쿠키를 이용한 방문 횟수 카운트 -->
<p>${cnt}번째 방문입니다.</p>

<c:choose>
	<c:when test="${id == null}">
		<p align="right"><b>로그인이 필요합니다.</b></p>
	</c:when>
	<c:otherwise>
		<p align="right"><b>${sessionScope.id}님 로그인 중입니다.</b></p>
	</c:otherwise>
</c:choose>

<h1>[ springWeb3 예제 ]</h1>

<ol>
	<li><p>서버 - 클라이언트의 값 전달</p></li>
	<ul>
		<li><p><a href="param1">GET방식으로 parameter 전달</a></p></li>
		<li><p><a href="param1?name=a&num=2">GET방식으로 parameter 전달</a></p></li>		
		<li><p><a href="param2">POST방식으로 parameter 전달</a></p></li>
		<li><p><a href="param3">VO객체로 parameter 전달</a></p></li>
		<li><p><a href="">서버에서 클라이언트로 보내기</a></p></li>
	</ul>
	
	<li><p>JSP & EL & JSTL</p></li>
	<ul>
		<li><p><a href="jsp1">JSP 기본 문법</a></p></li>
		<li><p><a href="jstl1">EL&JSTL1</a></p></li>
		<li><p><a href="jstl2">JSTL2 (포멧팅 라이브러리)</a></p></li>
		<li><p><a href="jstl3">JSTL3 (문자열 함수)</a></p></li>
	</ul>

	<li><p>리소스 사용</p></li>
	<ul>
		<li><p><a href="res">리소스 사용</a></p></li>
		<!-- 
		ResourceController 클래스 새로 정의하여 /web3/res 경로로 접속
		이미지 파일 준비 (jpg, gif, png 등)
		images 폴더를 만들고 그 안에 이미지 파일 저장
		 -->
	</ul>
	
	<li><p>url 테스트</p></li>
	<ul>
		<li><p><a href="test/urltest">url 테스트</a></p></li>
	</ul>
	
	<li><p>세션과 쿠키</p></li>
	<ul>
		<li><p><a href="session1">세션사용</a></p></li>
		<li><p><a href="session2">세션에 정보 저장</a></p></li>
		<li><p><a href="session3">세션 정보 삭제</a></p></li>
		<c:choose>
			<c:when test="${id == null}">
				<li><p><a href="login">로그인</a></p></li>
			</c:when>
			<c:otherwise>
				<li><p><a href="logout">로그아웃</a></p></li>
			</c:otherwise>
		</c:choose>
	</ul>
	
	<li><p>쿠키 사용</p></li>
	<ul>
		<li><p><a href="cookie1">쿠키 저장</a></p></li>
		<li><p><a href="cookie2">쿠키 읽기1</a></p></li>
		<li><p><a href="cookie3">쿠키 읽기2</a></p></li>
		<li><p><a href="cookie4">쿠키 삭제</a></p></li>
	</ul>
	
		<li><p></p></li>
	<ul>
		<li><p><a href=""></a></p></li>
		<li><p><a href=""></a></p></li>
		<li><p><a href=""></a></p></li>
	</ul>
	
</ol>
</body>
</html>
