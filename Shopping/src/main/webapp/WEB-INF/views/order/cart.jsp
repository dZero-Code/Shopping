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
<!-- js에 세션값 넘기기 -->
<script>
	var sessionId = '<%=session.getAttribute("id") %>';
</script>

<!-- Header section -->
<%@ include file="../inc/header.jsp" %>
<!-- Header section end -->


<!-- Page info -->
<div class="page-top-info">
	<div class="container">
		<h4>Your cart</h4>
		<div class="site-pagination">
			<a href="#">Home</a> /
			<a href="#">장바구니</a>
		</div>
	</div>
</div>
<!-- Page info end -->


<!-- cart section end -->
<section class="cart-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<h3>장바구니</h3>
					<div class="cart-table-warp">
						<table>
						<thead>
							<tr>
								<th class="product-th">상품</th>
								<th class="quy-th">수량</th>
								<th class="size-th">사이즈</th>
								<th class="color-th">색상</th>
								<th class="total-th">총가격</th>
								<th class="select-th">비고</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty cart }">
									<td colspan="6">장바구니에 상품이 존재하지 않습니다.</td>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="cart" items="${cart }">
									<tr>
										<td class="product-col">
											<img src="<spring:url value='/product/${cart.class1}/${cart.main_photo}' />" alt="">
											<div class="pc-title">
												<h4>${cart.product_name }</h4>
												<p>${cart.price }</p>
											</div>
										</td>
										<td class="quy-col">
											<div class="quantity">
						                        <div class="pro-qty">
													<input type="text" value=${cart.quantity }>
												</div>
		                   					</div>
										</td>
										<td class="size-col"><h4>${cart.size }</h4></td>
										<td class="color-col"><h4>${cart.color }</h4></td>
										<td class="total-col"><h4>${cart.price * cart.quantity}</h4></td>
										<td class="select-col">
											<h4 class="cart-order">주문하기</h4>
											<input type="hidden" class="cart_no" value="${cart.cart_no}">
											<input type="hidden" class="product_code" value="${cart.product_code}">
											<h4 class="cart-delete">삭제</h4>
										</td>
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					</div>
					<div class="total-cost">
						<h6>Total : <span>0</span></h6>
					</div>
				</div>
			</div>
			<div class="col-lg cart-btn-sm">
				<a href="" id="orderAll" class="site-btn">모두 주문하기</a>
				<a href="/shop/product/category?class1=OUTER&class2=&page=1" class="site-btn sb-dark">계속 쇼핑하기</a>
			</div>
		</div>
	</div>
</section>
<!-- cart section end -->

<!-- Related product section -->
<!-- <section class="related-product-section">
	<div class="container">
		<div class="section-title text-uppercase">
			<h2>Continue Shopping</h2>
		</div>
		<div class="row">
			<div class="col-lg-3 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<div class="tag-new">New</div>
						<img src="./img/product/2.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Black and White Stripes Dress</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<img src="./img/product/5.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top </p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<img src="./img/product/9.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top </p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<img src="./img/product/1.jpg" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6>$35,00</h6>
						<p>Flamboyant Pink Top </p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section> -->
<!-- Related product section end -->

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
	<script src="<c:url value="/resources/js/product/order.js" />"></script>

	</body>
</html>