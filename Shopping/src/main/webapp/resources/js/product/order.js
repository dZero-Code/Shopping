(function($) {
	cartPrice();
	
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
		
		cartPrice();
	});

	/*------------------
		cart order
	--------------------*/
	
	// 단일 주문
	$(document).on("click",".cart-order", function(e){
		e.preventDefault();
		
		if(confirm($(this).find(".pc-title h4").text()+'를 정말 주문하시겠습니까?')){
			const cartList = [];
			
			// 카트 번호
			let cart_no = $(this).next().val();
			
			// 상품 코드
			let product_code = $(this).nextAll().eq(1).val();
			
			// 상품의 갯수
			let quantity = $(this).parent().siblings(".quy-col").find("input").val();
			
			const cart = {
				cart_no : cart_no,
				product_code : product_code,
				userid : sessionId,
				quantity : quantity,
			}
			cartList.push(cart);
			console.log(cartList);
			
			let jsonData = JSON.stringify(cartList);
			
			$.ajax({
				url: '/shop/order/order',
				data: {
					"jsonData" : jsonData,
				},
				dataType: "json",
				type: 'POST',
				success: function(result){
					alert("결제생략");
					window.location.href="/";
				},
				error : function(e){
					window.location.href = "/shop/error"
				}
			});
		}
	});
	
	// 전체 주문
	$(document).on("click","#orderAll", function(e){
		e.preventDefault();

		if($("tbody").children().eq(0).find(".cart_no").length == 0){
			alert("구매할 상품이 존재하지 않습니다.");
		}else{
			if(confirm('담은 상품을 모두 주문하시겠습니까?')){
				const cartList = [];
				
				let num = 0;
				while($("tbody").children().eq(num).length != 0){
					// 카트 번호
					let cart_no = $("tbody").children().eq(num).find(".cart_no").val();
					
					// 상품 코드
					let product_code = $("tbody").children().eq(num).find(".product_code").val();
					
					// 상품의 갯수
					let quantity = $("tbody").children().eq(num).find("input").val();
					
					const cart = {
							cart_no : cart_no,
							product_code : product_code,
							userid : sessionId,
							quantity : quantity,
					}
					cartList.push(cart);
					
					num++;
				}
				// console.log(cartList);
				let jsonData = JSON.stringify(cartList);
				
				$.ajax({
					url: '/shop/order/order',
					data: {
						"jsonData" : jsonData,
					},
					dataType: "json",
					type: 'POST',
					success: function(result){
						alert("결제생략");
						window.location.href="/";
					},
					error : function(e){
						window.location.href="/shop/error"
					}
				});
			}
		}
	});
	
	
	/*------------------
		cart delete
	--------------------*/
	$(document).on("click",".cart-delete", function(e){
		e.preventDefault();
		cart_no = $(this).prev().val();
		
		if(confirm('정말 삭제하시겠습니까?')){
			location.href="/shop/order/cart/delete?cart_no="+cart_no;
		}
	});
	
})(jQuery);

function cartPrice(){
	let num = 0;
	
	while($("tbody").children().eq(num).length != 0){
		// 상품의 가격 가져오기
		let price = $("tbody").children().eq(num).find(".product-col p").text();
		
		// 상품의 갯수 가져오기
		let inputVal = $("tbody").children().eq(num).find("input").val();
		
		// 상품별 총가격 변경
		$("tbody").children().eq(num).find(".total-col h4").text(inputVal * price);
		
		num++;
	}
	
	// 전체 가격 변경
	let total = 0;
	var totalCol = document.getElementsByClassName('total-col')
	for(i=0; i<totalCol.length; i++){
		total += parseInt(totalCol[i].innerHTML.split('>')[1].split('<')[0]);
	}
	
	$('.total-cost').find('span').text(total);
}