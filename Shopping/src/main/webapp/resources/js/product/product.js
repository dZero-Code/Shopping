(function($) {
	/*------------------
		카테고리 메뉴
	--------------------*/
	$('.category-menu > li').hover( function(e) {
		$(this).addClass('active');
		e.preventDefault();
	});
	$('.category-menu').mouseleave( function(e) {
		$('.category-menu li').removeClass('active');
		e.preventDefault();
	});
	
	
	/*------------------
		Accordions
	--------------------*/
	$('.panel-link').on('click', function (e) {
		$('.panel-link').removeClass('active');
		var $this = $(this);
		if (!$this.hasClass('active')) {
			$this.addClass('active');
		}
		e.preventDefault();
	});
	
	/*-------------------
		수량 변경
	--------------------- */
	var proQty = $('.pro-qty');
	proQty.prepend('<span class="dec qtybtn">-</span>');
	proQty.append('<span class="inc qtybtn">+</span>');
	proQty.on('click', '.qtybtn', function () {
		var $button = $(this);
		
		// input의 값 변경
		let oldValue = $button.parent().find('input').val();
		let newVal = 0;
		if ($button.hasClass('inc')) {
			newVal = parseFloat(oldValue) + 1;
		} else {
			if (oldValue > 0) {
				newVal = parseFloat(oldValue) - 1;
			}
		}
		$button.parent().find('input').val(newVal);
	});
	
	/*-------------------
		상품 가격 조회
	--------------------- */
	var rangeSlider = $(".price-range"),
		minamount = $("#minamount"),
		maxamount = $("#maxamount"),
		minPrice = rangeSlider.data('min'),
		maxPrice = rangeSlider.data('max');
	rangeSlider.slider({
		range: true,
		min: minPrice,
		max: maxPrice,
		step : 1000,
		values: [minPrice, maxPrice],
		slide: function (event, ui) {
			minamount.val(ui.values[0]);
			maxamount.val(ui.values[1]);
		}
	});
	minamount.val(rangeSlider.slider("values", 0));
	maxamount.val(rangeSlider.slider("values", 1));
	
	
	/*------------------
		사진 줌 효과
	--------------------*/
	$('.product-thumbs-track > .pt').on('click', function(){
		$('.product-thumbs-track .pt').removeClass('active');
		$(this).addClass('active');
		var imgurl = $(this).data('imgbigurl');
		var bigImg = $('.product-big-img').attr('src');
		if(imgurl != bigImg) {
			$('.product-big-img').attr({src: imgurl});
			$('.zoomImg').attr({src: imgurl});
		}
	});
	
	
	$('.product-pic-zoom').zoom();

	
	/*****************
		- 상품추가 -
	*****************/
	$("#class1").on("change", function(e) {
	//$("#class1").change(function(e) {
		const OUTER = [ '가디건', '자켓', '코트', '블레이저', '집업', '무스탕', '패딩' ];
		const TEE = [ '긴팔티', '반팔티', '니트', '맨투맨', '민소매' ];
		const SHIRT = [ '베이직', '데님', '패턴', '반팔', ];
		const PANTS = [ '슬랙스', '밴딩팬츠', '면바지', '청바지', '반바지' ];
		const TRAINING = [ '트레이닝복' ];
		const SHOES = [ '스니커즈', '로퍼', '워커', '샌들' ];
		const ACC = [ '모자', '머플러', '장갑', '벨트', '쥬얼리', '선글라스' ];

		var class2 = document.getElementById("class2");
		var choose;

		class2.options.length = 0;
		
		$("select option:selected").each(function(){
			s = $(this).val();
			
			if (s == "OUTER") choose = OUTER;
			else if (s == "TEE") choose = TEE;
			else if (s == "SHIRT") choose = SHIRT;
			else if (s == "PANTS") choose = PANTS;
			else if (s == "TRAINING") choose = TRAINING;
			else if (s == "SHOES") choose = SHOES;
			else if (s == "ACC") choose = ACC;
			
			for (c in choose) {
				var opt = document.createElement("option");
				opt.value = choose[c];
				opt.innerHTML = choose[c];
				class2.appendChild(opt);
			}
        });

	}).change();

	
	$('#photo').on("change", function(e) {
		var filesArr = Array.prototype.slice.call(e.target.files);
		
		filesArr.forEach(function(file){
			if(!file.type.match("image.*")){
				alert('이미지만 선택 가능합니다.');
				return;
			}
			
			$("label[for='photo']").text(filesArr[0].name);
			
			sel_file = file;
			
			var reader = new FileReader();
			reader.onload = function(evt){
				$("#uploadImg").attr("src", evt.target.result);
			}
			reader.readAsDataURL(file);
		});
	});
	
	
	/*****************
		- 상품삭제 -
	*****************/
	$('.delete').on('click', function(e){
		e.preventDefault();
		const obj = $(this).parent().parent().prev().val();
		if(confirm('정말 삭제하시겠습니까?')){
			$.ajax({
				type : "post", 								// POST방식
				url : "/shop/product/delete",				// 요청 url
				data:{										// 전달할 파라미터 값
					product_no : obj,
				},
				dataType : "json",							// 데이터 타입 json
				success : function(json){
					 window.location.reload();
				},
				error : function(error) {  
					window.location.href = "/shop/error"
				}
			});
		}
		
	});
	
	/*********************
		- 상품 Detail -
	*********************/
	var colorOk = "";
	var sizeOk = "";
	
	// 사이즈 선택
	$(document).on('click', 'input[name=size]', function(){
		sizeOk=$("input[name='size']:checked").attr('id').split('_')[1];
		product_no = $('#product_no').val();
		
		// 사이즈별 색상 조회
		$.ajax({
			type : "post", 								// POST방식
			url : "/shop/product/detail/color",			// 요청 url
			data:{										// 전달할 파라미터 값
				product_no : product_no,
				size : sizeOk,
			},
			dataType : "json",							// 데이터 타입 json
			success : function(json){
				// 색상별 조회가 필요
				$("#chColor").empty();
				
				var str = "";
				str += '<p>color</p>'
				json.color.forEach(function(color){
					str += '<div class="sc-item">';
					str += '<input type="radio" name="color" id="color_'+color+'" value="'+color+'">';
					str += '<label for="color_'+color+'" style="background:'+color+'"></label>';
					str += '</div>';
				});
				
				$("#chColor").append(str);
			},
			error : function(error) {  
				window.location.href = "/shop/error"
			}
		});
	});
	
	// 색상 선택
	$(document).on('click', 'input[name=color]', function(){
		colorOk=$("input[name='color']:checked").attr('id').split('_')[1];
		product_no = $('#product_no').val();
		
		if(colorOk != "" && sizeOk != ""){
			// 실시간 수량 확인
			$.ajax({
				type : "post", 								// POST방식
				url : "/shop/product/detail/inven",			// 요청 url
				data:{										// 전달할 파라미터 값
					product_no : product_no,
					color : colorOk,
					size : sizeOk,
				},
				dataType : "json",							// 데이터 타입 json
				success : function(json){
					$('.cnt').text(json.cnt);
				},
				error : function(error) {  
					window.location.href = "/shop/error"
				}
			});
		}
	});
	
	// 주문하기 클릭
	$('.goCart').on('click', function(e){
		e.preventDefault();
		
		if(sessionId == null){
			alert('로그인을 해주세요.');
		}else if(colorOk == "" && sizeOk == ""){
			alert('옵션을 선택해주세요.');
		}else if(parseInt($(".cnt").text()) < parseInt($("#inventory").val())){
			alert('수량이 부족합니다. 금방 채울께요');
		}else{
			$("#cart").submit();
		}
	});
	
	
	/*******************
		- 상품옵션 -
	*******************/
	$(document).on('click', '#optAdd',function(e){
		e.preventDefault();
		// 유효성 검사
		frm.submit();
	});
	
	$('.addInven').on('click', function(e){
		e.preventDefault();
		let product_code = $(this).parent().siblings('input').next().children().val();
		let product_no = $(this).parent().siblings('input').val();

		let input = 0;
		while(true){
			input = prompt('추가할 수량을 적어주세요.');
		    if (input == null){
		    	return;
		    }else if(isNaN(input)){
		    	alert('숫자만 입력해주세요.');
			}else{
		    	break;
		    }
		}
		
		window.location.href = "/shop/product/addInven?product_code="+product_code+"&input="+input;
	});
	
	// 수정을 위한 readonly 속성 제거
	$(document).on('click', '.optModify',function(e){
		e.preventDefault();
		
		// form에 id부여
		$(this).parent().parent().parent().attr("id","frm2");

		/* input의 readonly 속성 모두 제거 */
		//$(this).parent().siblings('input').next().children().removeAttr('readonly')		// product_code는 pk이기 때문에 일단 못바꾸게 설정 -> 추후 디비 재설계 고려 (no 추가)
		$(this).parent().siblings('input').next().next().children().removeAttr('readonly')
		$(this).parent().siblings('input').next().next().next().children().removeAttr('readonly')
		$(this).parent().siblings('input').next().next().next().next().children().removeAttr('readonly')
		
		// 버튼 수정 및 삭제
		$(this).prev().remove();		
		
		$(this).attr('id', 'optUpdate');
		$(this).removeClass('optModify');
		
		$(this).next().removeClass('optDelete');
		$(this).next().attr('id', 'optCancel');
		$(this).next().text('취소');
	});
	
	// 수정 버튼
	$(document).on('click', '#optUpdate',function(e){
		e.preventDefault();
		// 유효성 검사
		
		frm2.submit();
	});
	
	// 수정 취소 버튼
	$(document).on('click', '#optCancel',function(e){
		e.preventDefault();
				
		cancel($(this).prev());
	});
	
	
	//제거 버튼
	$(document).on('click', '.optDelete',function(e){
		e.preventDefault();
		if(confirm("정말 삭제하겠습니까?")){
			let product_code = $(this).parent().siblings('input').next().children().val()
			
			window.location.href = "/shop/product/deleteOpt?product_code="+product_code;
		}
	});
	
	
})(jQuery);

function cancel(obj){
	// form에 id해제
	obj.parent().parent().parent().removeAttr("id","frm2");

	/* input의 readonly 속성 복구 */
	/** 추후 next()말고 html에 id나 class를 추가하여 find() 사용하면 다수의 next()를 줄일수 있음 **/
	obj.parent().siblings('input').next().children().attr('readonly')
	obj.parent().siblings('input').next().next().children().attr('readonly')
	obj.parent().siblings('input').next().next().next().children().attr('readonly')
	obj.parent().siblings('input').next().next().next().next().children().attr('readonly')
	
	// 버튼 재생성 및 id 해제
	obj.parent().prepend('<button>수량추가</button>')
	obj.prev().addClass('addInven');
	obj.prev().addClass('opt-btn');
	
	obj.removeAttr('id', 'optModify');
	obj.addClass('optModify');
	
	obj.next().addClass('optDelete');
	obj.next().removeAttr('id', 'optCancel');
	obj.next().text('삭제')
}