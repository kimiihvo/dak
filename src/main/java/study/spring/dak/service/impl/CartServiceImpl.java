package study.spring.dak.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Cart;
import study.spring.dak.model.OneOnOne;
import study.spring.dak.service.CartService;

@Service
@Slf4j
public class CartServiceImpl implements CartService{
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 장바구니 조회
	 */
	@Override
	public List<Cart> getListCart(Cart input) throws Exception {
		List<Cart> result = null;
		
		try {
			result = sqlSession.selectList("CartMapper.selectListCart", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 장바구니가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("장바구니 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	
	
	/**
	 * 장바구니 상품 삭제 
	 */
	@Override
	public int deleteCartItem(Cart input) throws Exception {
		int result = 0;

        try {
            
            result = sqlSession.delete("CartMapper.deleteItem", input);

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
	 * 장바구니 상품 추가
	 */
	@Override
	public int addCartItem(Cart input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("CartMapper.insertItem", input);

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
	 * 장바구니 상품 수정 
	 */
	@Override
	public int updateCartItem(Cart input) throws Exception {
		
		int result = 0;

        try {
            result = sqlSession.update("CartMapper.updateItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
    }


	/**
	 * 장바구니에 중복 상품이 있는지 검사 
	 */
	@Override
	public int countCartItem(int prdno, int memno) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prdno", prdno);
		map.put("memno", memno);
        
        return sqlSession.selectOne("CartMapper.selectCount", map);
        
    }
	/**
	 * 장바구니에 품목수
	 */
	@Override
	public int getcountCart(Cart input) throws Exception {
		int result =0;
		try {
			result= sqlSession.selectOne("CartMapper.selectCountAll",input);

		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수 조회에 실패했습니다.");}
		return result;
	}


	/**
	 * 장바구니 단일행 조회 
	 */
	@Override
	public Cart getItemCart(Cart input) throws Exception {
		Cart result = null;

        try {
            result = sqlSession.selectOne("CartMapper.selectItemCart", input);

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


	@Override
	public int deleteCartList(Cart input) throws Exception {
		
		int result = 0;

        try {
            
            result = sqlSession.delete("CartMapper.deleteList", input);

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


	@Override
	public Cart getCartItemByCartno(Cart input) throws Exception {
		
		Cart result = new Cart();
		
		try {
			result = sqlSession.selectOne("CartMapper.selectCartItemByCartno", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 카트가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("카트 불러오기에 실패했습니다.");
		}
		
		return result;
	}
}
