package study.spring.dak.model;



import lombok.Data;

@Data
public class Cart {
	
	private int cartno;
	
	private int memno;
	
	private int prdno;
	private String title;
	private int price; 
	private String express;
	private String freeShipping;
	private String onSale;
	private String thumb;
	
	private int qty;
	private String regDate;
	
}
