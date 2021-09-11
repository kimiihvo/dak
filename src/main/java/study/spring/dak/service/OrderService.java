package study.spring.dak.service;

import java.util.List;
import java.util.Map;

import study.spring.dak.model.OrderList;

public interface OrderService {
	
	public int placeOrder(OrderList input) throws Exception;
	
	public List<OrderList> getOrderList(int memno) throws Exception;

	public OrderList getOrderItem(int odrno) throws Exception;

	public int cancelOrder(OrderList input);

	public List<OrderList> getOrderListByDate(Map<String, String> dateMap) throws Exception;

	public OrderList getLatestOrderItem(int memno) throws Exception;
	
}
