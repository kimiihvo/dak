package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.MainCategory;
import study.spring.dak.model.SubCategory;


public interface CateService {
	
	public List<SubCategory> getListCate(SubCategory input) throws Exception;
	
	public List<MainCategory> getListMainCate(MainCategory input) throws Exception;
	
	
	
}
