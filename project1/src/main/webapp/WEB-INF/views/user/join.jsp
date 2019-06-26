<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="resources/css/home.css" rel="stylesheet" type="text/css">
<title>Join</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
function idCheck(){
	//("창 링크(controller의 action값. 주소창에 직접 링크 띄우는 것이므로 get방식.)", "창 이름", "창의 모양")
	window.open("idCheck", "idWin", "top=200, left=500, width=400, height=400, menubar=no");
}

function join(){
	var f = document.getElementById("form");
	var id = document.getElementById("custid");
	var pw1 = document.getElementById("password1");
	var pw2 = document.getElementById("password2");
	var name = document.getElementById("name");
	var country = document.getElementById("country");
	var region = document.getElementById("region");

	if(id.value.length < 3){
		alert('아이디를 3글자 이상 입력하세요');
		return false;
	}
	if(pw1.value.length < 3){
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
	if(country.value.length == 0){
		alert('국가를 입력하세요');
		return false;
	}
	if(region.value.length == 0){
		alert('지역을 입력하세요');
		return false;
	}
	if(confirm('가입하시겠습니까?')){
		f.submit();
	}
}
</script>
</head>
<body>
<br><br><br><br><br>
<div class="join" align="center">
    <h1><font color="white">회원가입</font></h1>
    <form action="join" method="post" id="form" onsubmit="return join()">
		<table>
			<tr>
				<th><font color="white">아이디</font></th>
				<td colspan="2"><input type="text" id=custid" name="custid" placeholder="현재 사용중인 이메일을 입력하세요." size="30"></td>
				<!-- <td><input type="button" value="ID중복확인" onclick="idCheck()"></td> -->
			</tr>
			<tr>
				<th><font color="white">비밀번호</font></th>
				<td colspan="2"><input type="password" id="password1" name="password" placeholder="3글자 이상 입력하세요."  size="30"></td>
			</tr>
			<tr>
				<th><font color="white">비밀번호 재확인</font></th>
				<td colspan="2"><input type="password" id="password2" size="30" placeholder="비밀번호를 다시 한 번 입력하세요."></td>
			</tr>
			<tr>
				<th><font color="white">이름</font></th>
				<td colspan="2"><input type="text" id="name" name="name" size="30" placeholder="너의 이름은"></td>
			</tr>
			<tr>
				<th><font color="white">거주 국가</font></th>
				<td colspan="2"><input type="text" id="country" name="country" size="30" placeholder="너의 국가는"></td>
			</tr>
			<tr>
				<th><font color="white">거주 지역</font></th>
				<td colspan="2"><input type="text" id="region" name="region" size="30" placeholder="너의 지역은"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" size="30" value="가입하기">
			</tr>
		</table>
	</form>
</div>

</body>
</html>