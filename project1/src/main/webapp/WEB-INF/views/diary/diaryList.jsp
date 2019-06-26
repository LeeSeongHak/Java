<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>Dear My diary</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="resources/css/main.css" />
	<!-- Scripts -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery.poptrox.min.js"></script>
	<script src="resources/js/skel.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script>
	$(document).ready(function(){
			
		 $('.diaryWrite').click(function(){
			 window.open();
		 }); 
		 
	};

	</script>
	</head>
	
	<body>
<div id="wrapper">	
	<div class="menu">
		<ul>
			<li><a href="">로그아웃</a></li>
			<li><a href="">내정보</a></li>
			<li class="diaryWrite">일기 쓰기</li>
			<li><a href="">홈</a></li>
			
		</ul>	
	</div>
	

<!-- Wrapper -->


	<!-- Header -->
		
		<header id="header">
			<span class="avatar"><img src="resources/images/avatar.jpg" alt="" /></span>
			<h1> <strong>회원 이름</strong><br/></h1>
		</header>

	<!-- Main -->
		<section id="main">

			<!-- Thumbnails -->
				<section class="thumbnails">
					<div>
						<a href="resources/images/fulls/01.jpg">
							<img src="resources/images/thumbs/01.jpg" alt="" />
							<h3>Lorem ipsum dolor sit amet</h3>
						</a>
						<a href="resources/images/fulls/02.jpg">
							<img src="resources/images/thumbs/02.jpg" alt="" />
							<h3>Lorem ipsum dolor sit amet</h3>
						</a>
					</div>
					<div>
						<a href="resources/images/fulls/03.jpg">
							<img src="resources/images/thumbs/03.jpg" alt="" />
							<h3>Lorem ipsum dolor sit amet</h3>
						</a>
						<a href="resources/images/fulls/04.jpg">
							<img src="resources/images/thumbs/04.jpg" alt="" />
							<h3>Lorem ipsum dolor sit amet</h3>
						</a>
						<a href="resources/images/fulls/05.jpg">
							<img src="resources/images/thumbs/05.jpg" alt="" />
							<h3>Lorem ipsum dolor sit amet</h3>
						</a>
					</div>
					<div>
						<a href="resources/images/fulls/06.jpg">
							<img src="resources/images/thumbs/06.jpg" alt="" />
							<h3>Lorem ipsum dolor sit amet</h3>
						</a>
						<a href="resources/images/fulls/07.jpg">
							<img src="resources/images/thumbs/07.jpg" alt="" />
							<h3>Lorem ipsum dolor sit amet</h3>
						</a>
						<a href="resources/images/fulls/cat.jpg">
							<img src="resources/images/thumbs/cat.jpg" alt="" />
							<h3>Lorem ipsum dolor sit amet</h3>
						</a>
					</div>
				</section>

		</section>

	<!-- Footer -->
		<footer id="footer">
			<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. Demo Images: <a href="http://unsplash.com">Unsplash</a>.</p>
		</footer>

</div>

	

	</body>
</html>