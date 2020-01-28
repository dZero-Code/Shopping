<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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

<!-- Page info -->
<div class="page-top-info">
	<div class="container">
		<h4>CATEGORY PAGE</h4>
		<div class="site-pagination">
			<a href="/">Home</a>
			/ <a href="#">${class1 }</a>
			<c:if test="${not empty class2}"> / <a href="#">${class2 }</a></c:if>
		</div>
	</div>
</div>
<!-- Page info end -->

<!-- Category section -->
<section class="category-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 order-2 order-lg-1">
				<div class="filter-widget">
					<h2 class="fw-title">Categories <%if(session.getAttribute("adminId") != null) {%><a href="/shop/product/insert">상품추가</a><%} %></h2>
					<ul class="category-menu">
						<li><a href="/shop/product/category?class1=OUTER&class2=&page=1">OUTER</a>
							<ul class="sub-menu">
								<li><a href="/shop/product/category?class1=OUTER&class2=가디건&page=1">가디건</a></li>
								<li><a href="/shop/product/category?class1=OUTER&class2=자켓&page=1">자켓</a></li>
								<li><a href="/shop/product/category?class1=OUTER&class2=코트&page=1">코트</a></li>
								<li><a href="/shop/product/category?class1=OUTER&class2=블레이저&page=1">블레이저</a></li>
								<li><a href="/shop/product/category?class1=OUTER&class2=집업&page=1">집업</a></li>
								<li><a href="/shop/product/category?class1=OUTER&class2=무스탕&page=1">무스탕</a></li>
								<li><a href="/shop/product/category?class1=OUTER&class2=패딩&page=1">패딩</a></li>
							</ul>
						</li>
						<li><a href="/shop/product/category?class1=TEE&class2=&page=1">TEE</a>
							<ul class="sub-menu">
								<li><a href="/shop/product/category?class1=TEE&class2=긴팔티&page=1">긴팔티</a></li>
								<li><a href="/shop/product/category?class1=TEE&class2=반팔티&page=1">반팔티</a></li>
								<li><a href="/shop/product/category?class1=TEE&class2=니트&page=1">니트</a></li>
								<li><a href="/shop/product/category?class1=TEE&class2=맨투맨&page=1">맨투맨</a></li>
								<li><a href="/shop/product/category?class1=TEE&class2=민소매&page=1">민소매</a></li>
							</ul>
						</li>
						<li><a href="/shop/product/category?class1=SHIRT&class2=&page=1">SHIRT</a>
							<ul class="sub-menu">
								<li><a href="/shop/product/category?class1=SHIRT&class2=베이직&page=1">베이직</a></li>
								<li><a href="/shop/product/category?class1=SHIRT&class2=데님&page=1">데님</a></li>
								<li><a href="/shop/product/category?class1=SHIRT&class2=패턴&page=1">패턴</a></li>
								<li><a href="/shop/product/category?class1=SHIRT&class2=반팔&page=1">반팔</a></li>
							</ul>
						</li>
						<li><a href="/shop/product/category?class1=PANTS&class2=&page=1">PANTS</a>
							<ul class="sub-menu">
								<li><a href="/shop/product/category?class1=PANTS&class2=슬랙스&page=1">슬랙스</a></li>
								<li><a href="/shop/product/category?class1=PANTS&class2=밴딩팬츠&page=1">밴딩팬츠</a></li>
								<li><a href="/shop/product/category?class1=PANTS&class2=면바지&page=1">면바지</a></li>
								<li><a href="/shop/product/category?class1=PANTS&class2=청바지&page=1">청바지</a></li>
								<li><a href="/shop/product/category?class1=PANTS&class2=반바지&page=1">반바지</a></li>
							</ul>
						</li>
						<li><a href="/shop/product/category?class1=TRAINING&class2=&page=1">TRAINING<span class="new">New</span></a></li>
						<li><a href="/shop/product/category?class1=SHOES&class2=&page=1">SHOES</a>
							<ul class="sub-menu">
								<li><a href="/shop/product/category?class1=SHOES&class2=스니커즈&page=1">스니커즈</a></li>
								<li><a href="/shop/product/category?class1=SHOES&class2=로퍼&page=1">로퍼</a></li>
								<li><a href="/shop/product/category?class1=SHOES&class2=워커&page=1">워커</a></li>
								<li><a href="/shop/product/category?class1=SHOES&class2=샌들&page=1">샌들</a></li>
							</ul>
						</li>
						<li><a href="/shop/product/category?class1=ACC&class2=&page=1">ACC</a>
							<ul class="sub-menu">
								<li><a href="/shop/product/category?class1=ACC&class2=모자&page=1">모자</a></li>
								<li><a href="/shop/product/category?class1=ACC&class2=머플러&page=1">머플러</a></li>
								<li><a href="/shop/product/category?class1=ACC&class2=장갑&page=1">장갑</a></li>
								<li><a href="/shop/product/category?class1=ACC&class2=벨트&page=1">벨트</a></li>
								<li><a href="/shop/product/category?class1=ACC&class2=쥬얼리&page=1">쥬얼리</a></li>
								<li><a href="/shop/product/category?class1=ACC&class2=선글라스&page=1">선글라스</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="filter-widget mb-0">
					<h2 class="fw-title">refine by</h2>
					<div class="price-range-wrap">
						<h4>Price</h4>
                           <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" data-min="0" data-max="150000">
							<div class="ui-slider-range ui-corner-all ui-widget-header" style="left: 0%; width: 100%;"></div>
							<span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;">
							</span>
							<span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;">
							</span>
						</div>
						<div class="range-slider">
                               <div class="price-input">
                                   <input type="text" id="minamount">
                                   <input type="text" id="maxamount">
                               </div>
                           </div>
                       </div>
				</div>
				<div class="filter-widget mb-0">
					<h2 class="fw-title">color by</h2>
					<div class="fw-color-choose">
						<div class="cs-item">
							<input type="radio" name="cs" id="gray-color">
							<label class="cs-gray" for="gray-color">
								<span>(3)</span>
							</label>
						</div>
						<div class="cs-item">
							<input type="radio" name="cs" id="orange-color">
							<label class="cs-orange" for="orange-color">
								<span>(25)</span>
							</label>
						</div>
						<div class="cs-item">
							<input type="radio" name="cs" id="yollow-color">
							<label class="cs-yollow" for="yollow-color">
								<span>(112)</span>
							</label>
						</div>
						<div class="cs-item">
							<input type="radio" name="cs" id="green-color">
							<label class="cs-green" for="green-color">
								<span>(75)</span>
							</label>
						</div>
						<div class="cs-item">
							<input type="radio" name="cs" id="purple-color">
							<label class="cs-purple" for="purple-color">
								<span>(9)</span>
							</label>
						</div>
						<div class="cs-item">
							<input type="radio" name="cs" id="blue-color" checked="">
							<label class="cs-blue" for="blue-color">
								<span>(29)</span>
							</label>
						</div>
					</div>
				</div>
				<div class="filter-widget mb-0">
					<h2 class="fw-title">Size</h2>
					<div class="fw-size-choose">
						<div class="sc-item">
							<input type="radio" name="sc" id="xs-size">
							<label for="xs-size">XS</label>
						</div>
						<div class="sc-item">
							<input type="radio" name="sc" id="s-size">
							<label for="s-size">S</label>
						</div>
						<div class="sc-item">
							<input type="radio" name="sc" id="m-size"  checked="">
							<label for="m-size">M</label>
						</div>
						<div class="sc-item">
							<input type="radio" name="sc" id="l-size">
							<label for="l-size">L</label>
						</div>
						<div class="sc-item">
							<input type="radio" name="sc" id="xl-size">
							<label for="xl-size">XL</label>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-9  order-1 order-lg-2 mb-5 mb-lg-0">
				<div class="row">
					<c:choose>
						<c:when test="${empty list }">
							<center>등록된 물품이 없습니다.</center>
						</c:when>
						
						<c:otherwise>
							<c:forEach var="product" items="${list}">
								<div class="col-lg-4 col-sm-6">
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
								</div>
							</c:forEach>
							<div class="text-center w-100 pt-3">
								<!-- 페이징 -->
								<c:if test="${paging.startPage != 1 }">
									<a href="/shop/product/category?class1=${class1 }&class2=${class2}&page=${paging.startPage - 1}">&lt;</a>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<a href="/shop/product/category?class1=${class1 }&class2=${class2}&page=${p}">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<a href="/shop/product/category?class1=${class1 }&class2=${class2}&page=${paging.endPage+1}">&gt;</a>
								</c:if>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Category section end -->

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
<script src="<c:url value="/resources/js/product/product.js" />"></script>
<script src="<c:url value="/resources/js/common.js" />"></script>

</body>
</html>