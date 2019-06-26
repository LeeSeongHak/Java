<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		var title = document.getElementById("title");
		var con = document.getElementById("content");
		
		if(title.value == '' || title.value == null){
			alert('제목을 1글자 이상 입력하세요.');
			return false;
		}
		if(con.value == '' || con.value == null){
			alert('내용을 1글자 이상 입력하세요.');
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center">
	<!-- 바이너리 데이터 포함되는 폼. 파일이 안올라가면 enctype 추가했는지 확인하자. 2월 1일 작성. -->
		<form action="write2" method="post" onsubmit="return check()"
			enctype="multipart/form-data">
				글 제목 : <input type="text" size="70" name="title" id="title"><br>
				[ 내 용 ] <br>
				<textarea rows="30" cols="100" name="content" id="content"></textarea><br>
				파일첨부 : <input type="file" name="upload" size="30">
			<input type="submit" value="작성완료">
		</form>
	</div>
</body>
</html>