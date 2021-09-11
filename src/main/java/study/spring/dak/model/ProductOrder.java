package study.spring.dak.model;

import lombok.Data;

@Data
public class ProductOrder {
	
	private int prdno;
	private int odrno;
	
	private int price;
	private int qty;
	
	private String title;
	private String thumb;
	
	
	private Product product;
	private OrderList orderList;
}
