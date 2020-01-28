<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 text-center text-lg-left">
					<!-- 로고 -->
					<a href="/shop" class="site-logo">
						쇼핑몰 메인
						<!-- <img src="img/logo.png" alt=""> -->
					</a>
				</div>
				<div class="col-xl-6 col-lg-5">
					<form class="header-search-form">
						<input type="text" placeholder="검색">
						<button><i class="fa fa-search" aria-hidden="true"></i></button>
					</form>
				</div>
				<div class="col-xl-4 col-lg-5">
					<div class="user-panel">
					<% if(session.getAttribute("id") != null || session.getAttribute("adminId") != null){ %>
					<div class="up-item">
							<i class="fa fa-user" aria-hidden="true"></i><a href="/shop/logout">로그아웃</a>
						</div>
						<div class="up-item">
							<div class="shopping-card">
								<i class="fa fa-shopping-cart" aria-hidden="true"></i>
								<!-- 자신의 쇼핑카트의 물건 갯수 -->
								<span>0</span>
							</div>
							<a href="/shop/order/cart">Shopping Cart</a>
						</div>
					<% }else{ %>
						<div class="up-item">
							<i class="fa fa-user" aria-hidden="true"></i><a href="/shop/login">로그인</a>
						</div>
						<div class="up-item">
							<i class="fa fa-sign-in" aria-hidden="true"></i><a href="/shop/joinus">회원가입</a>
						</div> 
					<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 메뉴 -->
	<nav class="main-navbar">
		<div class="container">
			<!-- menu -->
			<ul class="main-menu">
				<li><a href="/shop/">HOME</a></li>
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
				<% if(session.getAttribute("adminId") != null){ %>
					<li><a href="#">관리자페이지</a>
						<ul class="sub-menu">
							<li><a href="#">회원관리</a></li>
							<li><a href="/shop/product/category?class1=OUTER&class2=&page=1">상품관리</a></li>
							<li><a href="#">주문관리</a></li>
						</ul>
					</li>
				<%} %>
			</ul>
		</div>
	</nav>
</header>