package study.spring.dak.controllers;


import java.util.ArrayList;
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

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.PageData;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.model.OneOnOne;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.Product;
import study.spring.dak.model.ProductOrder;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.OneOnOneService;
import study.spring.dak.service.OrderService;
import study.spring.dak.service.ProductOrderService;
import study.spring.dak.service.ProductService;

@Slf4j
@Controller
public class MypageController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	@Autowired
	MemberService memberService;
	@Autowired
	ProductService productService;
	@Autowired OneOnOneService oneOnOneService;
	@Autowired OrderService orderService;
	@Autowired ProductOrderService productOrderService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 마이페이지 메인 */
	@RequestMapping(value = "/mypage/mypage_index.do", method = RequestMethod.GET)
	public ModelAndView mypageIndex(Model model, HttpServletRequest request, HttpSession session) {

		Member m = (Member) session.getAttribute("login");
		int totalCount = 0; //전체 게시글 수
		int listCount = 2; // 한 페이지당 표시할 목록 수
		int pageCount =1; // 한 그룹당 표시할 페이지 번호 수
		OneOnOne input = new OneOnOne(); // 조건 담을 객체 
		List<OneOnOne> output = null ; //  조회결과가 저장될 객체
		PageData pageData = null;
		input.setMemno(m.getMemno());
		List<ProductOrder> po = new ArrayList<ProductOrder>();
		
		
		try {
			OrderList ol = new OrderList();
			ol = orderService.getLatestOrderItem(m.getMemno());
			if (ol == null) {
				po = null;
			} else {
				po = productOrderService.getLatestProductOrderList(ol);
			}
		} catch (Exception e1) {
			return webHelper.redirect(null, "최근 구매한 상품 조회 실패");
		}

		try {
			    totalCount = oneOnOneService.getOneOnOneCount(input);
	    		pageData = new PageData(1, totalCount,listCount,pageCount);
	    		OneOnOne.setOffset(pageData.getOffset());
	    		OneOnOne.setListCount(pageData.getListCount());
	    		output = oneOnOneService.getOneOnOneList(input);
			// 데이터 조회
			m = memberService.getMember(m);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("m", m);
		model.addAttribute("po", po);
		model.addAttribute("output", output);

		return new ModelAndView("mypage/mypage_index");
	}
	/** 최근 본 상품 */
	@RequestMapping(value = "/shop/recent_view_list.do", method = RequestMethod.GET)
	public ModelAndView recent_view_list(Model model, HttpServletRequest request, HttpSession session,
//			@CookieValue(value = "prd", defaultValue = "" , required = false) Cookie cookie
			@CookieValue (required=false) String prd
			
			) {

		Cookie[] cookies = request.getCookies();

		List<Product> prdList = new ArrayList<Product>();
		if (cookies != null) {
//    	String myCookie = null;
//			String prd = cookie.getValue();

			if (prd != null ) {

				String[] prds = prd.split("/");

				for (String prdno : prds) {
					

					Product temp = new Product();
					temp.setPrdno(Integer.parseInt(prdno));

					try {

						prdList.add(productService.getProductItem(temp));

					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}

			}
		} 
		
		model.addAttribute("prdList", prdList);

		return new ModelAndView("shop/recent_view_list");
	}

	/** 최근 본 상품 선택삭제 */
	@RequestMapping(value = "/shop/recent_view_list_del.do", method = RequestMethod.GET)
	public ModelAndView recent_view_list_del(Model model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response, @RequestParam(value = "prdno", defaultValue = "") String prdno,
//    		@CookieValue(value = "prd", required = false) Cookie cookie,
			@CookieValue(defaultValue = "", required = false) String prd) {

//    	String prd = cookie.getValue();
//    	
		String newList = "";
		
		// 쿠키 값에 prdno이 있는지 검사하기
		if (prd.indexOf(prdno) > -1) {

			System.out.println("문자열 있음");
			// 쿠키 값 /기준으로 쪼개기
			String[] recentList = prd.split("/");

			System.out.println(recentList);

			// 반복문 돌려서 있는거 찾기
			for (int i = 0; i < recentList.length; i++) {

				System.out.println(recentList[i]);

				// 같으면 비워버리기
				if (recentList[i].equals(prdno)) {

					recentList[i] = "";

				} else {

					newList += "/" + recentList[i];
				}

			}
//			newList = String.join("/", recentList);
//			
//			newList = newList.replace("//", "/");

//			if (newList.substring(newList.length()-1,newList.length()).equals("/")) {
//				newList = newList.substring(0, newList.length()-1);
//			} 

			if (newList.length() == 0) {
				
				Cookie cook = new Cookie("prd", newList);
				cook.setMaxAge(1);
				cook.setPath(contextPath);
				cook.setDomain("itproject.ezenac.co.kr");
				
				response.addCookie(cook);
				
				return webHelper.redirect(contextPath + "/shop/recent_view_list.do", "삭제되었습니다.");
				
			} else

			if (newList.substring(0, 1).equals("/")) {
				newList = newList.substring(1, newList.length());
			}
			System.out.println(newList);

			Cookie cook = new Cookie("prd", newList);
			cook.setMaxAge(24 * 60 * 60);
			cook.setPath(contextPath);
			cook.setDomain("itproject.ezenac.co.kr");

			response.addCookie(cook);

		}
		return webHelper.redirect(contextPath + "/shop/recent_view_list.do", "삭제되었습니다.");

	}
	
	
	
	/** 최근 본 상품 전체 삭제 */
	@RequestMapping(value = "/shop/recent_view_list_del_all.do", method = RequestMethod.GET)
	public ModelAndView recent_view_list_del_all(Model model, HttpServletRequest request, HttpSession session,
			HttpServletResponse response,

			@CookieValue(defaultValue = "", required = false) String prd) {

				
				Cookie cook = new Cookie("prd", null);
				cook.setMaxAge(0);
				cook.setPath(contextPath);
				cook.setDomain("itproject.ezenac.co.kr");
				
				response.addCookie(cook);
				
				
			return webHelper.redirect(contextPath + "/shop/recent_view_list.do", "최근 본 상품이 없습니다.");
	}

	  @RequestMapping(value = "/mypage/my_event.do", method = RequestMethod.GET)
	   	public void benefit_theme(Model model) {
	       	
	       }
	    @RequestMapping(value = "/mypage/my_event_detail.do", method = RequestMethod.GET)
	   	public void benefit_theme2(Model model) {
	       	
	       }
}
