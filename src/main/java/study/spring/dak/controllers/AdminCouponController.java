package study.spring.dak.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.PageData;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Address;
import study.spring.dak.model.Coupon;
import study.spring.dak.model.Member;
import study.spring.dak.model.Product;
import study.spring.dak.service.AdminService;
import study.spring.dak.service.CouponService;

@Slf4j
@Controller
public class AdminCouponController {

	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired CouponService couponService; 
	@Autowired AdminService adminService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 목록 페이지 */
	@RequestMapping(value = "/admin/coupon_list.do", method = RequestMethod.GET)
	public ModelAndView list (Model model, HttpSession session
			,
			//검색어
			@RequestParam(value="keyword",required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page",defaultValue="1") int nowPage
			)  {
		
    		
		Member admin =(Member) session.getAttribute("admin");
		if(admin==null) {
			return webHelper.redirect("login.do", "로그인이 필요합니다.");
		}
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		// 전체 게시글 수 
		int totalCount = 0;
		//한 페이지당 표시할 목록 수 
		int listCount = 7;
		//한 그룹당 표시할 페이지 번호 수 
		int pageCount = 5;
		
		Coupon input = new Coupon();
		input.setTitle(keyword);

		List<Coupon> output = null ; //  조회결과가 저장될 객체
		
		// 페이지번호를 계산한 결과가 저장될 객체 
		PageData pageData = null;
		
		
		try {
			// 전체 게시글 수 조회
			totalCount = couponService.getCouponCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력할것이다.
			pageData = new PageData (nowPage, totalCount, listCount, pageCount);
			
			//SQL 의 LIMIT 절에서 사용될 값을 빈즈의 static 변수에 저장.
			Coupon.setOffset(pageData.getOffset());
			Coupon.setListCount(pageData.getListCount());
			
			output = couponService.getAdminCouponList(input);
		
		
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		model.addAttribute("output",output);
		model.addAttribute("keyword",keyword);
		model.addAttribute("pageData",pageData);
		
		
        return new ModelAndView("admin/coupon_list");
	}
	
	/** 쿠폰 추가 페이지 */
	@RequestMapping(value = "/admin/coupon_add.do", method = RequestMethod.GET)
	public ModelAndView add (Model model) { 
		
		
		return new ModelAndView("admin/coupon_add");
	}

	
	/** 쿠폰 추가 기능 */
	@RequestMapping(value = "/admin/coupon_add_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, HttpSession session,
			@RequestParam(value = "code", defaultValue = "") String code,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "expDate", defaultValue = "") String expDate,
			@RequestParam(value = "discount", defaultValue = "0") int discount,
			@RequestParam(value = "orderOver", defaultValue = "0") int orderOver,
			@RequestParam(value = "memno") int memno) {
		
		
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반문자열 
		if (!regexHelper.isValue(code))				{return webHelper.redirect(null, "쿠폰코드를 입력하세요.");}
		if (!regexHelper.isValue(title))				{return webHelper.redirect(null, "쿠폰 이름을 입력하세요.");}
		if (!regexHelper.isValue(expDate))				{return webHelper.redirect(null, "쿠폰 만료일을 입력하세요.");}
		
		//숫자형으로 선언된 파라미터 
		if (discount == 0)					 {return webHelper.redirect(null, "할인금액을 입력하세요.");}
		if (discount < 0)					 {return webHelper.redirect(null, "할인금액은 0보다 작을 수 없습니다.");}
		if (orderOver == 0)					 {return webHelper.redirect(null, "주문 최소금액을 입력하세요.");}
		if (orderOver < 0)					 {return webHelper.redirect(null, "주문 최소금액은 0보다 작을 수 없습니다.");}
//		if (memno == 0)					 {return webHelper.redirect(null, "멤버번호를 입력하세요.");}

		

		/** 2) 데이터 저장하기 */
		
		Coupon input = new Coupon();
		
		input.setCode(code);
		input.setDiscount(discount);
		input.setTitle(title);
		input.setExpDate(expDate);
		input.setOrderOver(orderOver);
		input.setMemno(memno);
		
		try {
			
			if(memno == 0) {
				List<Member> mems = adminService.getAdminMemberList(null);
				for (Member mem : mems) {
					 input.setMemno(mem.getMemno());
					 couponService.addCoupon(input);
				}
			}else {
				
				couponService.addCoupon(input);
			}

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		

		return webHelper.redirect(null, "쿠폰이 등록되었습니다.");
	}

	/** 쿠폰 수정 페이지 */
	@RequestMapping(value = "/admin/coupon_edit.do", method = RequestMethod.GET)
	public ModelAndView edit (Model model,
			@RequestParam(value="coupno", defaultValue = "0")int coupno ) { 
		
		
		
		Coupon input = new Coupon();
		
		input.setCoupno(coupno);
		
		Coupon output = null;
		
		try {
			output = couponService.getAdminCouponItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		model.addAttribute("output",output);
		
		
		return new ModelAndView("admin/coupon_edit");
	}
	
	/** 쿠폰 수정 페이지 */
	@RequestMapping(value = "/admin/coupon_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView editOk (Model model,
			@RequestParam(value="coupno", defaultValue = "0")int coupno,
			@RequestParam(value="title", defaultValue = "")String title,
			@RequestParam(value="memno", defaultValue = "0")int memno,
			@RequestParam(value="code", defaultValue = "")String code,
			@RequestParam(value="expDate", defaultValue = "")String expDate,
			@RequestParam(value="discount", defaultValue = "0")int discount,
			@RequestParam(value="orderOver", defaultValue = "0")int orderOver,
			@RequestParam(value="isUsed", defaultValue = "")String isUsed
			
			) { 
		
		
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반문자열 
		if (!regexHelper.isValue(code))				{return webHelper.redirect(null, "쿠폰코드를 입력하세요.");}
		if (!regexHelper.isValue(title))				{return webHelper.redirect(null, "쿠폰 이름을 입력하세요.");}
		if (!regexHelper.isValue(expDate))				{return webHelper.redirect(null, "쿠폰 만료일을 입력하세요.");}
		
		//숫자형으로 선언된 파라미터 
		if (discount == 0)					 {return webHelper.redirect(null, "할인금액을 입력하세요.");}
		if (discount < 0)					 {return webHelper.redirect(null, "할인금액은 0보다 작을 수 없습니다.");}
		if (orderOver == 0)					 {return webHelper.redirect(null, "주문 최소금액을 입력하세요.");}
		if (orderOver < 0)					 {return webHelper.redirect(null, "주문 최소금액은 0보다 작을 수 없습니다.");}
		if (memno == 0)					 {return webHelper.redirect(null, "멤버번호를 입력하세요.");}
		
		Coupon input = new Coupon();
		
		input.setCode(code);
		input.setCoupno(coupno);
		input.setDiscount(discount);
		input.setExpDate(expDate);
		input.setIsUsed(isUsed);
		input.setMemno(memno);
		input.setOrderOver(orderOver);
		input.setTitle(title);
		
		
		
		try {
			couponService.editCoupon(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		
		return webHelper.redirect("coupon_list.do", "쿠폰이 수정되었습니다.");	
	}
	
	/** 쿠폰 삭제 처리 */
	@RequestMapping(value = "/admin/coupon_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model, 
			@RequestParam(value = "coupno", defaultValue = "0") int coupno
			) {

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 빈즈에 저장하기
		Coupon input = new Coupon();
		input.setCoupno(coupno);

		try {
			// 데이터삭제
			couponService.deleteCoupon(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동.
		return webHelper.redirect("coupon_list.do", "삭제되었습니다.");

	}

}
