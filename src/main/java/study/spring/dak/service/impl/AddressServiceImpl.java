package study.spring.dak.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.Address;
import study.spring.dak.service.AddressService;

@Service
@Slf4j
public class AddressServiceImpl  implements AddressService {
	
	@Autowired
	SqlSession sqlSession;

	
	/**
	 * 배송지 리스트 조회 
	 */
	@Override
	public List<Address> getListAddress(Address input) throws Exception {
		
		List<Address> result = null;
		
		try {
			result = sqlSession.selectList("AddressMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회할 배송지가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("배송지 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	
	/**
	 * 배송지 단일행 조회 
	 */
	@Override
	public Address getItemAddress(Address input) throws Exception {
		
		Address result = null;

        try {
            result = sqlSession.selectOne("AddressMapper.selectItem", input);

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
	 * 배송지 삭제 
	 */
	@Override
	public int deleteAddressItem(Address input) throws Exception {
		int result = 0;

        try {
            
            result = sqlSession.delete("AddressMapper.deleteItem", input);

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
	 * 배송지 추가 
	 */
	@Override
	public int addAddressItem(Address input) throws Exception {
		
		int result = 0;

        try {
            result = sqlSession.insert("AddressMapper.insertItem", input);

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
	 * 배송지 수정
	 */
	@Override
	public int updateAddressItem(Address input) throws Exception {
		
		int result = 0;

        try {
            result = sqlSession.update("AddressMapper.updateItem", input);

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

	@Override
	public int countAddressItem(int memno) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memno", memno);
        
        return sqlSession.selectOne("AddressMapper.selectCount", map);
        
    }

	@Override
	public Address getItemAddressForCount(Address input) throws Exception {
		Address result = null;

        try {
            result = sqlSession.selectOne("AddressMapper.selectItemForCount", input);

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
	public Address getAddressItemByMemno(int memno) throws Exception {
		Address result = new Address();
		
		try {
			result = sqlSession.selectOne("AddressMapper.selectAddressItemByMemno", memno);
			
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

}
