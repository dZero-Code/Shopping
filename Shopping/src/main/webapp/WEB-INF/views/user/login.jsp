<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Shopping</title>
	<meta name="description" content="ShoppingMall Project | eCommerce Template">
	<meta name="keywords" content="ShoppingMall, Project">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.min.css" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/animate.css" />" />
	
	<link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/slicknav.min.css" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css" />" />

	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
<!-- Header section -->
<%@ include file="../inc/header.jsp" %>
<!-- Header section end -->	
	
<!-- Login section -->
<section class="login-section">
	<div class="container">
		<h4>로그인</h4><hr>
		<div class="row">
			<div class="col-sm">
				<div class="info">
					<h4>회원 로그인</h4>
					<p class="text-gray">가입하신 아이디와 비밀번호를 입력해주세요.<br>비밀번호는 대소문자를 구분합니다.</p>
				</div>
				<form action="/shop" method="post" id="frm">
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" class="unli-input" id="userid" name="userid" placeholder="아이디" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<p id="chkId" class="text-red">아이디를 입력해주세요.<p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="password" class="unli-input" id="passwd" name="passwd" placeholder="비밀번호" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<p id="chkPw" class="text-red">비밀번호를 입력해주세요.<p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<p id="loginResult" class="text-red">아이디와 비밀번호를 확인해주세요.<p>
							<button type="submit" id="login" class="sb-btn">LOG-IN</button>
						</div>
					</div>
				</form>			
			</div>
			<div class="col-sm">
				<div class="info">
					<h4>회원가입</h4>
					<p class="text-gray">아직 회원이 아니신가요?<br>회원가입을 하시면 다양한 혜택을 편리하게 이용하실 수 있습니다.</p>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button id="joinus" class="sb-btn">JOIN-US</button>
					</div>
				</div>
				<div class="info">
					<h4>아이디/비밀번호 찾기</h4>
					<p class="text-gray">아이디 혹은 비밀번호를 잊으셨나요?<br>간단한 정보를 입력 후 잃어버린 정보를 찾으실 수 있습니다.</p>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<button class="sb-btn">ID/PASSWORD</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Login section end -->

<!-- Footer section -->
<%@ include file="../inc/footer.jsp" %>
<!-- Footer section end -->	

<!--====== Javascripts & Jquery ======-->
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.slicknav.min.js" />"></script>
<script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.nicescroll.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.zoom.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/js/common.js" />"></script>
<script src="<c:url value="/resources/js/user/login.js" />"></script>

</body>
</html>