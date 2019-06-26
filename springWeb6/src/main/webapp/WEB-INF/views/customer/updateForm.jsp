<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 개 인 정 보 수 정 ]</title>
</head>
<script>
function update(){
	var f = document.getElementById("form");
	var pw1 = document.getElementById("password1");
	var pw2 = document.getElementById("password2");
	var name = document.getElementById("name");
	
	if(pw1.value.length < 3 && pw1.value.length != 0){
		alert('비밀번호를 3글자 이상 입력하세요');
		return false;
	}
	if(pw1.value != pw2.value){
		alert('입력된 비밀번호와 재확인 비밀번호가 다릅니다.');
		return false;
	}
	if(name.value.length == 0){
		alert('이름을 입력하세요');
		return false;
	}
	if(confirm('수정하시겠습니까?')){
		f.submit();
	}
}
</script>
<body>
	<div align="center">
	<h1>[ 수정하기 ]</h1>
	<form action="update" method="post" id="form" onsubmit="return update()">
		<table>
			<tr>
				<th>아이디</th>
				<td colspan="2">${customer.custid}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="2"><input type="password" id="password1" name="password" size="30"></td>
			</tr>
			<tr>
				<th>비밀번호 재확인</th>
				<td colspan="2"><input type="password" id="password2" size="30"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="2"><input type="text" id="name" name="name" size="30" value="${customer.name}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type="email" id="email" name="email" size="30" value="${customer.email}"></td>
			</tr>
			<tr>
				<th>고객구분</th>
				<td colspan="2">
					<c:if test="${customer.division == 'personal'}">개인</c:if>
					<c:if test="${customer.division != 'personal'}">기업</c:if>
				</td>
			</tr>
			<tr>
				<th>식별번호</th>
				<td colspan="2"><input type="text" id="idno" name="idno" size="30" value="${customer.idno}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="2"><input type="text" id="address" name="address" size="30" value="${customer.address}"></td>
			</tr>
		</table>
		<input type="submit" value="수정하기">
	</form>
	</div>
</body>
</html>