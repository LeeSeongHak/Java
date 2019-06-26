<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 업 데 이 트 확 인 ]</title>
</head>
<body>
	<div align="center">
	<h1>[ 수정된 개인정보 ]</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td colspan="2">${customer.custid}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="2">${customer.password}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="2">${customer.name}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2">${customer.email}</td>
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
				<td colspan="2">${customer.idno}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="2">${customer.address}</td>
			</tr>
		</table>
		<a href="./"><button value="홈으로">홈으로</button></a>
	</div>
</body>
</html>