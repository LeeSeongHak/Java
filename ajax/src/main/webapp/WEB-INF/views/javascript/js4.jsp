<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>js4</title>
<script>
var win;
function test1() {
	win = window.open('', 'child(창이름)', 'width=600, height=600, left=0, top=0', true);
}

function test2() {
	win.resizeBy(10,10);
	win.moveBy(10,10);
	win.focus();
}

function test3() {
	//document는 혼자 열릴 수 없음. 평소에는 this.document.write로 this가 생략되어 있는 상태로 현재 창에 뜸. this 자리에 열고자 띄우고자 하는 창의 변수명을 써주면 됨!
	win.document.write('alsdkjflsjdf');
}

function test4() {
	setInterval(function(){
		win.moveBy(10, 10);
	}, 50);
	win.focus();
}

function test5() {
	var w = screen.width;
	var h = screen.height;
	//alert("가로:" + w + "\n세로:" + h);
	//새 창을 화면의 1/2 크기로 정중앙에 연다.
	win = window.open('','','width=' + w/2 + ',height=' + h/2 + ',left=' + w/4 +',top=' + h/4);
}

function test6() {
	var url = location.href;
	alert('현재URL:' + url);
	var url = 'http://www.naver.com';
	location.href = url;
}

function test7() {
	var user = navigator.userAgent;
	var words = ['Mobile', 'Android', 'iPhone', 'Samsung'];
	var i;
	//alert(user);
	var cnt = 0;
	for(i = 0; i < words.length; i++){
		if(user.match(words[i]) != null){
			cnt ++;
		}
	}
	//모바일로 접속했을 때에는 http://localhost:8888/ajax/mobile로 이동
	if(cnt != 0){
		location.href = 'http://172.30.1.25:8888/ajax/mobile';
	}
	//pc로 접속했을 때에는 http://localhost:8888/ajax/pc로 이동
	else{
		location.href = 'http://localhost:8888/ajax/pc';
	}
}

</script>
</head>
<body>
<h1>[ 브라우저 객체 모델 ]</h1>
<p><a href=javascript:test1()>window 객체</p>
<p><a href=javascript:test2()>window 객체2</a></p>
<p><a href=javascript:test3()>document 객체</a></p>
<p><a href=javascript:test4()>window 창 옮기기</a></p>
<p><a href=javascript:test5()>screen 객체</a></p>
<p><a href=javascript:test6()>location 객체</a></p>
<p><a href=javascript:test7()>navigator 객체</a></p>

</body>
</html>