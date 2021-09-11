package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.Address;


public interface AddressService {
	
	/**
	 * 배송지 리스트 조회
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public List<Address> getListAddress(Address input) throws Exception;
	
	/**
	 * 배송지 단일행 조회 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public Address getItemAddress(Address input) throws Exception;
	
	/**
	 * 배송지 단일행 조회 For Count
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public Address getItemAddressForCount(Address input) throws Exception;
	
	/**
	 * 배송지 삭제 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int deleteAddressItem(Address input) throws Exception;
	
	/**
	 * 배송지 추가 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int addAddressItem(Address input) throws Exception;
	
	
	/**
	 * 배송지 수정 
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int updateAddressItem(Address input) throws Exception;
	
	/**
	 * 배송지 중복 검사 
	 * @param prdno
	 * @param memno
	 * @return
	 * @throws Exception
	 */
	public int countAddressItem(int memno) throws Exception;
	
	/**
	 * 멤버넘버로 해당 멤버의 기본 배송지를 조회
	 */
	public Address getAddressItemByMemno(int memno) throws Exception;

}
