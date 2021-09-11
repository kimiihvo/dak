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

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.PageData;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.model.OneOnOne;
import study.spring.dak.model.Product;
import study.spring.dak.model.Wish;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.OneOnOneService;
import study.spring.dak.service.ProductService;
import study.spring.dak.service.WishService;

@Slf4j
@Controller
public class HelpController {
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;
    
    @Autowired ProductService productService;
    @Autowired MemberService memberService;
    @Autowired WishService wishService;
    @Autowired OneOnOneService oneOnOneService;
    
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
	    @RequestMapping(value = "/help/faq.do", method = RequestMethod.GET)
	   	public void faq(Model model) {
	       	
	       }
	    @RequestMapping(value = "/help/help.do", method = RequestMethod.GET)
	   	public ModelAndView help(Model model,HttpSession session) {
	    	
	    	
	    	Member m = (Member) session.getAttribute("login");
	    	if(m!=null) {
			int totalCount = 0; //전체 게시글 수
			int listCount = 2; // 한 페이지당 표시할 목록 수
			int pageCount =1; // 한 그룹당 표시할 페이지 번호 수
			OneOnOne input = new OneOnOne(); // 조건 담을 객체 
			List<OneOnOne> output = null ; //  조회결과가 저장될 객체
			PageData pageData = null;
			input.setMemno(m.getMemno());

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
			model.addAttribute("output", output);
	    	}
			return new ModelAndView("help/help");
	       	
	       }
	    @RequestMapping(value = "/help/notice_detail.do", method = RequestMethod.GET)
	   	public void notice_detail(Model model) {
	       	
	       }
	    @RequestMapping(value = "/help/notice.do", method = RequestMethod.GET)
	   	public void notice(Model model) {
	       	
	       }
	    
	    
	
}
