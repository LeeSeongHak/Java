<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.list, .list td, .list tr {
	border: 1px solid;
	border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
}

</style>

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function (){
	$('#formButton').on('click', dddd);
	list();
});

function dddd(){
	var name = $('#name').val();
	var text = $('#text').val();
	if(name != '' && text != ''){
		$.ajax({
			url: 'write',
			type: 'POST',
			data: {name : name, text : text},
			success: function () { 
				alert('저장되었습니다.'); 
				$('#name').val(''); 
				$('#text').val('');
				list();
				},
			error: function (e) {
				alert(JSON.stringify(e)); 
				}
		});
	}
	else if(name == ''){
		alert('이름을 입력하세요.');
	}
	else{
		alert('내용을 입력하세요.');
	}
}

//리플 목록 요청
function list() {
	$.ajax({
		url: 'list',
		type: 'get',
		dataType: 'json',
		success: output,
		error: function (e) { alert('글읽기 실패'); }
	});
}

function output(ob){
 	var str = '<table class="list">';
 	//key = ob의 크기만큼 루프 한다는 것. item = ArrayList ob 안에 들어있는 각 값들.
	$.each(ob, function(key, item){
		str += '<tr>';
		str += '<td class="tdNum">' + item.num + '</td>';
		str += '<td class="tdName">' + item.name + '</td>';
		str += '<td class="tdText">' + item.text + '</td>';
		str += '<td>';
		//datanum은 내가 임의로 만든 것.
		str += '<input type="button" value="삭제" class="buttonDel" datanum = ' + item.num + '>';
		str += '</td>';
		str += '<td>';
		str += '<input type="button" value="수정" class="buttonEdt" datanum = ' + item.num + ' dataName = ' + item.name + '>';
		str += '</td>';
		str += '</tr>';
		str += '<tr><td colspan=4><div id="editDiv' + item.num + '"/></td></tr>';
	});
	str += '</table>';
	//each함수를 이용해 만들고, html을 통해 버튼을 만듦.
	$('#listDiv').html(str);
	$('.buttonDel').on('click', commentDel);
	$('.buttonEdt').on('click', commentEdt);
}
//리플 삭제
function commentDel(){
	//삭제 버튼 누르면 오는 곳
	//현재 이벤트를 발생시킨 것을 this라고 가르킬 수 있음. 사용자정의속성을 마음대로 붙이는 것. 여기서는 datanum.
	var num = $(this).attr('datanum');
	$.ajax({
		url: 'delete',
		type: 'post',
		data: {num : num},
		success: function(){
			alert('성공');
			list();
		},
		error: function(){
			alert('실패');
		}
	})
}
//리플 수정 시작
function commentEdt(){
	var num = $(this).attr('datanum');
	var name = $(this).attr('dataName');
	var div = $('#editDiv' + num);
	var formStr = '<form id="editForm' + num + '">';
	formStr += '<input type="text" style="width:450px;" id="edtText">';
	formStr += '<input type="button" class="btnEdt" value="수정완료" datanum=' + num + ' dataName=' + name + '>';
	formStr += '</form>';
	div.html(formStr);
	$('.btnEdt').on('click', edt);
}

function edt(){
	var num = $(this).attr('datanum');
	var name = $(this).attr('dataName');
	var text = $('#edtText').val();
	$.ajax({
		url: 'edit',
		type: 'post',
		data: {num : num, name : name, text : text},
		success: function(){
			alert('성공');
			list();
		},
		error: function(){
			alert('실패');
		} 
	})
}

</script>
</head>
<body>

<h1>[ 리플 달기 ]</h1>

<!-- 리플 작성 폼 영역 -->
<div id="formDiv">
	<form id="writeForm">
		이름 <input type="text" id="name" name="name" style="width:100px;">
		내용 <input type="text" id="text" name="text" style="width:300px;">
		<input type="button" id="formButton" value="저장">
	</form>
</div>
<br><br>
<!-- 리플 목록 출력 영역 -->
<div id="listDiv"></div>

</body>
</html>