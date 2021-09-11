package study.spring.dak.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import study.spring.dak.model.Wish;
import study.spring.dak.service.CartService;

@Slf4j
@Controller
public class CartAjaxController {
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired CartService cartService; 
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	
	/** 카트 리스트 조회 */
	@RequestMapping(value = "/shop/cart.do", method = RequestMethod.GET)
	public ModelAndView cart(Model model, HttpSession session) {

		Member m = (Member) session.getAttribute("login");

		int memno = m.getMemno();

		Cart input = new Cart();
		input.setMemno(memno);

		List<Cart> output = null;

		try {
			output = cartService.getListCart(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);

		return new ModelAndView("shop/cart");
	}
	
	
}
