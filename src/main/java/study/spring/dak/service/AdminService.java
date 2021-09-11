package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.Member;
import study.spring.dak.model.OneOnOne;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.Product;
import study.spring.dak.model.ProductOrder;
import study.spring.dak.model.Review;

public interface AdminService {
	
	
	public Member getAdminLogin(Member input) throws Exception;
	
	
	/** 상품 서비스*/
	public List<Product> getAdminProductList(Product input) throws Exception;
	public int getAdminProductCount (Product input) throws Exception;
	public Product getAdminProductItem(Product input) throws Exception;
	public int addAdminProduct(Product input) throws Exception;  
	public int editAdminProduct(Product input) throws Exception;
	public int deleteAdminProduct(Product input) throws Exception;
	public List<Product> getAdminSubCateList(Product input) throws Exception ;
	public List<Product> getAdminMainCateList(Product input) throws Exception ;
	
	
	
	/** 주문결제 서비스*/
	public List<OrderList> getAdminOrderListList(OrderList input) throws Exception;
	public int getAdminOrderListCount (OrderList input) throws Exception;
	public OrderList getAdminOrderListItem(OrderList input) throws Exception;
	public int editAdminOrderList(OrderList input) throws Exception;
	public List<ProductOrder> getAdminProductOrderList(ProductOrder input) throws Exception;
	/** 회원 서비스*/
	public List<Member> getAdminMemberList(Member input) throws Exception;
	public int getAdminMemberCount (Member input) throws Exception;
	public Member getAdminMemberItem(Member input) throws Exception;
	public int editAdminMember(Member input) throws Exception;
	
	/** 1:1 문의 서비스*/
	public List<OneOnOne> getAdminOneOnOneList(OneOnOne input) throws Exception;
	public int getAdminOneOnOneCount(OneOnOne input) throws Exception;
	public OneOnOne getAdminOneOnOneItem(OneOnOne input) throws Exception ;
	public int addAdminOneOnOne(OneOnOne input) throws Exception;  
	public int editAdminOneOnOne(OneOnOne input) throws Exception;
	public int deleteAdminOneOnOne(OneOnOne input) throws Exception;
	
	
	/** 리뷰 서비스 */
	public List<Review> getAdminReviewList(Review input) throws Exception;
	public int getAdminReviewCount(Review input) throws Exception;
	public Review getAdminReviewItem(Review input) throws Exception ;
	public int addAdminReview(Review input) throws Exception;  
	public int deleteAdminReview(Review input) throws Exception;
}
