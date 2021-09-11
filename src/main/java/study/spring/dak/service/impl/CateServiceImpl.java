package study.spring.dak.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.MainCategory;
import study.spring.dak.model.SubCategory;
import study.spring.dak.service.CateService;

@Slf4j
@Service
public class CateServiceImpl implements CateService {
	
	@Autowired
	SqlSession sqlSession;

	
	// 서브 카테고리 조회 
	@Override
	public List<SubCategory> getListCate(SubCategory input) throws Exception {
		List<SubCategory> result = null;
		
		try {
			result = sqlSession.selectList("CateMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 카테고리가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("카테고리 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	
	// 메인카테고리 조회 
	@Override
	public List<MainCategory> getListMainCate(MainCategory input) throws Exception {
		List<MainCategory> result = null;
		
		try {
			result = sqlSession.selectList("CateMapper.selectListMainCate", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 카테고리가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("카테고리 조회에 실패했습니다.");
		}
		
		
		return result;
	}

}
