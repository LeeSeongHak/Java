<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연습</title>
<script>
var img;

var win;
var w = 300;
var h = 300;
var x = 0;
var y = 0;
var num = 30;
var xnum = num;
var ynum = 0;

var cnt = 0;
var cnt2 = 1;
	function test(){
		while(true){
			cnt++;
			win = window.open('https://pbs.twimg.com/profile_images/941882927725420545/9EvP7Y86_400x400.jpg', 'moveWin', 'width=300,height=300,left=' + x + ',top=' + y);
			setInterval(moveWindow, 20);
			if(cnt==cnt2) {
				cnt2 = cnt + 2;
				cnt = 1;
				return;
			}
		}
	}

	function moveWindow() {
		if (x >= screen.availWidth - w - num && y <= 0) {
			xnum = 0;
			ynum = num;
		}
		if (x >= screen.availWidth - w - num && y >= screen.availHeight - h - num) {
			xnum = -num;
			ynum = 0;
		}
		if (x <= 0 && y >= screen.availHeight - h - num) {
			xnum = 0;
			ynum = -num;
		}
		else if (x <= 0 && y <= 0) {
			xnum = num;
			ynum = 0;
		}
		x += xnum;
		y += ynum;
		win.moveTo(x, y);
		win.focus();
	}


</script>
</head>
<body>
<div align="center"><img id="i" src="https://pbs.twimg.com/profile_images/795103617116041216/KF_iANcj_400x400.jpg" onmouseover="javascript:test()" ></div>
<img src="resources/image/1212.gif">
<p><a href="javascript:closeWindow()">닫기</a></p>
</body>
</html>