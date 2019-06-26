<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내용 읽기</title>
<link href="../resources/css/readForm.css" rel="stylesheet" type="text/css">
<script>
function editFormSubmit(){
	var e = document.getElementById('edit');
	if(confirm('수정하시겠습니까?')){
		e.submit();
	}	
}
function formSubmit(){
	var f = document.getElementById('form');
	if(confirm('삭제하시겠습니까?')){
		f.submit();
	}	
}
function formIdCheck(){
	var replyId = document.getElementById('${reply.get(i).id}');
	var loginId = document.getElementById('${loginId}');
	if(replyId != loginId){
		alert('본인의 댓글이 아닙니다.');
		return false;
	}
	return true;
}
</script>
</head>
<body>
<div align="center">
	<table class="type09">
				<thead>
					<tr>
					    <th scope="cols">제목</th>
			 		    <td>${read.title}</td>
			 		</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">아이디: ${read.id} / 조회수: ${read.hits} / 작성일: ${read.inputdate}</td>
					</tr>
					<tr>
				   		<th scope="row" colspan="3" width="20px" height="300px">${read.content}</th>
			  		</tr>
			  		<tr>
			  		 <td>첨부파일</td>
			  		 <td></td>
			  		</tr>
			 	</tbody>
	</table>
	<br>
	
<c:if test="${read.id == sessionScope.loginId}">
<!-- 수정폼 -->	
	<form action="edit" method="get" id="edit">
		<!-- 버튼과 input type의 img는 submit 역할을 하기 때문에, 자바스크립트를 거치지 않고 바로 컨트롤러로 보내버린다. -->
		<a href="javascript:editFormSubmit()">글수정</a> &nbsp;&nbsp;&nbsp;&nbsp;
	</form>
	
<!-- /수정폼 -->
<!-- 삭제폼 -->	
	<form action="delete" method="get" id="form">
		<!-- 버튼과 input type의 img는 submit 역할을 하기 때문에, 자바스크립트를 거치지 않고 바로 컨트롤러로 보내버린다. -->
		<a href="javascript:formSubmit()">글삭제</a> &nbsp;&nbsp;&nbsp;&nbsp;
	</form><br>
<!-- /삭제폼 -->
</c:if>	
	
	<a href="../board/board">게시판으로 돌아가기</a>
	
	<br><br>
<c:if test="${sessionScope.loginId != null}">
<!-- 리플폼 -->
	<form id="replyForm" action="replyWrite" method="post">
		<input type="hidden" name="boardnum" value="${read.boardnum}">
	리플내용 : <input type="text" name="text" id="retext" style="width:500px;">
		<input type="submit" value="확인">
	</form>
<!-- /리플폼 --> 

<!-- 리플 출력 -->
<div align="center">
	<c:if test="${reply.size() == 0}">
		댓글이 없읍니다. 첫 댓글을 남기어 보시오.
	</c:if>
	<form action="readForm" method="get">
		<c:if test="${reply.size() > 0}">
		<table class="type09">
			<thead>
				<tr>
					<th scope="cols">글번호</th>
					<th scope="cols">작성자</th>
				    <th scope="cols">리플내용</th>
		 		    <th scope="cols" colspan="3">작성일</th>
		 		</tr>
			</thead>
			
			<c:forEach var="i" begin="0" end="${reply.size() - 1}">	
				<tbody>
					<tr>
			   		 <th scope="row">${i+1}</th>
			   		 <td>${reply.get(i).id}</td>
			   		 <td>${reply.get(i).text}</td>
			   		 <td>${reply.get(i).inputdate}</td>
			   		 <form action="replyEdit", method="POST">
			   		 	<input type="hidden" name="replyNum" value="${replyNum}">
			   		 	<input type="hidden" name="loginId" value="${loginId}">
					 	<c:if test="${i == ${ii}}">
					 		<td><input type="text" id="text" name="text"></td>
					 	</c:if>
					 	<c:otherwise>
					 		<td><a href="replyEdit?replynum=${reply.get(i).replynum}&id=${reply.get(i).id}">수정</a></td>
					 	</c:otherwise>
					 </form>	
					 	<td><a href="replyDelete?replynum=${reply.get(i).replynum}&id=${reply.get(i).id}" onclick="formIdCheck()">삭제</a>
					</tr>
			 	</tbody>
			 </c:forEach>
		</table>
		</c:if>
	</form>
</div>
<!-- /리플 출력 -->
</c:if>
</div>
</body>
</html>