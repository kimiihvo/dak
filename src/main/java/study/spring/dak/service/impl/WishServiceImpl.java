package study.spring.dak.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Wish;
import study.spring.dak.service.WishService;

@Service
@Slf4j
public class WishServiceImpl implements WishService {
	
	@Autowired
	SqlSession sqlSession;

	/**
	 * 찜한 상품 단일행 조회 
	 */
	@Override
	public Wish getWishItem(Wish input) throws Exception {

		Wish result = null;

        try {
            result = sqlSession.selectOne("WishMapper.selectItem", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

	/**
	 * 찜한 상품 단일행 조회 for delete
	 */
	@Override
	public Wish getWishItemForDel(Wish input) throws Exception {
		Wish result = null;

        try {
            result = sqlSession.selectOne("WishMapper.selectItemForDel", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
	}
	
	/**
	 * 찜한 상품 목록 조회 
	 */
	@Override
	public List<Wish> getWishList(Wish input) throws Exception {

		List<Wish> result = null;
		
		
		try {
			result = sqlSession.selectList("WishMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 찜한 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("찜한 상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	

	/**
	 * 찜한 상품 추가 
	 */
	@Override
	public int addWish(Wish input) throws Exception {
		
		int result = 0;

        try {
            result = sqlSession.insert("WishMapper.insertItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        }

        return result;
    }
	
	/**
	 * 찜한 상품 삭제 
	 */
	@Override
	public int deleteWish(Wish input) throws Exception {
		int result = 0;

        try {
            
            result = sqlSession.delete("WishMapper.deleteItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        }

        return result;
    }

	
	/**
	 * 찜한 상품 중복 검사 
	 */
	@Override
	public int countWishExist(int prdno, int memno) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prdno", prdno);
		map.put("memno", memno);
        
        return sqlSession.selectOne("WishMapper.selectCountExist", map);
        
	}





}
