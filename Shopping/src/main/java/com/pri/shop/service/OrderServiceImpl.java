package com.pri.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pri.shop.dao.OrderDao;
import com.pri.shop.dto.OrderDto;

@Service
public class OrderServiceImpl implements OrderService{
	private final OrderDao orderDao;
	
	@Autowired
	public OrderServiceImpl(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	/* 장바구니 주문 */
	@Override
	public boolean insertOrder(OrderDto orderDto) {
		return orderDao.insertOrder(orderDto);
	}
}
