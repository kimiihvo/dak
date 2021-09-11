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
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Cart;
import study.spring.dak.model.Member;
import study.spring.dak.service.CartService;
import study.spring.dak.service.MemberService;

@Slf4j
@Controller
public class CartController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	@Autowired
	CartService cartService;
	@Autowired
	MemberService memberService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	

//	/** 카트 리스트 조회 */
//	@RequestMapping(value = "/shop/cart.do", method = RequestMethod.GET)
//	public ModelAndView cart(Model model, HttpSession session) {
//
//		Member m = (Member) session.getAttribute("login");
//
//		int memno = m.getMemno();
//
//		Cart input = new Cart();
//		input.setMemno(memno);
//
//		List<Cart> output = null;
//
//		try {
//			output = cartService.getListCart(input);
//
//		} catch (Exception e) {
//			return webHelper.redirect(null, e.getLocalizedMessage());
//		}
//
//		model.addAttribute("output", output);
//
//		return new ModelAndView("shop/cart");
//	}
//
//	/** 장바구니 상품 추가 기능 */
//	@RequestMapping(value = "/shop/cart_add_ok.do", method = RequestMethod.POST)
//	public ModelAndView add_ok(Model model, HttpSession session,
//			@RequestParam(value = "memno", defaultValue = "0") int memno,
//			@RequestParam(value = "prdno", defaultValue = "0") int prdno,
//			@RequestParam(value = "qty", defaultValue = "0") int qty) {
//
//		Member m = (Member) session.getAttribute("login");
//		memno = m.getMemno();
//
//		/** 2) 데이터 저장하기 */
//		
//		Cart input = new Cart();
//		input.setMemno(memno);
//		input.setPrdno(prdno);
//
//		try {
//			// 중복 상품이 있는지 검사
//			int count = cartService.countCartItem(prdno, memno);
//
//			
//			if (count != 0) {
//
//				// DB의 정보를 가져올 빈즈 생성
//				Cart db = null;
//
//				// 정보를 가져옴
//				db = cartService.getItemCart(input);
//
//				// 개수만 담음
//				int data = db.getQty();
//
//				// input에 추가할 개수와 원래 개수를 더해서 담음
//				input.setQty(qty + data);
//
//				log.debug(input.toString());
//
//				cartService.updateCartItem(input);
//
//			} else {
//				input.setQty(qty);
//				cartService.addCartItem(input);
//			}
//
//		} catch (Exception e) {
//			return webHelper.redirect(null, e.getLocalizedMessage());
//		}
//
//		/** 3) 결과를 확인하기 위한 페이지 이동 */
//
//		return webHelper.redirect(null, "장바구니에 추가되었습니다.");
//	}
//	
//
	/** 장바구니 상품 수정 처리 */
	@RequestMapping(value = "/shop/cart_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model, HttpSession session,
			@RequestParam(value = "memno", defaultValue = "0") int memno,
			@RequestParam(value = "prdno", defaultValue = "0") int[] prdno,
			@RequestParam(value = "qty", defaultValue = "0") int[] qty) {

		Member m = (Member) session.getAttribute("login");
		memno = m.getMemno();

		try {
		/** 2) 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.

			// 데이터 수정
			for (int i=0; i<prdno.length; i++) {
				
				Cart input = new Cart();
				input.setMemno(memno);
				input.setPrdno(prdno[i]);
				input.setQty(qty[i]);
				cartService.updateCartItem(input);
			}

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// ajax로 수정 해야됨.....

		return webHelper.redirect("cart.do", "상품 개수가 수정되었습니다.");
	}
	
	
	/** 장바구니 상품 삭제 처리 */
	@RequestMapping(value = "/shop/cart_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model, 
			@RequestParam(value = "cartno", defaultValue = "0") int cartno
			) {

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 빈즈에 저장하기
		Cart input = new Cart();
		input.setCartno(cartno);

		try {
			// 데이터삭제
			cartService.deleteCartItem(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동.
		return webHelper.redirect(contextPath + "/shop/cart.do", "삭제되었습니다.");

	}
	
	/** 장바구니 상품 삭제 처리 */
	@RequestMapping(value = "/shop/cart_delete_list_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_list_ok(Model model, HttpSession session, 
			@RequestParam(value = "memno", defaultValue = "0") int memno
			) {
		
		Member m = (Member) session.getAttribute("login");
		memno = m.getMemno();

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 빈즈에 저장하기
		Cart input = new Cart();
		input.setMemno(memno);

		try {
			List<Cart> output = null;
			
			output = cartService.getListCart(input);
			// 데이터삭제
			
			for (Cart item : output) {
				
				cartService.deleteCartItem(item);
			}

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동.
		return webHelper.redirect(contextPath + "/shop/cart.do", "삭제되었습니다.");

	}

	/** 장바구니 상품 다중 삭제 처리 */
	@RequestMapping(value = "/shop/cart_selected_delete_ok.do", method = RequestMethod.POST)
	public ModelAndView selected_delete_ok(Model model, HttpSession session,
			@RequestParam(value = "cartno", defaultValue = "0") int cartno,
			@RequestParam(value = "cart-check") String[] chArr) {


		

		Cart cart = new Cart();

		/** 2) 데이터 삭제하기 */
		try {
			cart.setCartno(cartno);

			for (String i : chArr) {
				cartno = Integer.parseInt(i);
				cart.setCartno(cartno);
				cartService.deleteCartItem(cart);
			}

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		

		// ajax로 수정 해야됨.....
		return webHelper.redirect(contextPath + "/shop/cart.do", "삭제되었습니다.");

	}
	
	/** 장바구니 상품 다중 추가 처리 */
	@RequestMapping(value = "/shop/cart_selected_add_ok.do", method = RequestMethod.POST)
	public ModelAndView selected_add_ok(Model model, HttpSession session,
			@RequestParam(value = "prdno", defaultValue = "0") int prdno,
			@RequestParam(value = "wish-check", required=false) String[] chArr,
			@RequestParam(value = "qty", defaultValue = "1") int qty
			) {
		
		Member m = (Member) session.getAttribute("login");
		int memno = m.getMemno();
		
		if (chArr == null)				{return webHelper.redirect(null, "선택된 상품이 없습니다.");}

		Cart cart = new Cart();

		/** 2) 데이터 저장하기 */
		try {
			
			cart.setMemno(memno);

			for (String i : chArr) {
				prdno = Integer.parseInt(i);
				cart.setPrdno(prdno);
				
				int count = cartService.countCartItem(prdno, memno);
				
				if (count != 0) {
					
					// DB의 정보를 가져올 빈즈 생성
					Cart db = null;
	
					// 정보를 가져옴
					db = cartService.getItemCart(cart);
	
					// 개수만 담음
					int data = db.getQty();
	
					// input에 추가할 개수와 원래 개수를 더해서 담음
					cart.setQty(qty + data);
	
					log.debug(cart.toString());
	
					cartService.updateCartItem(cart);
				}else {
					
					cart.setQty(qty);
					cartService.addCartItem(cart);
				}
				
				
			}

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		

		// ajax로 수정 해야됨.....
		return webHelper.redirect(contextPath + "/shop/cart.do", "장바구니에 추가되었습니다.");

	}

//	
//	/** 장바구니 상품 다중 추가 처리 (미완!!!!!!!!!! 아직 수정 중 !!!!!!!!!!!!!!!!!!!!1)*/
//	@RequestMapping(value = "/shop/cart_selected_add_ok.do", method = RequestMethod.POST)
//	public ModelAndView selected_add_ok(Model model, HttpSession session,
//			@RequestParam(value = "prdno", defaultValue = "0") int prdno,
//			@RequestParam(value = "cart-check[]") String[] chArr) {
//		
//		Member m = (Member) session.getAttribute("login");
//		int memno = m.getMemno();
//
//		Cart cart = new Cart();
//
//		/** 2) 데이터 저장하기 */
//		try {
//			cart.setMemno(memno);
//
//			for (String i : chArr) {
//				prdno = Integer.parseInt(i);
//				cart.setPrdno(prdno);
//				cartService.addCartItem(cart);
//			}
//
//		} catch (Exception e) {
//			return webHelper.redirect(null, e.getLocalizedMessage());
//		}
//
//		/** 3) 페이지 이동 */
//		
//
//		// ajax로 수정 해야됨.....
//		return webHelper.redirect(contextPath + "/shop/cart.do", "추가되었습니다.");
//
//	}


}
