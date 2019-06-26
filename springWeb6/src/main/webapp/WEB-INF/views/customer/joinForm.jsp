<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script>
	//window. 메서드들은 웹브라우저 창을 이용해서 기능하는 것들임.
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
		if(confirm('가입하시겠습니까?')){
			f.submit();
		}
	}
</script>
</head>
<body>
	<div align="center">
	<h1>[ 회원 가입 ]</h1>
	<form action="join" method="post" id="form" onsubmit="return join()">
		<table>
			<tr>
				<th>아이디</th>
				<td colspan="2"><input type="text" id="custid" name="custid" placeholder="필수입력! 3글자 이상, ID중복확인을 이용" size="30" readonly="readonly"></td>
				<td><input type="button" value="ID중복확인" onclick="idCheck()"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="2"><input type="password" id="password1" name="password" placeholder="필수입력! 3글자 이상 입력하라"  size="30"></td>
			</tr>
			<tr>
				<th>비밀번호 재확인</th>
				<td colspan="2"><input type="password" id="password2" size="30" placeholder="필수입력!"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="2"><input type="text" id="name" name="name" size="30" placeholder="필수입력!"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="2"><input type="email" id="email" name="email" placeholder="id@host" size="30"></td>
			</tr>
			<tr>
				<th>고객구분</th>
				<td colspan="2">
					<input type="radio" id="division1" name="division" value=1 checked>personal(개인)
					<input type="radio" id="division2" name="division" value=2>company(기업)
				</td>
			</tr>
			<tr>
				<th>식별번호</th>
				<td colspan="2"><input type="text" id="idno" name="idno" placeholder="개인: 주민번호, 법인: 사업자 번호" size="30"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="2"><input type="text" id="address" name="address" placeholder="시, 동, 구 모두 작성" size="30"></td>
			</tr>
		</table>
		<input type="submit" value="가입하기">
	</form>
	</div>
</body>
</html>