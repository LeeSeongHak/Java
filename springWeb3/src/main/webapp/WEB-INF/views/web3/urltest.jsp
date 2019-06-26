<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>url 테스트</title>
</head>
<body>
<h1>url 테스트</h1>
<p>현재 경로 : http://localhost:8888/web3/test/urltest</p>
<p>http://localhost:8888/web3/jsp1로 이동</p>

<p><a href="../jsp1">상대경로</a></p>
<p><a href="http://localhost:8888/abc/jsp1">절대경로1</a></p>
<p><a href="/abc/jsp1">절대경로2</a></p>
<p><a href="/jsp1">절대경로3</a></p> <!-- 이 경로는 java와 달리 html에서는 잘못된 경로임. -->
<p><a href="<c:url value="/jsp1" />">URL 태그 사용</a></p>

</body>
</html>