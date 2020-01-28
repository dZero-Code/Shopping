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
		<h4>${pNo }의 옵션 &nbsp;&nbsp;<a href="javascript:history.back()">돌아가기</a></h4><hr>
		<div class="row">
			<div class="col-sm">
				<form action="/shop/product/insertOpt" method="post" id="frm">
					<div class="form-row">
						<input type="hidden" name="product_no" value="${pNo }">
						<div class="form-group col-md-2">
							<input type="text" class="unli-input" id="product_code" name="product_code" placeholder="상품코드" autocomplete="off">
						</div>
						<div class="form-group col-md-2">
							<input type="text" class="unli-input" id="size" name="size" placeholder="사이즈" autocomplete="off">
						</div>
						<div class="form-group col-md-2">
							<input type="text" class="unli-input" id="color" name="color" placeholder="색상" autocomplete="off">
						</div>
						<div class="form-group col-md-2">
							<input type="number" class="unli-input" id="inventory" name="inventory" placeholder="재고량" autocomplete="off">
						</div>
	
						<div class="form-group col-md-3">
							<button id="optAdd" class="opt-btn">옵션추가</button>
						</div>
					</div>
				</form><br>
				
				<c:choose>
					<c:when test="${empty pList }">
						<center>옵션을 등록해주세요.</center>
					</c:when>
					
					<c:otherwise>
						<c:forEach var="p" items="${pList}">
						<form action="/shop/product/updateOpt" method="post">
							<div class="form-row">
								<input type="hidden" name="product_no" value="${p.product_no }">
								<div class="form-group col-md-2">
									<input type="text" class="unli-input" name="product_code" value="${p.product_code}" readonly="readonly">
								</div>
								<div class="form-group col-md-2">
									<input type="text" class="unli-input" name="size" value="${p.size}" readonly="readonly">
								</div>
								<div class="form-group col-md-2">
									<input type="text" class="unli-input" name="color" value="${p.color}" readonly="readonly">
								</div>
								<div class="form-group col-md-2">
									<input type="text" class="unli-input" name="inventory" value="${p.inventory}" readonly="readonly">
								</div>
								<div class="form-group col-md-3">
									<button class="addInven opt-btn">수량추가</button>
									<button class="optModify opt-btn">수정</button>
									<button class="optDelete opt-btn">삭제</button>
								</div>
							</div>
						</form>
						<div class="form-row"></div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
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