package study.spring.dak.model;

import java.util.List;


import lombok.Data;

@Data
public class SubCategory {
	
	private int subCateNo;
	
	private String subCateName;
	
	private int mainCateNo;
	private String mainCateName;
	
	private List<Product> product;
	
}
