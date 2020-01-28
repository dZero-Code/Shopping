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
	
<!-- Product section -->
<section class="product-section">
	<div class="container">
		<h4>상품등록</h4><hr>
		<div class="row">
			<div class="col-sm">
				<form action="/shop/product/insert" method="post" id="frm" enctype="multipart/form-data">
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" class="unli-input" id="product_no" name="product_no" placeholder="상품번호" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<select class="custom-select custom-select-sm" id="class1" name="class1">
								<option value="OUTER">OUTER</option>
								<option value="TEE">TEE</option>
								<option value="SHIRT">SHIRT</option>
								<option value="PANTS">PANTS</option>
								<option value="TRAINING">TRAINING</option>
								<option value="SHOES">SHOES</option>
								<option value="ACC">ACC</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<select class="custom-select custom-select-sm" id="class2" name="class2">
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" class="unli-input" id="product_name" name="product_name" placeholder="상품이름" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="number" class="unli-input" id="price" name="price" placeholder="판매가" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="number" class="unli-input" id="sales" name="sales" placeholder="할인율" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="photo" name="photo">
								<label class="custom-file-label" for="photo">Choose file</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<button type="submit" id="insert" class="sb-btn">상품추가</button>
						</div>
					</div>
				</form>			
			</div>
			<div class="col-sm line">
				<img id="uploadImg"/>
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
<script src="<c:url value="/resources/js/product/product.js" />"></script>

</body>
</html>