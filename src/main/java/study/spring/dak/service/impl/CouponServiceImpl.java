package study.spring.dak.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Coupon;
import study.spring.dak.service.CouponService;


@Service
@Slf4j
public class CouponServiceImpl implements CouponService {
	
	
	@Autowired
	SqlSession sqlSession;

	/**
	 * 쿠폰 상세 조회 
	 */
	@Override
	public Coupon getCouponItem(Coupon input) throws Exception {
		
		Coupon result = null;

        try {
            result = sqlSession.selectOne("CouponMapper.selectItem", input);

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
	 * 사용 가능 쿠폰 목록 조회 
	 */
	@Override
	public List<Coupon> getAvailableCouponList(Coupon input) throws Exception {
		
		List<Coupon> result = null;
		
		
		try {
			result = sqlSession.selectList("CouponMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 쿠폰이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("쿠폰 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	
	/**
	 * 사용 만료 쿠폰 목록 조회 
	 */
	@Override
	public List<Coupon> getExpiredCouponList(Coupon input) throws Exception {

		List<Coupon> result = null;
		
		
		try {
			result = sqlSession.selectList("CouponMapper.selectListExpired", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 쿠폰이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("쿠폰 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	

	/**
	 * 쿠폰 등록 
	 */
	@Override
	public int addCoupon(Coupon input) throws Exception {

		int result = 0;

        try {
            result = sqlSession.insert("CouponMapper.insertItem", input);

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
	 * 쿠폰 수정 (관리자만 가능 )
	 */
	@Override
	public int editCoupon(Coupon input) throws Exception {

		int result = 0;

        try {
            result = sqlSession.update("CouponMapper.updateItem", input);

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
	 * 쿠폰 삭제 (관리자만 가능 / 몇년 이상 지난 쿠폰 또는 잘못 뿌린 쿠폰 삭제)
	 */
	@Override
	public int deleteCoupon(Coupon input) throws Exception {
		
		int result = 0;

        try {
            
            result = sqlSession.delete("CouponMapper.deleteItem", input);

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
	 * 쿠폰 목록 조회 (관리자 페이지)
	 */
	@Override
	public List<Coupon> getAdminCouponList(Coupon input) throws Exception {
		List<Coupon> result = null;
		
		
		try {
			result = sqlSession.selectList("CouponMapper.adminSelectCouponList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 쿠폰이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("쿠폰 조회에 실패했습니다.");
			}
			
		
		return result;
	}

	

	/**
	 * (관리자) 쿠폰 상세 조회 
	 */
	@Override
	public Coupon getAdminCouponItem(Coupon input) throws Exception {
		
		Coupon result = null;

        try {
            result = sqlSession.selectOne("CouponMapper.adminSelectCouponItem", input);

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
	 * 쿠폰 중복 등록 방지 카운트 
	 */
	
	@Override
	public int countCouponItem(String code, int memno) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("memno", memno);
        
        return sqlSession.selectOne("CouponMapper.selectItemForCount", map);
	}


	@Override
	public int getCouponCount(Coupon input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("CouponMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }

	
	/**
	 * 주문페이지에서 사용 할 사용가능 쿠폰 목록 조회
	 */
	@Override
	public List<Coupon> getCouponListByMemno(int memno) throws Exception {
		
		List<Coupon> result = null;
		
		
		try {
			result = sqlSession.selectList("CouponMapper.selectCouponListByMemno", memno);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 쿠폰이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("쿠폰 조회에 실패했습니다.");
		}
		
		
		return result;
	}

	@Override
	public int expireCoupon(int coupno) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("CouponMapper.deleteCouponByCoupno", coupno);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 쿠폰이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("쿠폰 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/** 주문 후 사용 완료된 쿠폰 사용완료 처리 */
	@Override
	public int updateUsedCoupon(Coupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CouponMapper.updateUsedCoupon", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 쿠폰이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("쿠폰 사용처리를 위한 쿠폰 조회에 실패했습니다.");
		}
		
		return result;
	}
	
}
