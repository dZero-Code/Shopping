package com.pri.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pri.shop.dto.CartDto;
import com.pri.shop.dto.CartProductDto;
import com.pri.shop.dto.OrderDto;
import com.pri.shop.dto.ProductDto;
import com.pri.shop.service.CartService;
import com.pri.shop.service.OrderService;
import com.pri.shop.service.ProductService;

@Controller
public class OrderController {
	private final ProductService productService;
	private final CartService cartService;
	private final OrderService orderService;
	
	@Autowired
	public OrderController(ProductService productService, CartService cartService, OrderService orderService) {
		this.productService = productService;
		this.cartService = cartService;
		this.orderService = orderService;
	}
	
	// 상품 장바구니에 담기
	@RequestMapping(value = "/order/cart", method = RequestMethod.POST)
	public ModelAndView orderProduct(ProductDto productDto, HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		
		String product_code = productService.searchProCode(productDto);		// 상품 코드
		int quantity = productDto.getInventory(); 
		
		// 세션의 사용자ID 값 가져오기
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("id");
		
		CartDto cartDto = new CartDto();
		cartDto.setUserid(userid);
		cartDto.setProduct_code(product_code);
		cartDto.setQuantity(quantity);				// 주문수량

		// 이미 cart에 존재 : 수량증가, 존재하지 않으면 : 추가
		CartDto isProduct = cartService.isProduct(cartDto);
		if(isProduct == null) {
			cartService.addProduct(cartDto);
		}else {
			isProduct.setQuantity(isProduct.getQuantity() + quantity);
			cartService.updateQuantity(isProduct);
		}

		view.setViewName("redirect:/order/cart");
		
		return view;
	}
	
	// 장바구니로 이동
	@RequestMapping(value = "/order/cart", method = RequestMethod.GET)
	public ModelAndView reqCart(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("/order/cart");
		
		// 세션의 사용자ID 값 가져오기
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("id");

		ArrayList<CartProductDto> cartList = cartService.CartList(userid);
		view.addObject("cart", cartList);
		
		return view;
	}
	
	// 장바구니 물품 삭제
	@RequestMapping(value = "/order/cart/delete", method = RequestMethod.GET)
	public ModelAndView removeProduct(@RequestParam("cart_no") String cart_no) {
		ModelAndView view = new ModelAndView("");
		
		cartService.delProdudct(cart_no);
		
		view.setViewName("redirect:/order/cart");
		
		return view;
	}
	
	// 장바구니 주문하기
	@PostMapping("/order/order")
	@ResponseBody
	public Map<String, Object> insertOrder(@RequestParam String jsonData) {
		  JSONArray array = new JSONArray(jsonData);
		  List<Object> cartList = array.toList();
		  Map<String, Object> result = new HashMap<String, Object>();
		  
		  for(int i=0; i<cartList.size(); i++) {
			  String[] temp = cartList.get(i).toString().split(", ");
			  HashMap<String, String> cart = new HashMap<String, String>();
			  
			  cart.put(temp[0].substring(1, temp[0].indexOf("=")), temp[0].substring(temp[0].indexOf("=")+1));
			  cart.put(temp[1].substring(0, temp[1].indexOf("=")), temp[1].substring(temp[1].indexOf("=")+1));
			  cart.put(temp[2].substring(0, temp[2].indexOf("=")), temp[2].substring(temp[2].indexOf("=")+1));
			  cart.put(temp[3].substring(0, temp[3].indexOf("=")), temp[3].substring(temp[3].indexOf("=")+1, temp[3].indexOf("}")));
			  
			  OrderDto orderDto = new OrderDto();
			  orderDto.setOrder_product(cart.get("product_code"));
			  orderDto.setCount(Integer.parseInt(cart.get("quantity")));
			  orderDto.setOrder_user(cart.get("userid"));
			  orderDto.setOrder_status(0);
			  
			  orderService.insertOrder(orderDto);
			  cartService.delProdudct(cart.get("cart_no"));
		  }
		  result.put("success", true);
		
		return result;
	}
}