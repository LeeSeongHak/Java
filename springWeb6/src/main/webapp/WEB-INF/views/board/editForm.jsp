<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function formCheck(){
	var t = document.getElementById('title');
	var c = document.getElementById('content');
	
	if(t.value.length == 0){
		alert("제목을 한 글자 이상 입력하세요.");
		return false;
	}
	if(c.value.length == 0){
		alert("내용을 한 글자 이상 입력하세요.");
		return false;
	}
	return true;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기</title>
<link href="../resources/css/editForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
	<form action="edit" method="post" onsubmit="return formCheck()"
		enctype="multipart/form-data">
		<table class="type09">
					<thead>
						<tr>
						    <th scope="cols">제목</th>					
				 		    <td><input type="text" id="title" name="title" value="${edit.title}"></td>
				 		</tr>
					</thead>
					<tbody>
						<tr>
					   		<th scope="row" colspan="3" width="20px" height="300px"><textarea rows="25" cols="140" value="${edit.content}" id="content" name="content"></textarea></th>
				  		</tr>
				  		<tr>
				  			<c:if test="${edit.originalfile != null}">
								<td colspan="3">기존 파일 : ${edit.originalfile} / 파일 첨부 : <input type="file" name="upload" size="30"></td>
							</c:if>
							<c:if test="${edit.originalfile == null}">
				  				<td colspan="3">파일 첨부 : <input type="file" name="upload" size="30"></td>
				  			</c:if>
				  		</tr>
				  		<td>
				  			<input type="home" value="돌아가기">
				  			<input type="submit" value="수정하기">
				  		</td>
				  		<td><a href="readForm?boardnum=${edit.boardnum}">돌아가기</a></td>
				 	</tbody>
		</table>
	</form>
</div>
</body>
</html>