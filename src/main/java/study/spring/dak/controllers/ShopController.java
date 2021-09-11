package study.spring.dak.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.model.Product;
import study.spring.dak.model.SubCategory;
import study.spring.dak.model.Wish;
import study.spring.dak.service.CateService;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.ProductService;
import study.spring.dak.service.WishService;


@Controller
public class ShopController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.springhelper.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	@Autowired
	ProductService productService;
	@Autowired
	MemberService memberService;
	@Autowired
	WishService wishService;
	@Autowired
	CateService cateService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	// 인덱스 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model, HttpSession session) {

		Member m = (Member) session.getAttribute("login");

		List<Product> outputSale = null;
		List<Product> outputNew = null;
		List<Product> outputSv = null;

		try {

			if (m != null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
			// 데이터 조회하기
			outputSale = productService.getProductListSale(null);
			outputNew = productService.getProductListNewIndex(null);
			outputSv = productService.getProductListPopularIndex(null);
		} catch (Exception e) {

			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("outputSale", outputSale);
		model.addAttribute("outputNew", outputNew);
		model.addAttribute("outputSv", outputSv);

		return new ModelAndView("index");
	}

	/**
	 * 상세 페이지
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/shop/detail.do", method = RequestMethod.GET)
	public ModelAndView get_item(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, @RequestParam(value = "prdno", defaultValue = "0") int prdno,
			@CookieValue(value = "prd", required = false) String prd) throws UnsupportedEncodingException {

		// 쿠키

		request.setCharacterEncoding("UTF-8");

		String currentPrd = request.getParameter("prdno");
		currentPrd = URLEncoder.encode(currentPrd, "UTF-8");

		if (prd == null) {

			try {
				currentPrd = URLEncoder.encode(currentPrd, "UTF-8");

				Cookie cookie = new Cookie("prd", currentPrd);
				cookie.setMaxAge(24 * 60 * 60);
				cookie.setPath(contextPath);
				cookie.setDomain("itproject.ezenac.co.kr");

				response.addCookie(cookie);

			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {

			if (!prd.contains(currentPrd)) {

				prd += "/" + currentPrd;

				Cookie cookie = new Cookie("prd", prd);
				cookie.setMaxAge(24 * 60 * 60);
				cookie.setPath(contextPath);
				cookie.setDomain("itproject.ezenac.co.kr");

				response.addCookie(cookie);
			}

		}

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야한다.
		if (prdno == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}

		// 만약 회원의 위시리스트에 있는 상품이면 View페이지에 주황하트를 출력해야함
		// 로그인 상태인지 확인!
		if (session.getAttribute("login") != null) {

			// 세션에서 정보 받아옴
			Member m = (Member) session.getAttribute("login");
			int memno = m.getMemno();

			// 위시리스트 조회할 준비
			Wish wishInput = new Wish();
			wishInput.setMemno(memno);
			wishInput.setPrdno(prdno);

			// 조회한 위시리스트 담을 객체 생성
			Wish wishOutput = null;

			try {
				// 담음
				wishOutput = wishService.getWishItem(wishInput);
			} catch (Exception e) {
				// 없음 말고
				e.printStackTrace();
			}

			model.addAttribute("wishOutput", wishOutput);

		}

		/** 1) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		input.setPrdno(prdno);

		// 조회결과를 저장할 객체 선언
		Product output = null;

		try {

			// 데이터 조회
			output = productService.getProductItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) view 처리 */

		model.addAttribute("output", output);

		return new ModelAndView("shop/detail");

	}

	/** 프로모션 */
	@RequestMapping(value = "/shop/promotion.do", method = RequestMethod.GET)
	public ModelAndView promotion(Model model, HttpServletRequest request, HttpSession session) {

		Member m = (Member) session.getAttribute("login");

		if (m != null) {
			try {
				m = memberService.getMember(m);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			model.addAttribute("m", m);
		}

		return new ModelAndView("shop/promotion");
	}

	/** 종류별 */
	@RequestMapping(value = "/shop/shop_category.do", method = RequestMethod.GET)
	public ModelAndView category(Model model, HttpServletRequest request, HttpSession session) {

		Member m = (Member) session.getAttribute("login");

		if (m != null) {
			try {
				m = memberService.getMember(m);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			model.addAttribute("m", m);
		}
		
		List<SubCategory> output = null;
		
		try {
			output = cateService.getListCate(null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("output", output);

		return new ModelAndView("shop/shop_category");
	}

	@RequestMapping(value = "/shop/benefit_md.do", method = RequestMethod.GET)
	public void benefit_md(Model model) {

	}

	@RequestMapping(value = "/shop/benefit_theme.do", method = RequestMethod.GET)
	public void benefit_theme(Model model) {

	}

	@RequestMapping(value = "/shop/benefit_theme2.do", method = RequestMethod.GET)
	public void benefit_theme2(Model model) {

	}

}
