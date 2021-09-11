package study.spring.dak.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Review;
import study.spring.dak.service.ReviewService;



@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<Review> getReviewList(Review input) throws Exception {
		List<Review> result = null;
		try {
			result = sqlSession.selectList("ReviewMapper.selectList", input);
		}
		catch (Exception e) {
			
			throw new Exception("리뷰 조회에 실패했습니다.");
		}
		return result;
	}
	
	@Override
	public int getMyReviewCount(Review input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("ReviewMapper.selectMyReviewCountAll",input);

		} 
		catch(Exception e) {
		
			throw new Exception("데이터 수 조회에 실패했습니다.");}
		return result;
		
	}
	
	@Override
	public int getReviewCount(Review input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("ReviewMapper.selectCountAll",input);

		} catch(Exception e) {
			throw new Exception("데이터 수 조회에 실패했습니다.");}
		return result;
	}


	@Override
	public int addReview(Review input) throws Exception {
		int result =0;
		try {
			result= sqlSession.insert("ReviewMapper.insertItem",input);
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
			
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}

	@Override
	public Review getReviewItem(Review input) throws Exception {
		Review result = null;

        try {
            result = sqlSession.selectOne("ReviewMapper.selectReviewItem", input);
            
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
	}

	@Override
	public List<Review> getMyReviewList(Review input) throws Exception {

		
			List<Review> result = null;
			
			try {
				result = sqlSession.selectList("ReviewMapper.selectMyReviewList", input);
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
	            throw new Exception("리뷰페이지 주문리스트 조회에 실패했습니다.");
			}
			
			return result;
	
	}





}
