package com.pri.shop.service;

import com.pri.shop.dto.OrderDto;

public interface OrderService {
	/* 장바구니 주문 */
	public boolean insertOrder(OrderDto orderDto);
}
