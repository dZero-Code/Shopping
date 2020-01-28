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
	
<!-- Admin Login section -->
<section class="login-section">
	<div class="container">
		<h4>로그인</h4><hr>
		<div class="row">
			<div class="col-sm">
				<div class="info">
					<h4>관리자 로그인</h4>
					<p class="text-gray">관리자만 접근 가능한 로그인 화면입니다.</p>
				</div>
				<form action="/shop/admin" method="post" id="frm">
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
			</div>
		</div>
	</div>
</section>
<!-- Admin Login section end -->

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
<script src="<c:url value="/resources/js/admin/login.js" />"></script>

</body>
</html>