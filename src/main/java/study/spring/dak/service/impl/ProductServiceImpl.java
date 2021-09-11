package study.spring.dak.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Product;
import study.spring.dak.service.ProductService;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Product> getProductList(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	@Override
	public int editProduct(Product input) throws Exception {
		  int result = 0;

	        try {
	            result = sqlSession.update("ProductMapper.updateItem", input);

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
	 * 신상품 리스트 조회 
	 */
	@Override
	public List<Product> getProductListNew(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListNew", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	
	/**
	 * 타임세일 리스트 조회
	 */
	@Override
	public List<Product> getProductListSale(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListSale", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	


	/**
	 * 알뜰킹 조회 
	 */
	@Override
	public List<Product> getProductListSave(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListSave", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}


	/**
	 * 특급배송 리스트 조회 
	 */
	@Override
	public List<Product> getProductListExpress(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListExpress", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	/**
	 * 상품 데이터가 저장되어있는 개수 조회 
	 */
	@Override
	public int getProductCount(Product input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("ProductMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	/**
	 * 상품 상세 페이지 
	 */
	@Override
	public Product getProductItem(Product input) throws Exception {
		Product result = null;

        try {
            result = sqlSession.selectOne("ProductMapper.selectItem", input);

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


	
	// 섹션 페이지 
	@Override
	public List<Product> getProductListCate(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListSectionCate", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}


	// 판매킹 페이지 
	@Override
	public List<Product> getProductListPopular(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListPopular", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}


	@Override
	public List<Product> getProductListPopularIndex(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListPopularIndex", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	@Override
	public List<Product> getProductListNewIndex(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListNewIndex", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	@Override
	public List<Product> getProductListCateMain(Product input) throws Exception {
		List<Product> result = null;
		
		try {
			result = sqlSession.selectList("ProductMapper.selectListSectionCateMain", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	
	
	
	/** 주문 완료 후 구매한 수량을 늘리기 위한 메서드 */
	@Override
	public int updateProductSv(Product input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("ProductMapper.updateProductSv", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("주문량 업데이트를 위해 조회할 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("주문량 업데이트에 실패하였습니다.");
		}
		
		return result;
		
	}
	
	


	
	
}
