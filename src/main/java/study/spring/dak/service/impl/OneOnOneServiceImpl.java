package study.spring.dak.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Member;
import study.spring.dak.model.OneOnOne;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.Product;
import study.spring.dak.model.Review;
import study.spring.dak.service.AdminService;
import study.spring.dak.service.OneOnOneService;



@Service
@Slf4j
public class OneOnOneServiceImpl implements OneOnOneService {
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	
	
	
	/**-------------------------------1:1문의 게시판 --------------------*/

	@Override
	public List<OneOnOne> getOneOnOneList(OneOnOne input) throws Exception {
			List<OneOnOne> result = null;
		
		
		try {
			result = sqlSession.selectList("OneOnOneMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 1:1문의가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("1:1문의 조회에 실패했습니다.");
		}
		return result;
	}
	@Override
	public int getOneOnOneCount(OneOnOne input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("OneOnOneMapper.selectCountAll",input);

		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수 조회에 실패했습니다.");}
		return result;
	}


	@Override
	public int addOneOnOne(OneOnOne input) throws Exception {
		int result =0;
		try {
			result= sqlSession.insert("OneOnOneMapper.insertItem",input);
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
			
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");}
		return result;
	}







}
