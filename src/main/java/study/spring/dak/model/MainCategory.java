package study.spring.dak.model;


import java.util.List;

import lombok.Data;

@Data
public class MainCategory {
	private int mainCateNo;
	private String mainCateName;
	private List<SubCategory> subCategory;
}
