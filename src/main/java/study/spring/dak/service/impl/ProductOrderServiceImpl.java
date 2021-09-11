package study.spring.dak.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.ProductOrder;
import study.spring.dak.service.ProductOrderService;

@Slf4j
@Controller
public class ProductOrderServiceImpl implements ProductOrderService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int addProductOrder(ProductOrder input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("ProductOrderMapper.insertItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 상세주문이 없습니다.");
        } catch (Exception e) {
             log.error(e.getLocalizedMessage());
            throw new Exception("상세주문 등록에 실패했습니다.");
		}
		
		return result;
	}

	public List<ProductOrder> getProductOrderList(ProductOrder input) throws Exception {
		List<ProductOrder> result = new ArrayList<ProductOrder>();
		
		try {
			result = sqlSession.selectList("ProductOrderMapper.selectProductOrderList", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 상세주문 리스트가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("상세주문 리스트 불러오기에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public List<ProductOrder> getLatestProductOrderList(OrderList input) throws Exception {
		List<ProductOrder> result = new ArrayList<ProductOrder>();
		
		try {
			result = sqlSession.selectList("ProductOrderMapper.selectProductOrderByOrderlist", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 상세주문 리스트가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("상세주문 리스트 불러오기에 실패했습니다.");
		}
		
		return result;
	}

}
