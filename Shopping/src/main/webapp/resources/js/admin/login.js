/*
	login.js
*/

(function($) {
	$("#login").on("click", function(e){
		e.preventDefault();
		
		/* 유효성 체크 알림 글 초기화 */
		$("#chkId").css("display", "none");
		$("#chkPw").css("display", "none");
		$("#loginResult").css("display", "none");
		
		let userid = $("#userid").val();
		let passwd = $("#passwd").val();
		
		// 아이디 미입력시
		if(userid == null){
			$("#chkId").css("display", "block");
			$("#chkId").focus()
			return
		}
		
		// 비밀번호 미입력시
		if(passwd == null){
			$("#chkPw").css("display", "block");
			$("#chkPw").focus()
			return
		}
		
		// 실시간 로그인 가능한 아이디 비밀번호 체킹
		$.ajax({
			type : "post", 								// POST방식
			url : "/shop/admin/login",					// 요청 url
			data:{										// 전달할 파라미터 값
				userid : userid,
				passwd : passwd,
			},
			dataType : "json",							// 데이터 타입 json
			success : function(json){
				// ajax 처리 성공시 수행할 처리
				if(json.adminId === undefined){
					$("#loginResult").css("display", "block");
				}else{
					console.log('성공')
					window.location.href = "/shop/admin"
				}
			},
			error : function(error) {  
				window.location.href = "/shop/error"
			}
		});
	});
	
	/* focus form-userid */
	$("#userid").focus(function(){
		$("#chkId").css("display", "none");
	});
	
	$("#userid").focusout(function(){
		if(userid == null){
			$("#chkId").css("display", "block");
			return
		}
	});
	/* focus form-userid */
	
	/* focus form-passwd */
	$("#passwd").focus(function(){
		$("#chkPw").css("display", "none");
	});
	
	$("#passwd").focusout(function(){
		if(passwd == null){
			$("#chkPw").css("display", "block");
			return
		}
	});
	/* focus form-passwd */
	
})(jQuery);