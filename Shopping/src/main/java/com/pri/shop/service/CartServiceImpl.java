package com.pri.shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pri.shop.dao.CartDao;
import com.pri.shop.dto.CartDto;
import com.pri.shop.dto.CartProductDto;

@Service
public class CartServiceImpl implements CartService{
	private final CartDao cartDao;
	
	@Autowired
	public CartServiceImpl(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	/* 장바구니에 상품추가 */
	@Override
	public boolean addProduct(CartDto cartDto) {
		if(cartDao.insertCart(cartDto) > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	/* 장바구니 조회 */
	@Override
	public ArrayList<CartProductDto> CartList(String userid) {
		return cartDao.selectCart(userid);
	}
	
	/* 장바구니 갯수 조회 */
	@Override
	public int countCart(String userid) {
		return cartDao.countCart(userid);
	}
	
	/* 장바구니 상품 중복체크 */
	@Override
	public CartDto isProduct(CartDto cartDto) {
		return cartDao.selectProCode(cartDto);
	};
	
	/* 장바구니 수량 변경 */
	@Override
	public boolean updateQuantity(CartDto cartDto) {
		if(cartDao.updateQuantity(cartDto) > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	/* 장바구니 상품 삭제 */
	@Override
	public int delProdudct(String cart_no) {
		return cartDao.deleteCart(cart_no);
	}
	
}
