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
		<h4>회원가입</h4><hr>
		<div class="row">
			<div class="col-sm">
				<div class="info">
					<h4>회원가입</h4>
					<p class="text-gray">회원가입에 필요한 최소한의 정보만 입력 받음으로써 <br>고객님의 개인정보 수집을 최소화하고 편리한 회원가입을 제공합니다.</p>
				</div>
				<form action="/shop/joinus" method="post" id="frm">
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" class="unli-input" id="userid" name="userid" placeholder="아이디 (영문자와 숫자 6~12자리)" autocomplete="off">
							<p id="chkId" class="text-red">아이디는 6~12자 영문자와 숫자만  사용가능합니다.</p>
							<p id="unableId" class="text-red">이미 존재하는 아이디입니다.</p>
							<p id="ableId" class="text-green">사용가능한 아이디입니다.</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="password" class="unli-input" id="passwd" name="passwd" placeholder="비밀번호 (특수문자,문자,숫자 8~15자리)" autocomplete="off">
							<p id="chkPw" class="text-red">비밀번호는 8~15자 특수문자,영문자,숫자만 사용가능합니다.</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="password" class="unli-input" id="repasswd" placeholder="비밀번호확인" autocomplete="off">
							<p id="chkRepw" class="text-red">비밀번호가 같은지 확인해주세요.</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" class="unli-input" id="name" name="name" placeholder="이름" autocomplete="off">
							<p id="chkName" class="text-red">이름을 입력해주세요.</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" class="unli-input" id="birth" name="birth" placeholder="주민등록번호앞자리" autocomplete="off">
							<p id="chkBirth" class="text-red">올바른 주민등록번호 앞자리를 입력해주세요.</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="email" class="unli-input" id="email" name="email" placeholder="이메일" autocomplete="off">
							<p id="chkEmail" class="text-red">올바른 이메일 형식인지 확인해주세요.</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<input type="text" class="unli-input" id="phone" name="phone"  placeholder="휴대폰번호 ('-' 포함)" autocomplete="off">
							<p id="chkPhone" class="text-red">올바른 폰번호 형식인지 확인해주세요.</p>
						</div>
					</div>
					<div class="info line-border">
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input" id="allCheck">
							<label class="custom-control-label" for="allCheck">전체동의</label>
						</div>
						<div class="row">
							<div class="col-sm div-ml">
								<div class="custom-control custom-switch">
									<input type="checkbox" class="custom-control-input" id="check1">
									<label class="custom-control-label" for="check1">이용약관(필수)</label>
								</div>
								<div class="custom-control custom-switch">
									<input type="checkbox" class="custom-control-input" id="check2">
									<label class="custom-control-label" for="check2">개인정보 수집 및 이용 안내(필수)</label>
								</div>
								<div class="custom-control custom-switch">
									<input type="checkbox" class="custom-control-input" id="state_provided" name="state_provided">
									<label class="custom-control-label" for="state_provided">개인정보 제3자 제공(선택)</label>
								</div>
								<div class="custom-control custom-switch">
									<input type="checkbox" class="custom-control-input" id="state_consignment" name="state_consignment">
									<label class="custom-control-label" for="state_consignment">개인정보 처리 위탁(선택)</label>
								</div>
							</div>
						</div>
						<p class="warning">SMS 수신거부시 입고지연 / 품절안내 문자의 전송이 불가하여 발생하는 불이익은 책임지지 않습니다.</p>
						<div class="row">
							<div class="col-sm">
								<div class="custom-control custom-switch">
									<input type="checkbox" class="custom-control-input" id="marketCheck">
									<label class="custom-control-label" for="marketCheck">마케팅 수신동의(선택)</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm div-ml">
								<div class="custom-control custom-switch">
									<input type="checkbox" class="custom-control-input" id="state_email" name="state_email">
									<label class="custom-control-label" for="state_email">이메일</label>
								</div>
							</div>
							<div class="col-sm">
								<div class="custom-control custom-switch">
									<input type="checkbox" class="custom-control-input" id="state_sms" name="state_sms">
									<label class="custom-control-label" for="state_sms">SMS</label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
							<p id="chkAgree" class="text-red">필수항목을 체크해주세요.</p>
							<button type="submit" id="join" class="sb-btn">JOIN-US</button>
						</div>
					</div>
				</form>			
			</div>
			<div class="col-sm">
				<div class="info">
					<h5>이용약관</h5>
					<textarea readonly="readonly">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</textarea>
				</div>
				<div class="info">
					<h5>개인정보 수집 및 이용</h5>
					<table border="1">
						<tr><td class="td_tit">구분</td><td class="td_tit">필수정보</td><td class="td_tit">선택정보</td></tr>
						<tr><td class="td_tit">목적</td><td>회원제 서비스 이용<br>본인확인</td><td>마케팅 활용<br>(이벤트, 맞춤형 광고)</td></tr>
						<tr><td class="td_tit">항목</td><td>이름, 아이디,<br>비밀번호, 생일</td><td>휴대전화, 이메일</td></tr>
						<tr><td class="td_tit">보유<br>기간</td><td>회원탈퇴 후<br>5일까지</td><td>회원탈퇴 후<br>5일까지</td>	</tr>
					</table>
				</div>
				<div class="info">
					<h5>개인정보 제 3자 제공 (선택)</h5>
					<table border="1">
						<tr><td class="td_tit">제공받는자</td><td class="td_tit">목적</td><td class="td_tit">항목</td><td class="td_tit">보유기간</td></tr>
						<tr><td>(주)<br>ㅇㅇㅇ</td><td>이벤트<br>전달</td><td>이름, 아이디,<br>휴대폰번호</td><td>계약종료</td></tr>
					</table>
				</div>
				<div class="info">
					<h5>개인정보 처리위탁 (선택)</h5>
					<table border="1">
						<tr><td class="td_tit">수탁자</td><td class="td_tit">목적</td></tr>
						<tr><td>(주)<br>ㅇㅇㅇ</td><td>회원정보 DB 시스템 운영 및 관리,<br>디지털 마케팅 자동화 업무</td></tr>
						<tr><td>(주)<br>ㅇㅇㅇ</td><td>이벤트 전달</td></tr>
					</table>
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
<script src="<c:url value="/resources/js/user/joinus.js" />"></script>

</body>
</html>