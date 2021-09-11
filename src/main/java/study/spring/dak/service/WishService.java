package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.Wish;

public interface WishService {
	
	/**
	 * 찜한 상품 데이터 상세조회
	 */
	public Wish getWishItem(Wish input) throws Exception;
	
	/**
	 * 찜한 상품 데이터 상세조회 for delete
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public Wish getWishItemForDel(Wish input) throws Exception;
	
	
	/**
	 * 찜한 상품 데이터 목록 조회
	 */
	public List<Wish> getWishList(Wish input) throws Exception;
	
	
	/**
	 * 찜한 상품 데이터 등록 
	 */
	public int addWish(Wish input) throws Exception;
	
	
	
	/**
	 * 찜한 상품 데이터 삭제 
	 */
	public int deleteWish(Wish input) throws Exception;
	
	/**
	 * 찜한 상품 중복 조회
	 */
	public int countWishExist(int prdno, int memno) throws Exception;
	
	
	
	
}
