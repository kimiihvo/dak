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
import study.spring.dak.model.Member;
import study.spring.dak.model.Wish;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.WishService;

@Controller
public class WishAjaxController {
	
	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  RegexHelper regexHelper;
    

	/** Service 패턴 구현체 주입 */
	@Autowired WishService wishService; 
	@Autowired MemberService memberService; 
    
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
	
    @RequestMapping(value = "/mypage/wish_list.do", method = RequestMethod.GET)
	public ModelAndView wishlist(Model model, HttpSession session) { 

		Member m = (Member) session.getAttribute("login");

		int memno = m.getMemno();
		
		/** 2) 데이터 조회하기 */
		//조회에 필요한 조건값을 빈즈에 담음
		Wish input = new Wish();
		input.setMemno(memno);
		

		List<Wish> output = null;
		
		try {
			if (m!=null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
			output = wishService.getWishList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) view 처리 */
		model.addAttribute("output",output);
		
    
    	return new ModelAndView("mypage/wish_list");
    }
}
