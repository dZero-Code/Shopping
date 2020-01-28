/*
	joinus.js
*/

(function($) {
	var chkId = false;
	/* 회원가입 버튼 클릭시 */
	$("#join").on("click", function(e){
		e.preventDefault();
		
		/* 유효성 체크 알림 글 초기화 */
		$("#chkId").css("display", "none");
		$("#chkPw").css("display", "none");
		$("#chkRepw").css("display", "none");
		$("#chkName").css("display", "none");
		$("#chkBirth").css("display", "none");
		$("#chkEmail").css("display", "none");
		$("#chkPhone").css("display", "none");
		$("#chkAgree").css("display", "none");
		$("#unableId").css("display", "none");
		
		/* input의 값 가져오기 */
		let userid = $("#userid").val();
		let passwd = $("#passwd").val();
		let repasswd = $("#repasswd").val();
		let name = $("#name").val();
		let birth = $("#birth").val();
		let email = $("#email").val();
		let phone = $("#phone").val();
		let check1 = $("#check1").prop('checked');
		let check2 = $("#check2").prop('checked');
		
		
		// 아이디 유효성 검사
		if(!checkId(userid)){
			$("#ableId").css("display", "none");
			$("#chkId").css("display", "block");
			$("#userid").focus();
			return
		}
		
		// 비밀번호 유효성 검사
		if(!checkPw(passwd)){
			$("#chkPw").css("display", "block");
			$("#passwd").focus();
			return
		}
		
		if(passwd != repasswd){
			$("#chkRepw").css("display", "block");
			$("#repasswd").focus();
			return
		}
		
		// 이름 유효성 검사
		if(name.length == 0){
			$("#chkName").css("display", "block");
			$("#name").focus();
			return
		}
		
		// 생일 유효성 검사
		if(!checkBirth(birth)){
			$("#chkBirth").css("display", "block");
			$("#birth").focus();
			return
		}
		
		// 이메일 유효성 검사
		if(!checkEmail(email)){
			$("#chkEmail").css("display", "block");
			$("#email").focus();
			return
		}
		
		// 전화번호 유효성 검사
		if(!checkPhone(phone)){
			$("#chkPhone").css("display", "block");
			$("#phone").focus();
			return
		}
		
		// 필수 체크 항목 검사
		if(!check1 || !check2){
			$("#chkAgree").css("display", "block");
			return
		}
		
		// 중복체크 여부
		if(chkId)
			$("#frm").submit();
	});
	
	/* focus form-userid */
	$("#userid").focus(function(){
		$("#ableId").css("display", "none");
		$("#chkId").css("display", "none");
		chkId = false;
	});
	
	$("#userid").focusout(function(){
		if(!checkId($("#userid").val())){
			$("#chkId").css("display", "block");
		}else{
			$.ajax({
				type : "get", 				// get방식
				url : "chkId",				// 요청 url
				data:{						// 전달할 파라미터 값
					userid : $("#userid").val(),
				},
				dataType : "json",			// 데이터 타입 json
				success : function(json){
					// ajax 처리 성공시 수행할 처리
					if(json["create"] === undefined){		// 이미 존재하는 아이디 
						$('#unableId').css('display', 'block');
					}else{									// 사용가능한 아이디
						$('#ableId').css('display', 'block');
						chkId = true;
					}
				},
				error : function(error) {  
					window.location.href = "/shop/error"
				}
			}); // end of Ajax
		}
	});
	/* focus form-userid */
	
	/* focus form-passwd */
	$("#passwd").focus(function(){
		$("#chkPw").css("display", "none");
	});
	
	$("#passwd").focusout(function(){
		let passwd = $("#passwd").val();
		if(!checkPw(passwd)){
			$("#chkPw").css("display", "block");
		}
	});
	/* focus form-passwd */
	
	/* focus form-repasswd */
	$("#repasswd").focus(function(){
		$("#chkRepw").css("display", "none");
	});
	
	$("#repasswd").focusout(function(){
		let passwd = $("#passwd").val();
		let repasswd = $("#repasswd").val();
		if(passwd != repasswd){
			$("#chkRepw").css("display", "block");
		}
	});
	/* focus form-repasswd */
	
	/* focus form-name */
	$("#name").focus(function(){
		$("#chkName").css("display", "none");
	});
	
	$("#name").focusout(function(){
		let name = $("#name").val();
		if(name.length == 0){
			$("#chkName").css("display", "block");
		}
	});
	/* focus form-name */
	
	/* focus form-birth */
	$("#birth").focus(function(){
		$("#chkBirth").css("display", "none");
	});
	
	$("#birth").focusout(function(){
		let birth = $("#birth").val();
		if(!checkBirth(birth)){
			$("#chkBirth").css("display", "block");
		}
	});
	/* focus form-birth */
	
	/* focus form-email */
	$("#email").focus(function(){
		$("#chkEmail").css("display", "none");
	});
	
	$("#email").focusout(function(){
		let email = $("#email").val();
		if(!checkEmail(email)){
			$("#chkEmail").css("display", "block");
		}
	});
	/* focus form-email */
	
	/* focus form-phone */
	$("#phone").focus(function(){
		$("#chkPhone").css("display", "none");
	});
	
	$("#phone").focusout(function(){
		let phone = $("#phone").val();
		if(!checkPhone(phone)){
			$("#chkPhone").css("display", "block");
		}
	});
	/* focus form-phone */
	
	/* 전체 동의 체크박스 */
	$("#allCheck").click(function(){
		let chk = $(this).is(":checked")
		if(chk){
			$("#check1").prop("checked", true)
			$("#check2").prop("checked", true)
			$("#state_provided").prop("checked", true)
			$("#state_consignment").prop("checked", true)
		}else{
			$("#check1").prop("checked", false)
			$("#check2").prop("checked", false)
			$("#state_provided").prop("checked", false)
			$("#state_consignment").prop("checked", false)
		}
	});
	
	/* 마케팅 체크박스 */
	$("#marketCheck").click(function(){
		let chk = $(this).is(":checked")
		if(!chk){
			$("#state_email").prop("checked", false)
			$("#state_sms").prop("checked", false)
		}
	});
	
	$("#state_email").click(function(){
		let chk = $(this).is(":checked")
		if(chk){
			$("#marketCheck").prop("checked", true)
		}
	});
	
	$("#state_sms").click(function(){
		let chk = $(this).is(":checked")
		if(chk){
			$("#marketCheck").prop("checked", true)
		}
	});
	
})(jQuery);


/* 정규표현식 */
function checkId(id){
	let reg = /^[a-zA-Z0-9]{6,12}$/;
	if(!reg.test(id)){
		return false;
	}
	return true;
}

function checkPw(pw){
	let reg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	if(!reg.test(pw)){
		return false;
	}
	return true;
}

function checkEmail(email){
	let reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!reg.test(email)){
		return false;
	}
	return true;
}

function checkBirth(birth){
	let reg = /^[0-9]{6}$/;
	if(!reg.test(birth)){
		return false;
	}
	return true;
}

function checkPhone(phone){
	let reg = /^\d{3}-\d{3,4}-\d{4}$/;
	if(!reg.test(phone)){
		return false;
	}
	return true;
}
