<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
	<%@ include file="inc/header.jsp" %>
	<!-- Header section end -->	
	
	<!-- Hero section -->
	<section class="hero-section">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="<c:url value="/resources/img/bg.jpg" />">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-7">
							<span>New Product</span>
							<h2>반팔티</h2>
							<p>이 반팔티는 어쩌구</p>
							<a href="#" class="site-btn sb-line">DISCOVER</a>
							<a href="#" class="site-btn sb-white">ADD TO CART</a>
						</div>
					</div>
					<div class="offer-card text-white">
						<span>할인중</span>
						<h2>20%</h2>
						<p>SHOP NOW</p>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg" data-setbg="<c:url value="/resources/img/bg2.jpg" />">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-7 text-white">
							<span>New Product</span>
							<h2>트레이닝복</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum sus-pendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. </p>
							<a href="#" class="site-btn sb-line">DISCOVER</a>
							<a href="#" class="site-btn sb-white">ADD TO CART</a>
						</div>
					</div>
					<div class="offer-card text-white">
						<span>할인중</span>
						<h2>10%</h2>
						<p>SHOP NOW</p>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="slide-num-holder" id="snh-1"></div>
		</div>
	</section>
	<!-- Hero section end -->

	<!-- Features section -->
	<section class="features-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<!-- <img src="img/icons/1.png" alt="#">  -->
						</div>
						<h2><i class="fa fa-credit-card" aria-hidden="true"></i>&nbsp;빠른 보안 결제</h2>
					</div>
				</div>
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<!-- <img src="img/icons/2.png" alt="#"> -->
						</div>
						<h2><i class="fa fa-gift" aria-hidden="true"></i>&nbsp;너를 위한 푸짐한 혜택</h2>
					</div>
				</div>
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<!-- <img src="img/icons/3.png" alt="#"> -->
						</div>
						<h2><i class="fa fa-rocket" aria-hidden="true"></i>&nbsp;지금 사면! 오늘출발!</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Features section end -->


	<!-- letest product section -->
	<section class="top-letest-product-section">
		<div class="container">
			<div class="section-title">
				<h2>- 최근 상품 -</h2>
			</div>
			<c:choose>
				<c:when test="${empty productList }">
					<center>등록된 물품이 없습니다.</center>
				</c:when>
				
				<c:otherwise>
					<div class="product-slider owl-carousel">
						<c:forEach var="product" items="${productList }">
							<div class="product-item">
								<input type="hidden" class="product_no" value="${product.product_no }">												
								<div class="pi-pic">
									<c:if test = "${product.sales > 0 }">
										<div class="tag-sale">sale</div>
									</c:if>
									<%if(session.getAttribute("adminId") != null) {%>
										<div class="pi-delete">
											<a href="#" class="delete"><i class="fa fa-times" aria-hidden="true"></i></a>
										</div>
									<%} %>
									<a href="/shop/product/detail/${product.product_no }">
										<img src="<spring:url value='/product/${product.class1}/${product.main_photo}' />" alt="빈 이미지입니다.">
									</a>
									<div class="pi-links">
										<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
										<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
									</div>
								</div>
								<div class="pi-text">
									<p class="right">조회수 : ${product.views }</p>
									<p>${product.product_name }</p>
									<p>${product.price }</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
	<!-- letest product section end -->



	<!-- Product filter section -->
	<section class="product-filter-section">
		<div class="container">
			<div class="section-title">
				<h2>카테고리별 상품</h2>
			</div>
			<ul class="product-filter-menu">
				<li><a href="#" class="main_product">OUTER</a></li>
				<li><a href="#" class="main_product">TEE</a></li>
				<li><a href="#" class="main_product">SHIRT</a></li>
				<li><a href="#" class="main_product">PANTS</a></li>
				<li><a href="#" class="main_product">TRAINING</a></li>
				<li><a href="#" class="main_product">SHOES</a></li>
				<li><a href="#" class="main_product">ACC</a></li>
			</ul>
			<div class="row set-main-pro">
				<!-- ajax로 상품 처리 -->
			</div>
			<div class="text-center pt-5 set-main-pro-btn">
				<!-- ajax로 a tag 처리 -->
			</div>
		</div>
	</section>
	<!-- Product filter section end -->


	<!-- Banner section -->
	<!-- <section class="banner-section">
		<div class="container">
			<div class="banner set-bg" data-setbg="img/banner-bg.jpg">
				<div class="tag-new">NEW</div>
				<span>New Arrivals</span>
				<h2>STRIPED SHIRTS</h2>
				<a href="#" class="site-btn">SHOP NOW</a>
			</div>
		</div>
	</section> -->
	<!-- Banner section end  -->

	
	<!-- Footer section -->
	<%@ include file="inc/footer.jsp" %>
	<!-- Footer section end -->	
	
	<!--====== Javascripts & Jquery ======-->
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.slicknav.min.js" />"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.nicescroll.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.zoom.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
	<script src="<c:url value="/resources/js/main.js" />"></script>

	</body>
</html>