package study.spring.dak.model;

import lombok.Data;

@Data
public class Wish {
	
	private int wishno;
	
	private int prdno;
	private int memno;
	
	private String title;
	private String thumb;
	private int price;
	
	
}
