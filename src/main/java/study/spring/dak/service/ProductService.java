package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.Product;

public interface ProductService {
	
	public List<Product> getProductList(Product input) throws Exception;

	public int getProductCount(Product input) throws Exception;
	
	
	// 신상품 리스트 조회 
	public List<Product> getProductListNew(Product input) throws Exception;
	
	public List<Product> getProductListNewIndex(Product input) throws Exception;
	
	
	// 타임세일 리스트 조회 
	public List<Product> getProductListSale(Product input) throws Exception;
	
	// 섹션 리스트 조회 
	public List<Product> getProductListCate(Product input) throws Exception;
	public List<Product> getProductListCateMain(Product input) throws Exception;
	
	
	// 알뜰킹 조회 
	public List<Product> getProductListSave(Product input) throws Exception;
	
	// 판매킹 조회 
	public List<Product> getProductListPopular(Product input) throws Exception;
	
	public List<Product> getProductListPopularIndex(Product input) throws Exception;
	
	// 특급배송 리스트 조회 
	public List<Product> getProductListExpress(Product input) throws Exception;

	// 상품 상세 페이지 (단일행조회)
	public Product getProductItem(Product input) throws Exception;
	public int editProduct(Product input) throws Exception ;

	/** 주문 완료 후 구매한 수량을 늘리기 위한 메서드 */
	public int updateProductSv(Product input) throws Exception;


	
}
