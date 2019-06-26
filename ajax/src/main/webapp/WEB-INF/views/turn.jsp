<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>뺑글뺑글</title>
    <style>
        body{
            position: relative;
        }
        #sun{
            position: absolute;
            left:200px;
            top:200px;
            width:200px;
            height: 200px;
            background: url('sunny.gif');
            background-size: 200px;
        }
        #earth{
            position: absolute;
            left:500px;
            top:250px;
            width:100px;
            height:100px;
            background: url('earth.png') no-repeat;
            background-size: 100px;
        }
    </style>
    <script>
        var inter;
        var gak=0;
        var t1;
        var checkInterval = false;

        function doMove(){
            if(!checkInterval){
                t1 = setInterval(function(){
                var x=250+Math.sin(gak)*200;
                var y=250+Math.cos(gak)*200;
                gak += 0.1;

                document.getElementById('earth').style.left=x+"px";
                document.getElementById('earth').style.top=y+"px";
                checkInterval=true;
                },100);
            }
            else{
                alert('이미 동작중입니다.');
            }
        }
        function doStop(){
            clearInterval(t1);
            checkInterval=false;
        }
    </script>
</head>
<body>
    <button onclick="doMove()">빙글빙글해</button>
    <button onclick="doStop()">멈춰</button>

    <div id="earth"></div>
    <div id="sun"></div>
</body>
</html>