<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
var arr = ['1.gif', '2.gif', '1212.gif', '1213.gif', '3.gif', 'dd.gif']
var i = 0;

//ready
$(document).ready(function(){
	$('#bt1').on('click', test1);
	$('#bt2').on('click', test2);
	$('#bt3').on('click', test3);
	$('#bt4').on('click', test4);
	$('#img1').on('click', imageTest);
	$('#bt5').on('click', linkDel);
	setInterval(imgChange, 3000);
	$('#bt6').on('click', docRead);
	$('#bt7').on('click', docEdit);
});

//css 꾸밀 때 유용한 것들.
//클래스명 추가 
function test1(){
	$('.text1').addClass('text3');
	$('#p1').addClass('text3');
}

//클래스명 제거
function test2(){
	$('#p1').removeClass('text3');
}

function test3(){
	$('p').addClass('text4');
}

function test4(){
	var ar = [ 10, 20, 30, 40 ];
	//each 함수 : 배열의 갯수만큼 출력됨. .each앞에는 배열, 뒤에는 함수가 들어감. i는 index로 배열의 순서. n은 그 배열의 한 요소를 가리킴(자료형 매번 다를 수 있음).
/* 	$(ar).each(function (i, n) {
		alert('i=' + i + ',n=' + n);
	}); */
	
	var sar = [ 'aaa', 'bbbb', 'cc'];
	//배열의 내용과 각 글자수
	$(sar).each(function (i, str) {
		alert('i= ' + i + ',str= ' + str + ', 글자수= ' + str.length);		
	});
}

//그림 누를때마다 바뀌게 하는것. 여러개 할 때에는 전역변수로 배열 만들고 클릭할때마다 하나씩 바귀도록 하면 됨.
function imageTest(){
	var s = $('#img1').attr('src');
	if(s == 'resources/image/1212.gif') {
		$('#img1').attr('src','resources/image/dd.gif');
	}
	else{
		$('#img1').attr('src','resources/image/1212.gif');
	}
}

function linkDel(){
	$('#naver').removeAttr('href');
}

function imgChange(){
	$('#imgView').attr('src', 'resources/image/' + arr[i]);
	i++;
	if(i == arr.length - 1){
		i = 0;
	}
}

function docRead(){
	var a = $('#outputDiv').html();
	var b = $('#outputDiv').text();
	//alert('a = ' + a + ', b = ' + b);
	
	//html은 태그를 구분하기 때문에, $('p')가 여러개일 경우 이를 배열로 만들어줌. text는 그냥 그 태그가 적힌 것들의 모든 글을 가져옴.
	var c = $('p').html();
	var d = $('p').text();
	//alert('c = ' + c + ', d = ' + d);
	
	$('p').each(function (i, ob) {
		alert($(ob).html());
	});
}

//문서나 입력양식 추가할 때 이용.
function docEdit(){
	var text = $('#inputDiv').html();
	
	text = text + '입력 : <input type = "text"><br>';
	
	$('#inputDiv').html(text);
	alert(text);
}

</script>
<style>
.text1 { color: blue; font-size: 10px; }
.text2 { color: red; font-size : 20px; }
.text3 {font-size: 30px; font-weight: bolder; }
.text4 {text-align: center; border: 1px solid blue; }
</style>

</head>
<body>
<h1>[ 문서 객체 다루기]</h1>
<input type="button" id="bt1" value="클래스 속성 추가"><br>
<input type="button" id="bt2" value="클래스 속성 제거"><br>
<input type="button" id="bt3" value="클래스 전체 추가"><br>
<input type="button" id="bt4" value="배열"><br>

<p class="text1">p태그 사용. text1 클래스</p>
<p class="text2">p태그 사용. text2 클래스</p>
<p id="p1">p태그 사용. 클래스 없음</p>

<!-- 이미지를 클릭하면 다른 그림으로 바뀐다 -->
<img src="resources/image/1212.gif" id="img1"><br><br>

<!-- 링크를 누르면 네이버로 이동. "링크제거" 버튼을 누른 후에는 이동 안함 -->
<input type="button" id="bt5" value="링크 제거">
<a href="http://www.naver.com/" id="naver">다른 사이트로 이동</a><br><br>

<!-- 3초 간격으로 다른 이미지로 바뀜 -->
<img src="resources/image/1213.gif" id="imgView"><br>

<!-- 문서 객체 수정 -->
<input type="button" id="bt6" value="문서 객체 내부 읽기"><br>>
<div id="outputDiv">이곳에 뭔가 출력</div>

<input type="button" id="bt7" value="문서 객체 내부 수정">
<div id="inputDiv">
	입력 : <input type="text"><br>
</div>


</body>
</html>