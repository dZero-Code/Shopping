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

<!-- product section -->
<section class="product-section">
	<div class="container">
		<div class="back-link">
			<a href="javascript:window.history.back();"> &lt;&lt; Back to Category</a>
		</div>
		<div class="row">
			<c:choose>
				<c:when test="${empty product and empty productOpts }">
					<center>준비중입니다.</center>
				</c:when>
				<c:otherwise>
					<div class="col-lg-6">
						<div class="product-pic-zoom">
							<img class="product-big-img" src="<spring:url value='/product/${product.class1}/${product.main_photo}' />" alt="">
						</div>
						<div class="product-thumbs" tabindex="1" style="overflow: hidden; outline: none;">
							<div class="product-thumbs-track">
								<div class="pt active" data-imgbigurl="<spring:url value='/product/${product.class1}/${product.main_photo}' />"><img src="<spring:url value='/product/${product.class1}/${product.main_photo}' />" alt=""></div>
								<!-- 
								<div class="pt" data-imgbigurl="img/single-product/2.jpg"><img src="img/single-product/thumb-2.jpg" alt=""></div>
								<div class="pt" data-imgbigurl="img/single-product/3.jpg"><img src="img/single-product/thumb-3.jpg" alt=""></div>
								<div class="pt" data-imgbigurl="img/single-product/4.jpg"><img src="img/single-product/thumb-4.jpg" alt=""></div>
								 -->
							</div>
						</div>
					</div>
					<div class="col-lg-6 product-details">
						<h2 class="p-title">${product.product_name } &nbsp;&nbsp; <%if(session.getAttribute("adminId") != null) {%><a href="/shop/product/insertOpt?product_no=${product.product_no }">상품 옵션 수정</a></h2><%} %>
						<h3 class="p-price">${product.price }</h3>
						<div class="p-review">
							<a href="#">3 reviews</a>|<a href="#">Add your review</a>
						</div>
						<c:choose>
							<c:when test="${empty size }">
								<center>준비중입니다.<br></center>
							</c:when>
							<c:otherwise>
								<form action="/shop/order/cart" method="post" id="cart">
								<div class="fw-size-choose">
									<p>Size</p>
									<input type="hidden" id="product_no" name="product_no" value="${product.product_no }">
									<c:forEach var="size" items="${size }">
										<div class="sc-item">
											<input type="radio" name="size" id="size_${size }" value="${size }">
											<label for="size_${size }">${size }</label>
										</div>
									</c:forEach>
								</div>
								<div class="fw-size-choose" id="chColor">
								</div>
								<h3 class="p-stock">재고량 : <span class="cnt"></span></h3>
								<div class="quantity">
									<p>Quantity</p>
			                       	<div class="pro-qty"><input type="text" id="inventory" name="inventory" value="1"></div>
			                   	</div>
								<a href="#" class="site-btn goCart">장바구니에 담기</a>
								</form>
			            	</c:otherwise>
						</c:choose>
						<div id="accordion" class="accordion-area">
							<div class="panel">
								<div class="panel-header" id="headingOne">
									<button class="panel-link active" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">information</button>
								</div>
								<div id="collapse1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
									<div class="panel-body">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te mpus. Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
										<p>Approx length 66cm/26" (Based on a UK size 8 sample)</p>
										<p>Mixed fibres</p>
										<p>The Model wears a UK size 8/ EU size 36/ US size 4 and her height is 5'8"</p>
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-header" id="headingTwo">
									<button class="panel-link" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">care details </button>
								</div>
								<div id="collapse2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
									<div class="panel-body">
										<!-- <img src="./img/cards.png" alt=""> -->
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te mpus. Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
									</div>
								</div>
							</div>
							<div class="panel">
								<div class="panel-header" id="headingThree">
									<button class="panel-link" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">shipping & Returns</button>
								</div>
								<div id="collapse3" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
									<div class="panel-body">
										<h4>7 Days Returns</h4>
										<p>Cash on Delivery Available<br>Home Delivery <span>3 - 4 days</span></p>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integer bibendum sodales arcu id te mpus. Ut consectetur lacus leo, non scelerisque nulla euismod nec.</p>
									</div>
								</div>
							</div>
						</div>
						<div class="social-sharing">
							<a href=""><i class="fa fa-google-plus"></i></a>
							<a href=""><i class="fa fa-pinterest"></i></a>
							<a href=""><i class="fa fa-facebook"></i></a>
							<a href=""><i class="fa fa-twitter"></i></a>
							<a href=""><i class="fa fa-youtube"></i></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>
<!-- product section end -->


<!-- RELATED PRODUCTS section -->
<!-- 
<section class="related-product-section">
	<div class="container">
		<div class="section-title">
			<h2>RELATED PRODUCTS</h2>
		</div>
		<div class="product-slider owl-carousel">
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
			<div class="product-item">
				<div class="pi-pic">
					<img src="./img/product/3.jpg" alt="">
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
			<div class="product-item">
					<div class="pi-pic">
						<img src="./img/product/4.jpg" alt="">
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
			<div class="product-item">
				<div class="pi-pic">
					<img src="./img/product/6.jpg" alt="">
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
</section>
 -->
<!-- RELATED PRODUCTS section end -->

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