<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 기본 문법</title>
<script>
	function checkMonth(){
		var month = document.getElementById("month");
		int day;
		switch(month){
		case 1 :
			day = 31; break;
		case 2 :
			day = 28; break;
		case 3 :
			day = 31; break;
		case 4 :
			day = 30; break;
		case 5 :
			day = 31; break;
		case 6 :
			day = 30; break;
		case 7 :
			day = 31; break;
		case 8 :
			day = 31; break;
		case 9 :
			day = 30; break;
		case 10 :
			day = 31; break;
		case 11 :
			day = 30; break;
		case 12 :
			day = 31; break;
		}
	}
</script>
</head>
<body>
<h1>[ JSP 기본 문법 ]</h1>

<%-- JSP의 주석 --%>

<%
	Calendar calendar = Calendar.getInstance();
	int y = calendar.get(Calendar.YEAR);
	int m = calendar.get(Calendar.MONTH);
	int d = calendar.get(Calendar.DATE);
%>

	<p>오늘은 <%=y%>년 <%=m+1%>월 <%=d%>일입니다.</p>
	
	<select>
	<%
		for(int i = 1900;i <= calendar.get(Calendar.YEAR);i++){
	%>
		<option value="<%=i%>"년><%=i %>년
	<%
		}
	%>
	</select>
	
	<select>
		<%
			for(int i = 1;i <= 12;i++){
		%>
				<option value="<%=i%>월" onclick="checkMonth()"><%=i%>월
		<%		
			}
		%>
	</select>
		
</body>
</html>