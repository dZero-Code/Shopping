package com.pri.shop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pri.shop.dto.CartDto;
import com.pri.shop.dto.CartProductDto;

public interface CartDao {
	/* 장바구니에 상품추가 */
	@Insert("INSERT INTO cart(userid, product_code, quantity) VALUES(#{userid}, #{product_code}, #{quantity})")
	public int insertCart(CartDto cartDto);
	
	/* 장바구니 조회 */
	@Select("SELECT cart.cart_no, product.product_code, product_info.product_name, product_info.price, cart.quantity, product.size, product.color, product_info.class1, product_info.main_photo from cart, product, product_info where cart.product_code=product.product_code AND product.product_no = product_info.product_no AND cart.userid=#{userid}")
	public ArrayList<CartProductDto> selectCart(String userid);
	
	/* 장바구니 갯수 조회 */
	@Select("SELECT count(cart_no) FROM cart WHERE userid=#{userid}")
	public int countCart(String userid); 
	
	/* 장바구니 상품 중복체크 */
	@Select("SELECT * FROM cart WHERE product_code=#{product_code} AND userid=#{userid}")
	public CartDto selectProCode(CartDto cartDto);

	/* 장바구니 수량 변경 */
	@Update("UPDATE cart SET quantity=#{quantity} WHERE cart_no=#{cart_no}")
	public int updateQuantity(CartDto cartDto);
	
	/* 장바구니의 상품삭제 */
	@Delete("DELETE FROM cart WHERE cart_no=#{cart_no}")
	public int deleteCart(String cart_no);
	
}
