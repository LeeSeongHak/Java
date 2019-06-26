<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID Check</title>
<script>
function formCheck(){
	var id = document.getElementById('searchId');
	if(id.value.length < 3){
		alert('검색할 아이디를 3글자 이상 입력하세요.');
		return false;
	}
	return true;
}
function selectId(){
	//나를 열어준 창 - 오프너
	var id = opener.document.getElementById('custid');
	var searchid = '${searchId}';
	id.value = searchid;
	this.close();
}
</script>
</head>
<body>
	<h3>[ ID 중복 확인 ]</h3>
	<form action="idCheck" method="post" onsubmit="return formCheck()">
		검색할 ID<input type="text" name="searchId" id="searchId" value="${searchId}">
		<input type="submit" value="검색">
	</form>
<br>
<c:if test="${search}">
	<c:if test="${searchResult == null}">
	<p>사용할 수 있는 ID입니다.</p>
	<p><a href="javascript:selectId()">사용하기</a></p>
	</c:if>
	
	<c:if test="${searchResult != null}">
	<p>이미 사용중인 ID입니다.</p>
	</c:if>
</c:if>
</body>
</html>