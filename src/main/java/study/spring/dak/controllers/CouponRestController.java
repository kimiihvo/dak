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
import study.spring.dak.model.Coupon;
import study.spring.dak.model.Member;
import study.spring.dak.service.CouponService;

@Slf4j
@RestController
public class CouponRestController {
	
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired CouponService couponService; 
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	
//	/** 사용 가능 쿠폰 목록 조회 */
//    @RequestMapping(value = "/mypage/coupon", method = RequestMethod.GET)
//    public Map<String, Object> get_available_list(HttpSession session) {
//
//		Member m = (Member) session.getAttribute("login");
//
//		int memno = m.getMemno();
//        
//
//        /** 2) 데이터 조회하기 */
//        // 조회에 필요한 조건값을 Beans에 담는다.
//        Coupon input = new Coupon();
//        input.setMemno(memno);
//
//        
//        List<Coupon> output = null;   // 조회결과가 저장될 객체
//       
//
//        try {
//            // 데이터 조회하기
//            output = couponService.getAvailableCouponList(input);
//        } catch (Exception e) {
//            return webHelper.getJsonError(e.getLocalizedMessage());
//        }
//
//        /** 3) JSON 출력하기 */
//        Map<String, Object> data = new HashMap<String, Object>();
//        data.put("item", output);
//
//        return webHelper.getJsonData(data);
//    }
//    
//    /** 기간 만료 쿠폰 목록 조회 */
//    @RequestMapping(value = "/mypage/coupon_exp", method = RequestMethod.GET)
//    public Map<String, Object> get_expired_list(HttpSession session) {
//
//		Member m = (Member) session.getAttribute("login");
//
//		int memno = m.getMemno();
//        
//
//        /** 2) 데이터 조회하기 */
//        // 조회에 필요한 조건값을 Beans에 담는다.
//        Coupon input = new Coupon();
//        input.setMemno(memno);
//
//        
//        List<Coupon> output = null;   // 조회결과가 저장될 객체
//       
//
//        try {
//            // 데이터 조회하기
//            output = couponService.getExpiredCouponList(input);
//        } catch (Exception e) {
//            return webHelper.getJsonError(e.getLocalizedMessage());
//        }
//
//        /** 3) JSON 출력하기 */
//        Map<String, Object> data = new HashMap<String, Object>();
//        data.put("item", output);
//
//        return webHelper.getJsonData(data);
//    }
    
    
    /** 쿠폰 등록 (사용자 마이페이지) */
    @RequestMapping(value = "/mypage/coupon", method = RequestMethod.POST)
    public Map<String, Object> post(HttpSession session,
            @RequestParam(value="code", defaultValue="") String code,
            @RequestParam(value="memno", defaultValue="0") int memno
            ) {
    	
    	Member m = (Member) session.getAttribute("login");

		memno = m.getMemno();
        
        /** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
        if (!regexHelper.isValue(code))     { return webHelper.getJsonWarning("쿠폰코드를 입력하세요."); }

        /** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        Coupon input = new Coupon();
        input.setCode(code);
        input.setMemno(memno);
        
        if (code.equals("EZEN20205")) {
    		
    		
    		try {
				int count = couponService.countCouponItem(code, memno);
				
				if (count!=0) {
					return webHelper.getJsonError("이미 발급된 쿠폰입니다.");
				} 
				
				input.setTitle("5조 응원 쿠폰");
				input.setExpDate("2023-03-19");
				input.setDiscount(5000);
				input.setOrderOver(1);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    		
    		
        } else if (code.equals("EZEN20204")){
        	
        	try {
				int count = couponService.countCouponItem(code, memno);
				
				if (count!=0) {
					return webHelper.getJsonError("이미 발급된 쿠폰입니다.");
				} 
				
				input.setTitle("4조 응원 쿠폰");
				input.setExpDate("2023-03-19");
				input.setDiscount(4000);
				input.setOrderOver(1);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } else if (code.equals("EZEN20203")){
        	try {
				int count = couponService.countCouponItem(code, memno);
				
				if (count!=0) {
					return webHelper.getJsonError("이미 발급된 쿠폰입니다.");
				} 
				
				input.setTitle("3조 응원 쿠폰");
				input.setExpDate("2023-03-19");
				input.setDiscount(3000);
				input.setOrderOver(1);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        } else if (code.equals("EZEN20202")){
        	try {
				int count = couponService.countCouponItem(code, memno);
				
				if (count!=0) {
					return webHelper.getJsonError("이미 발급된 쿠폰입니다.");
				} 
				
				input.setTitle("2조 응원 쿠폰");
				input.setExpDate("2023-03-19");
				input.setDiscount(2000);
				input.setOrderOver(1);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
        } else if (code.equals("EZEN20201")){
        	try {
				int count = couponService.countCouponItem(code, memno);
				
				if (count!=0) {
					return webHelper.getJsonError("이미 발급된 쿠폰입니다.");
				} 
				
				input.setTitle("1조 응원 쿠폰");
				input.setExpDate("2023-03-19");
				input.setDiscount(1000);
				input.setOrderOver(1);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
        } else {
        
    		return webHelper.getJsonError("없는 코드입니다.");
    	}
        
        try {
    		couponService.addCoupon(input);
    		log.debug(input.toString());
    		
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 JSON 출력 */
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("input", input);
        
        return webHelper.getJsonData(map);
    }
    
}
