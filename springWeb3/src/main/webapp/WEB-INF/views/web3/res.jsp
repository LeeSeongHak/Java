<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리소스</title>
<script src="<c:url value="resources/js/txt.js"/>"></script>
<script src="<c:url value="resources/js/txt2.js"/>"></script>

<link href="resources/css/default.css" rel="stylesheet" type="text/css">

<script>
	function test3(){
		
	}
</script>
</head>
<body>
<h1>[ 리소스 사용 ]</h1>
<img src="<c:url value="resources/images/3.gif"/>"/> <br>

<!-- 외부 JavaScript 파일 사용 -->
<input type="button" value="js 함수 호출" onclick="test()"><br>

<!-- 외부 CSS 파일  -->
<div class="textRed"> css적용 </div>

</body>
</html>