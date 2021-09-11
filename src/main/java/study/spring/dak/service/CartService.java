package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.Cart;


public interface CartService {
	
	/**
	 * 장바구니 조회 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public List<Cart> getListCart(Cart input) throws Exception;
	
	/**
	 * 장바구니 단일행 조회 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public Cart getItemCart(Cart input) throws Exception;
	
	
	/**
	 * 장바구니 상품 삭제 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int deleteCartItem(Cart input) throws Exception;
	
	public int deleteCartList(Cart input) throws Exception;
	
	/**
	 * 장바구니 상품 추가 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int addCartItem(Cart input) throws Exception;
	
	
	/**
	 * 장바구니 상품 수정 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int updateCartItem(Cart input) throws Exception;
	
	
	/**
	 * 장바구니에 중복 상품이 있는지 검사 
	 * @param prdno
	 * @param memno
	 * @return
	 * @throws Exception
	 */
	public int countCartItem(int prdno, int memno) throws Exception;
	
	
	/**
	 * 장바구니 아이템을 장바구니 번호만으로 조회 -- 주문페이지에서 사용
	 */
	public Cart getCartItemByCartno(Cart input) throws Exception;
	

	/**
	 * 장바구니 아이템 수 
	 */
	public int getcountCart(Cart input) throws Exception ;
}
