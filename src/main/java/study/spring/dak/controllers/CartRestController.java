package study.spring.dak.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Cart;
import study.spring.dak.model.Member;
import study.spring.dak.model.Wish;
import study.spring.dak.service.CartService;

@Slf4j
@RestController
public class CartRestController {
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired CartService cartService; 
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	/** 사용 가능 쿠폰 목록 조회 */
    @RequestMapping(value = "/shop/cart", method = RequestMethod.GET)
    public Map<String, Object> get_available_list(HttpSession session) {

		Member m = (Member) session.getAttribute("login");

		int memno = m.getMemno();
        

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값을 Beans에 담는다.
        Cart input = new Cart();
        input.setMemno(memno);

        
        List<Cart> output = null;   // 조회결과가 저장될 객체
       

        try {
            // 데이터 조회하기
            output = cartService.getListCart(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);

        return webHelper.getJsonData(data);
    }
    
    /** 장바구니 등록 (디테일페이지에서) */
    @RequestMapping(value = "/shop/cart_add_ok", method = RequestMethod.POST)
    public Map<String, Object> post(HttpSession session,
    		@RequestParam(value = "memno", defaultValue = "0") int memno,
			@RequestParam(value = "prdno", defaultValue = "0") int prdno,
			@RequestParam(value = "qty", defaultValue = "0") int qty) {
    	
    	Member m = (Member) session.getAttribute("login");
		memno = m.getMemno();

		/** 2) 데이터 저장하기 */
		
		Cart input = new Cart();
		input.setMemno(memno);
		input.setPrdno(prdno);

		try {
			// 중복 상품이 있는지 검사
			int count = cartService.countCartItem(prdno, memno);
			System.out.print(count);
			
			if (count != 0) {

				// DB의 정보를 가져올 빈즈 생성
				Cart db = null;

				// 정보를 가져옴
				db = cartService.getItemCart(input);
				log.error(db.toString());
				// 개수만 담음
				int data = db.getQty();

				// input에 추가할 개수와 원래 개수를 더해서 담음
				input.setQty(qty + data);

				log.debug(input.toString());

				cartService.updateCartItem(input);
				log.error(input.toString());
			} else {
				input.setQty(qty);
				cartService.addCartItem(input);
			}
			
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 JSON 출력 */
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("input", input);
        
        return webHelper.getJsonData(map);
    }
    
    
    @RequestMapping(value = "/shop/cart_count", method = RequestMethod.GET)
    public Map<String, Object> cart_count(HttpSession session) {
    	
    	Member m = (Member) session.getAttribute("login");
    	if(m!=null) {
    	Cart input = new Cart();
    	input.setMemno(m.getMemno());
    	int count=0;
		try {
			 count = cartService.getcountCart(input);
			
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 JSON 출력 */
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("count", count);
        
        return webHelper.getJsonData(map);}
    	
    	return webHelper.getJsonData();
    	
    }
    

    /** 삭제 처리 */
//    @RequestMapping(value = "/shop/cart_delete", method = RequestMethod.POST)
//    public Map<String, Object> delete(HttpSession session,
//			@RequestParam(value = "cart-check") List<String> chArr, Cart cart) {
////    	@RequestParam(value = "cartno", defaultValue = "0") int cartno,
////		@RequestParam(value = "cart-check") String[] chArr) {
//        
//    	Member m = (Member) session.getAttribute("login");
//
//		int memno = m.getMemno();
//		
//		int cartno = 0;
//		
//        try {
//        	cart.setMemno(memno);
//        	
//        	log.debug(cart.toString());
//        	
//        	for (String i : chArr) {
//				cartno = Integer.parseInt(i);
//				cart.setCartno(cartno);
//				
//				cartService.deleteCartItem(cart);
//			}
//        } catch (Exception e) {
//            return webHelper.getJsonError(e.getLocalizedMessage());
//        }
//
//        /** 3) 결과를 확인하기 위한 JSON 출력 */
//        // 확인할 대상이 삭제된 결과값만 OK로 전달
//        return webHelper.getJsonData();
//    }
    
}
