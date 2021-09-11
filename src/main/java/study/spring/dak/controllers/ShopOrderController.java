package study.spring.dak.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Address;
import study.spring.dak.model.Cart;
import study.spring.dak.model.Coupon;
import study.spring.dak.model.Member;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.Product;
import study.spring.dak.model.ProductOrder;
import study.spring.dak.service.AddressService;
import study.spring.dak.service.CartService;
import study.spring.dak.service.CouponService;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.OrderService;
import study.spring.dak.service.ProductOrderService;
import study.spring.dak.service.ProductService;

@Controller
public class ShopOrderController {

	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductOrderService productOrderService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 상품 구매, 결제 페이지 */
	@RequestMapping(value="/shop/order.do", method=RequestMethod.POST)
	public ModelAndView order(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(value="prdno", defaultValue="0") int prdno,
			@RequestParam(value="qty", defaultValue="0") int qty) {
		
			
		Member m = (Member) session.getAttribute("login");
		
		String previous_ = request.getHeader("referer");
		Boolean previous = previous_.contains("cart.do");
		
		
		if (previous) {
			System.out.println("true");
			
			List<Cart> cartItems = new ArrayList<Cart>();
			
			
			Cart input = new Cart();
			input.setMemno(m.getMemno());
			
			
			try {
				cartItems = cartService.getListCart(input);
			} catch (Exception e) {
				e.printStackTrace();
			}
				
			
			model.addAttribute("cartItems", cartItems);	
		} else {
			Cart cart = new Cart();
			
			cart.setMemno(m.getMemno());				
			cart.setPrdno(prdno);
			cart.setQty(qty);
			
			try {
				int count = cartService.countCartItem(prdno, m.getMemno());
				if (count != 0) {

					

					cartService.updateCartItem(cart);
				} else {
					cart.setQty(qty);
					cartService.addCartItem(cart);
				}
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			List<Cart> cartItems = new ArrayList<Cart>();
			
			Cart output = new Cart();
			
			try {
				output = cartService.getItemCart(cart);
				cartItems.add(output);
			} catch (Exception e) {
				e.printStackTrace();
			}
				
			
			model.addAttribute("cartItems", cartItems);	

		}
		
		// 기본 배송지로 설정 옵션을 사용하기 위한 주소 
		Address a = new Address();
		try {
			a = addressService.getAddressItemByMemno(m.getMemno());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 사용가능 쿠폰 조회 후 모델에 주입
		List<Coupon> c = new ArrayList<Coupon>();
		try {
			c = couponService.getCouponListByMemno(m.getMemno());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("m", m);
		model.addAttribute("a", a);
		model.addAttribute("cList", c);
		
		return new ModelAndView("shop/order");
	}
	
	/** 상품 구매 처리 페이지 */
	@RequestMapping(value="/shop/order_ok.do", method=RequestMethod.POST)
	public ModelAndView order(Model model, HttpSession session,
			@RequestParam(defaultValue="") String addressee,
			@RequestParam(defaultValue="") String addressee_zip,
			@RequestParam(defaultValue="") String addressee_addr1,
			@RequestParam String addressee_addr2,
			@RequestParam String phone_select,
			@RequestParam String addressee_cell_input,
			@RequestParam(defaultValue="0") int couponToUse,

			@RequestParam int dlvyFee,
			@RequestParam(defaultValue="0") int discount,
			@RequestParam int totalPrice,
			@RequestParam(defaultValue="") String pay,
			@RequestParam String[] cartnos) {
		
		String dlvyAdr = addressee_zip + ", " + addressee_addr1 + " " + addressee_addr2;
		String dlvyTel = phone_select + addressee_cell_input;
		
		// 유효성 검사
		
		if (phone_select == null || phone_select.equals("")) {
			return webHelper.redirect(null, "휴대전화 번호를 앞 3자리를 선택하세요");
		}
		
		if (addressee_cell_input == null || addressee_cell_input.equals("")) {
			return webHelper.redirect(null, "휴대전화 번호를 입력하세요");
		}
		
		if (!regexHelper.isNum(dlvyTel)) {
			return webHelper.redirect(null, "연락처는 숫자만 입력해주세요");
		}
		
		if (addressee.equals("")) {
			return webHelper.redirect(null, "받는 분 성함을 입력하세요");
		}
		
		if (!regexHelper.isKor(addressee)) {
			return webHelper.redirect(null, "받는 분 성함을 한글로 입력하세요");
		}
		
		if (addressee_zip.equals("") || addressee_addr1.equals("")) {
			return webHelper.redirect(null, "받는 분 주소를 입력하세요");
		}
		if (addressee.equals("")) {
			return webHelper.redirect(null, "받는 분 성함을 입력하세요");
		}
		if (pay.equals("")) {
			return webHelper.redirect(null, "결제 방법을 선택해 주세요");
		}
		
		
		Member m = (Member) session.getAttribute("login");
		int memno = m.getMemno();
		
		int odrno = 0;
		
		// 1.구매내역 객체 생성 및 등록?
		
		OrderList input = new OrderList();
		input.setMemno(memno);

		input.setToPrice(totalPrice+dlvyFee-discount);
		input.setDisAmount(discount);
		input.setFee(dlvyFee);
		input.setDlvyName(addressee);
		input.setDlvyAdr(dlvyAdr);
		input.setDlvyTel(dlvyTel);
		input.setPay(pay);
		
		try {
			orderService.placeOrder(input);
			odrno = input.getOdrno();
			
		} catch (Exception e) {
			return webHelper.redirect(null, "주문실패..ㅠ");
		}
		
		
		// 2.매핑테이블에 상세주문을 업데이트 할 때 사용될 데이터를 추출!
		List<Cart> cartList = new ArrayList<Cart>();
		for (String cartno : cartnos) {
			Cart cartInput = new Cart();
			cartInput.setCartno(Integer.parseInt(cartno));
			
			try {
				Cart cartOutput = cartService.getCartItemByCartno(cartInput);
				cartList.add(cartOutput);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		for (Cart cartItem : cartList) {
			System.out.println(cartItem.toString());
		}
		
		
		// 3.구매한 제품들과 그 수량을 List<Cart> 객체를 이용해서 ProductOrder 매핑테이블에 업데이트처리	
		for (Cart cartItem : cartList ) {
			ProductOrder po = new ProductOrder();
			po.setOdrno(odrno);
			po.setPrdno(cartItem.getPrdno());
			po.setPrice(cartItem.getPrice());
			po.setQty(cartItem.getQty());
			
			try {
				productOrderService.addProductOrder(po);
			} catch (Exception e) {
				return webHelper.redirect(null, "매핑 테이블 업데이트에 실패하였습니다.");
			}
			
			// 구매 완료 처리되면 Cart에서 삭제
			try {
				cartService.deleteCartItem(cartItem);
			} catch (Exception e) {
				return webHelper.redirect(null, "구매 처리 후 카트 업데이트에 실패하였습니다.");
			}
			
			// 주문량 업데이트를 위한 객체 준비
			Product inputP = new Product();
			inputP.setPrdno(cartItem.getPrdno());
			inputP.setSv(cartItem.getQty());
			
			try {
				productService.updateProductSv(inputP);
			} catch (Exception e) {
				return webHelper.redirect(null, "구매 처리 후 상품 판매량 업데이트에 실패하였습니다.");
			}
			
			
		}
		
		if (couponToUse != 0) {
			Coupon inputC = new Coupon();
			inputC.setCoupno(couponToUse);
			try {
				couponService.updateUsedCoupon(inputC);
			} catch (Exception e) {
				return webHelper.redirect(null, "쿠폰 사용 처리에 실패했습니다.");
			}
		}
		
		
		return webHelper.redirect(contextPath + "/mypage/order_list.do", "주문완료");
	}
	
}
