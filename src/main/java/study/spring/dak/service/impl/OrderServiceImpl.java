package study.spring.dak.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.model.OrderList;
import study.spring.dak.service.OrderService;

@Slf4j
@Controller
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int placeOrder(OrderList input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("OrderMapper.insertItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 주문이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("주문등록에 실패했습니다.");
		}
		
		return result;
	}
	

	@Override
	public List<OrderList> getOrderList(int memno) throws Exception {
		List<OrderList> result = new ArrayList<OrderList>();
		
		try {
			result = sqlSession.selectList("OrderMapper.selectOrderList", memno);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("주문리스트 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public List<OrderList> getOrderListByDate(Map<String, String> dateMap) throws Exception {
		
		List<OrderList> result = new ArrayList<OrderList>();
		
		try {
			result = sqlSession.selectList("OrderMapper.selectOrderListByDate", dateMap);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("기간별 주문리스트 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public OrderList getOrderItem(int odrno) throws Exception {
		OrderList result = new OrderList();
		
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderItem", odrno);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("조회된 주문이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("주문내역 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	

	@Override
	public int cancelOrder(OrderList input) {
		int result = 0;
		
		result = sqlSession.update("OrderMapper.cancelOrder", input);
		
		return result;
	}
	
	@Override
	public OrderList getLatestOrderItem(int memno) throws Exception {
		
		OrderList result = new OrderList();
		
		try {
			result = sqlSession.selectOne("OrderMapper.selectLatestOrderItem", memno);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
            throw new Exception("상세 주문내역 조회에 실패했습니다.");
		}
		
		return result;
		
	}

}
