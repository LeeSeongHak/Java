<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 게 시 판 ]</title>
<link href="../resources/css/boardForm.css" rel="stylesheet" type="text/css">
<script>
function formSubmit(page){
	var f = document.getElementById('pagingForm');
	var p = document.getElementById('page');
	p.value = page;
	f.submit();
}
</script>
</head>
<body>
<div align="center"><h1>[ 게 시 판 ]</h1></div>
	글 갯수 : ${navi.totalRecordsCount}<br>
	${navi.totalPageCount} 페이지 중 ${navi.currentPage}페이지<br>
	<div align="right"><a href="write"><button> 글쓰기</button></a></div>
	<div align="center">
	<c:if test="${list.size() == 0}">
		출력할 게시글이 없습니다.
	</c:if>
	<form action="board" method="get">
		<c:if test="${list.size() > 0}">
		<table class="type09">
				<thead>
					<tr>
						<th scope="cols">글번호</th>
						<th scope="cols">작성자</th>
					    <th scope="cols">제목</th>
			 		    <th scope="cols">작성일</th>
			 		    <th scope="cols">조회수</th>
			 		</tr>
				</thead>
			
			<c:forEach var="i" begin="0" end="${list.size() - 1}">	
				<tbody>
					<tr>
			   		 <th scope="row">${list.get(i).boardnum}</th>
			   		 <td>${list.get(i).id}</td>
			   		 <!-- readForm?boardnum=${list.get(i).boardnum}에서 boardnum이 name 부분역할을 함. 즉, name = "boardnum"에 값을 get방식으로 보내주는 것과 같음. -->
			   		 <td><a href="readForm?boardnum=${list.get(i).boardnum}">${list.get(i).title}</a></td>
			   		 <td>${list.get(i).inputdate}</td>
			   		 <td>${list.get(i).hits}</td>
					</tr>
			 	</tbody>
			 </c:forEach>
		</table>
		</c:if>
	</form>
	</div>
	
<div id="navigator" align="center">
<!-- 페이지 이동 부분 -->                     
	<%-- <a href="board?page=${navi.currentPage = 1}">첫 페이지로</a> &nbsp;&nbsp;  --%>
	<a href="javascript:formSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:formSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:formSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:formSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:formSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a> &nbsp;&nbsp;
	<%-- <a href="board?page=${totalPageCount}">마지막 페이지로</a> --%>
	
<!-- /페이지 이동 끝 -->

<br><br>

<!-- 검색폼 -->
<form id="pagingForm" method="get" action="board">
	<input type="hidden" name="page" id="page" value="1">
	제목 : <input type="text" name="searchText" value="${text}">
	<input type="button" onclick="formSubmit(1)" value="검색">
</form>
<!-- /검색폼 --> 
</div>
		
	<br>
	<div align="center">
		<a href="../"><button>홈으로 돌아가기</button></a>
	</div>
</body>
</html>