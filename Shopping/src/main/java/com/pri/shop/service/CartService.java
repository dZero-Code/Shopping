package com.pri.shop.service;

import java.util.ArrayList;

import com.pri.shop.dto.CartDto;
import com.pri.shop.dto.CartProductDto;

public interface CartService {
	/* 장바구니에 상품추가 */
	public boolean addProduct(CartDto cartDto);

	/* 장바구니 조회 */
	public ArrayList<CartProductDto> CartList(String userid);
	
	/* 장바구니 갯수 조회 */
	public int countCart(String userid);
	
	/* 장바구니 상품 중복체크 */
	public CartDto isProduct(CartDto cartDto);
	
	/* 장바구니 수량 변경 */
	public boolean updateQuantity(CartDto cartDto);
	
	/* 장바구니의 상품삭제 */
	public int delProdudct(String cart_no);
	
}
