package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.Coupon;

public interface CouponService {
	
	/**
	 * 쿠폰 데이터 상세조회
	 */
	public Coupon getCouponItem(Coupon input) throws Exception;
	
	
	/**
	 * 사용 가능 쿠폰 데이터 목록 조회
	 */
	public List<Coupon> getAvailableCouponList(Coupon input) throws Exception;
	
	
	/**
	 * 사용 만료 쿠폰 데이터 목록 조회
	 */
	public List<Coupon> getExpiredCouponList(Coupon input) throws Exception;
	
	
	/**
	 * 쿠폰 데이터가 저장되어있는 개수 조회
	 */
	//public int getCouponCount(Coupon input) throws Exception;
	
	
	/**
	 * 쿠폰 데이터 등록 
	 */
	public int addCoupon(Coupon input) throws Exception;
	
	
	/**
	 * 쿠폰 데이터 수정 
	 */
	public int editCoupon(Coupon input) throws Exception;
	
	
	/**
	 * 쿠폰 데이터 삭제 
	 */
	public int deleteCoupon(Coupon input) throws Exception;


	/**
	 * 주문페이지에서 사용 할 사용가능 쿠폰 목록 조회
	 */
	public List<Coupon> getCouponListByMemno(int memno) throws Exception;
	
	
	/**
	 * 주문시 사용한 쿠폰 삭제
	 */
	public int expireCoupon(int coupno) throws Exception;
	
	/**
	 * 쿠폰 목록 조회 (관리자페이지)
	 */
	public List<Coupon> getAdminCouponList(Coupon input) throws Exception;
	
	/**
	 * 쿠폰 데이터 상세조회
	 */
	public Coupon getAdminCouponItem(Coupon input) throws Exception;
	
	
	/**
	 *  쿠폰 중복 등록 방지 
	 */
	public int countCouponItem(String code, int memno) throws Exception;
	
	
	/**
	 *  쿠폰 카운트 (페이징 목록)
	 */
	public int getCouponCount(Coupon input) throws Exception;


	/** 주문 후 사용 완료된 쿠폰 사용완료 처리 */
	public int updateUsedCoupon(Coupon input) throws Exception;
	
}
