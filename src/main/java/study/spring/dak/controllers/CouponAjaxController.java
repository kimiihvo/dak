package study.spring.dak.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Coupon;
import study.spring.dak.model.Member;
import study.spring.dak.service.CouponService;
import study.spring.dak.service.MemberService;

@Controller
public class CouponAjaxController {
	
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired CouponService couponService; 
	@Autowired MemberService memberService; 
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 목록 페이지 */
	@RequestMapping(value = "/mypage/coupon.do", method = RequestMethod.GET)
	public ModelAndView list (Model model, HttpSession session) { 
		
	
		
		Member m = (Member) session.getAttribute("login");

		int memno = m.getMemno();
		
		/** 2) 데이터 조회하기 */
		//조회에 필요한 조건값을 빈즈에 담음
		Coupon input = new Coupon();
		input.setMemno(memno);
		
		List<Coupon> output = null;
		List<Coupon> outputExp = null;
		
		try {
			
			output = couponService.getAvailableCouponList(input);
			outputExp = couponService.getExpiredCouponList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) view 처리 */
		model.addAttribute("output",output);
		model.addAttribute("outputExp",outputExp);
		
		
		return new ModelAndView("mypage/coupon");
	}

}
