package study.spring.dak.service;

import java.util.List;

import study.spring.dak.model.OrderList;
import study.spring.dak.model.Review;

public interface ReviewService {
	public List<Review> getReviewList(Review input) throws Exception;
	public int getReviewCount(Review input) throws Exception;
	public int getMyReviewCount(Review input) throws Exception;
	public int addReview(Review input) throws Exception;
	public Review getReviewItem(Review input) throws Exception ;
	public List<Review> getMyReviewList(Review input) throws Exception ;
}
