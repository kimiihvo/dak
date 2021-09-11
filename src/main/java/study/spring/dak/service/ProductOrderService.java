package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.OrderList;
import study.spring.dak.model.ProductOrder;

public interface ProductOrderService {

	public int addProductOrder(ProductOrder input) throws Exception;

	public List<ProductOrder> getProductOrderList(ProductOrder input) throws Exception;

	public List<ProductOrder> getLatestProductOrderList(OrderList input) throws Exception;
	
}
