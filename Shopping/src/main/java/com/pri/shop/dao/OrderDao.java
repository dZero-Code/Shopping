package com.pri.shop.dao;

import org.apache.ibatis.annotations.Insert;

import com.pri.shop.dto.OrderDto;

public interface OrderDao {
	/* 상품 주문 */
	@Insert("INSERT INTO orders(order_user, order_product, count, order_status) VALUES(#{order_user}, #{order_product}, #{count}, #{order_status})")
	public boolean insertOrder(OrderDto orderDto);
}
