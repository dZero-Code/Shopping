(function($) {
	mainProduct("OUTER");		// main 시작하자마자 Main_Product를 OUTER를 보여줌.
	
	/*------------------
		이미지 설정 setbg
	--------------------*/
	$('.set-bg').each(function() {
		var bg = $(this).data('setbg');
		$(this).css('background-image', 'url(' + bg + ')');
	});
	
	/*------------------
		메뉴바
	--------------------*/
	$('.main-menu').slicknav({
		prependTo:'.main-navbar .container',
		closedSymbol: '<i class="flaticon-right-arrow"></i>',
		openedSymbol: '<i class="flaticon-down-arrow"></i>'
	});


	/*------------------
		ScrollBar
	--------------------*/
	$(".cart-table-warp, .product-thumbs").niceScroll({
		cursorborder:"",
		cursorcolor:"#afafaf",
		boxzoom:false
	});


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
		메인 슬라이드
	--------------------*/
	var hero_s = $(".hero-slider");
    hero_s.owlCarousel({
        loop: true,
        margin: 0,
        nav: true,
        items: 1,
        dots: true,
        animateOut: 'fadeOut',
    	animateIn: 'fadeIn',
        navText: ['<i class="flaticon-left-arrow-1"></i>', '<i class="flaticon-right-arrow-1"></i>'],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        onInitialized: function() {
        	var a = this.items().length;
            $("#snh-1").html("<span>1</span><span>" + a + "</span>");
        }
    }).on("changed.owl.carousel", function(a) {
        var b = --a.item.index, a = a.item.count;
    	$("#snh-1").html("<span> "+ (1 > b ? b + a : b > a ? b - a : b) + "</span><span>" + a + "</span>");

    });

	hero_s.append('<div class="slider-nav-warp"><div class="slider-nav"></div></div>');
	$(".hero-slider .owl-nav, .hero-slider .owl-dots").appendTo('.slider-nav');



	/*------------------
		상품 슬라이드
	--------------------*/
	$('.product-slider').owlCarousel({
		loop: true,
		nav: true,
		dots: false,
		margin : 30,
		autoplay: true,
		navText: ['<i class="flaticon-left-arrow-1"></i>', '<i class="flaticon-right-arrow-1"></i>'],
		responsive : {
			0 : {
				items: 1,
			},
			480 : {
				items: 2,
			},
			768 : {
				items: 3,
			},
			1200 : {
				items: 4,
			}
		}
	});

	/*------------------
		Main Product
	--------------------*/
	$('.main_product').on('click', function(e){
		e.preventDefault();
		mainProduct($(this).text());
	});
	

	/*------------------
		Popular Services
	--------------------*/
	$('.popular-services-slider').owlCarousel({
		loop: true,
		dots: false,
		margin : 40,
		autoplay: true,
		nav:true,
		navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
		responsive : {
			0 : {
				items: 1,
			},
			768 : {
				items: 2,
			},
			991: {
				items: 3
			}
		}
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
		Range Slider
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


	/*-------------------
		Quantity change
	--------------------- */
    var proQty = $('.pro-qty');
	proQty.prepend('<span class="dec qtybtn">-</span>');
	proQty.append('<span class="inc qtybtn">+</span>');
	proQty.on('click', '.qtybtn', function () {
		var $button = $(this);
		var oldValue = $button.parent().find('input').val();
		if ($button.hasClass('inc')) {
			var newVal = parseFloat(oldValue) + 1;
			
		} else {
			// Don't allow decrementing below zero
			if (oldValue > 0) {
				var newVal = parseFloat(oldValue) - 1;
			} else {
				newVal = 0;
			}
		}
		
		$button.parent().find('input').val(newVal);
		let price = $button.closest('tr').find('.product-col').find('p').text();
		$button.closest('tr').find('.total-col').children().text(newVal * price);
		
		let total = 0;
		var obj = document.getElementsByClassName('total-col')
		for(i=0; i<obj.length; i++){
			total += parseInt(obj[i].innerHTML.split('>')[1].split('<')[0]);
		}
		
		$('.total-cost').find('span').text(total);
	});



	/*------------------
		Single Product
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
	
})(jQuery);

function mainProduct(class1){
	$.ajax({
		type : "get", 								// get방식
		url : "main_product",						// 요청 url
		data:{										// 전달할 파라미터 값
			class1 : class1,
		},
		dataType : "json",							// 데이터 타입 json
		success : function(json){
			// 성공시 상품 뿌리기
			const productList = json.productList;
			var pro = "";
			
			$(".set-main-pro").empty();
			$(".set-main-pro-btn").empty();
			
			$(productList).each(function(i, product){
				pro += '<div class="col-lg-3 col-sm-6">';
				pro += '<div class="product-item">';
				pro += '<div class="pi-pic">';
				pro += '<input type="hidden" class="product_no" value="'+product["product_no"]+'">';												
				if(product.sales > 0){
					pro += '<div class="tag-sale">sale</div>';
				}
				
				pro += '<a href="/shop/product/detail/'+product["product_no"]+'">';
				pro += '<img src="/shop/product/'+product["class1"]+'/'+product["main_photo"]+'" alt="빈 이미지입니다.">';
				pro += '</a>';
				pro += '<div class="pi-links">';
				pro += '<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>';
				pro += '<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>';
				pro += '</div>';
				pro += '</div>';
				pro += '<div class="pi-text">';
				pro += '<p class="right">조회수 : '+product.views+'</p>'
				pro += '<p>'+product.product_name +'</p>';
				pro += '<p>'+product.price+'</p>';
				pro += '</div>';
				pro += '</div>';
				pro += '</div>';
			});
			$(".set-main-pro").append(pro);
			
			
			var button = '<a href="/shop/product/category?class1='+productList[0]["class1"]+'&class2=&page=1" class="site-btn sb-line sb-dark">LOAD MORE</a>';
			$(".set-main-pro-btn").append(button);
		},
		error : function(error) {  
			window.location.href = "/shop/error"
		}
	});
}