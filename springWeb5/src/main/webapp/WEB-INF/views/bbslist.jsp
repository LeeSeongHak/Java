<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/css/bbslist.css" rel="stylesheet" type="text/css">
<script>
	function formSubmit(num){
		var f = document.getElementById('form' + num);
		var pw = document.getElementById("password" + num);
		
		if(pw.value.length < 1){
			alert('비밀번호를 입력하세요.');
			return;
		}
		if(confirm('삭제하시겠습니까?')){
			f.submit();
		}
		
	}
</script>
</head>
<body>
	<h1 align="center">
	< 방 명 록 >
</h1>

<table align="center">
	<c:if test="${list.size() > 0 }">
		<c:forEach var="i" begin="0" end="${list.size()-1}" >
			<tr>
				<th>글 번호</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<tr>
				<td>${list.get(i).boardnum}</td>
				<td>${list.get(i).name}</td>
				<td>${list.get(i).inputdate}</td>				
			</tr>
			<tr>
				<th colspan="3">글 내용</th>
			</tr>
			<tr>
				<td colspan="3"><pre>${list.get(i).content}</pre></td>
			</tr>
			<tr>
				<td colspan="3">
					<form action="del2" method="post" id="form${list.get(i).boardnum}">
						<input type="hidden" name="boardnum" value="${list.get(i).boardnum}">
						비밀번호 : <input type="text" id="password${list.get(i).boardnum}" name="password">
						<a href="javascript:formSubmit(${list.get(i).boardnum})">삭제</a>	<%--숫자열이면 그냥 넘기고, 문자열이면 ' ' 로 감싸주기. --%>
					</form>
					<%-- <form action="del" method="post">
						<input type="hidden" name="boardnum" value="${list.get(i).boardnum}">
						비밀번호 : <input type="text" id="password" name="password">
						<input type="submit" value="삭제">
					</form> --%>
				</td>	
			</tr>
		</c:forEach>
	</c:if>
</table><br>
<div align="center">
<a href="write"><button>글쓰기</button></a> &nbsp;&nbsp;&nbsp;&nbsp;
<a href="delete"><button>글삭제</button></a> &nbsp;&nbsp;&nbsp;&nbsp;
<a href="./"><button>홈으로 돌아가기</button></a>
</div>
</body>
</html>