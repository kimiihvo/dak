package study.spring.dak.controllers;


import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.dak.helper.PageData;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.MainCategory;
import study.spring.dak.model.Member;
import study.spring.dak.model.Product;
import study.spring.dak.service.CartService;
import study.spring.dak.service.CateService;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.ProductService;
import study.spring.dak.service.WishService;
@Controller
public class ProductAjaxController {
	
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;
    
    @Autowired ProductService productService;
    @Autowired CartService cartService;
    @Autowired CateService cateService;
    @Autowired WishService wishService;
    @Autowired MemberService memberService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
	

    /** 섹션 목록 페이지 */
    @RequestMapping(value = "/shop/section.do", method = RequestMethod.GET)
    public ModelAndView listSection(Model model, HttpSession session,
    		@RequestParam(value = "mainCateNo", defaultValue = "1") int mainCateNo,
    		@RequestParam(value = "subCateNo", defaultValue = "0") int subCateNo
    		) {           
    	
    	Member m = (Member) session.getAttribute("login");
    	
    	Product input = new Product();
		input.setMainCateNo(mainCateNo);
        
        List<Product> output = null;   // 조회결과가 저장될 객체
        

        try {
        	
        	if (m != null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
        	if (subCateNo == 0) {
        		
        		output = productService.getProductListCateMain(input);
        	} else {
        		
        		input.setSubCateNo(subCateNo);
        		output = productService.getProductListCate(input);
        	}
			
            
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("output", output);

        return new ModelAndView("shop/section");
    }
	
	
	/** 신상품 목록 페이지 */
    @RequestMapping(value = "/shop/new.do", method = RequestMethod.GET)
    public ModelAndView listNew(Model model, HttpSession session,
    		//페이지 구현에서 사용할 현재 페이지 번호 
			@RequestParam(value = "page", defaultValue = "1") int nowPage
    		) {           
    	
    	Member m = (Member) session.getAttribute("login");
    	
    	/** 1) 페이지 구현에 필요한 변수값 생성 */
		// 전체 게시글 수 
		int totalCount = 0;
		//한 페이지당 표시할 목록 수 
		int listCount = 5;
		//한 그룹당 표시할 페이지 번호 수 
		int pageCount = 5;
		
		
		Product input = new Product();
     
        
        List<Product> output = null;   // 조회결과가 저장될 객체
        
        // 페이지번호를 계산한 결과가 저장될 객체 
 		PageData pageData = null;

        try {
        	
        	if (m != null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
        	// 전체 게시글 수 조회
			totalCount = productService.getProductCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력할것이다.
			pageData = new PageData (nowPage, totalCount, listCount, pageCount);
			
			//SQL 의 LIMIT 절에서 사용될 값을 빈즈의 static 변수에 저장.
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			
            output = productService.getProductListNew(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("output", output);
        model.addAttribute("pageData",pageData);

        return new ModelAndView("shop/new");
    }
    
    /** 타임세일 목록 페이지 */
    @RequestMapping(value = "/shop/sale.do", method = RequestMethod.GET)
    public ModelAndView listSale(Model model,HttpSession session) {            
        
    	Member m = (Member) session.getAttribute("login");
        
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {

        	if (m != null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
            // 데이터 조회하기
            output = productService.getProductListSale(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("output", output);

        return new ModelAndView("shop/sale");
    }
    

    /** 검색 목록 페이지 */
    @RequestMapping(value = "/shop/search_result.do", method = RequestMethod.GET)
    public ModelAndView searchResult(Model model, HttpServletResponse response, HttpSession session,
            // 검색어
            @RequestParam(value="keyword", required=false) String keyword) {     
    	
    	Member m = (Member) session.getAttribute("login");

     
        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        
        input.setTitle(keyword);
        
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {
        	if (m!=null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
            // 데이터 조회하기
            output = productService.getProductList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("output", output);
        model.addAttribute("keyword", keyword);

        return new ModelAndView("shop/search_result");
    }
    
    /** 알뜰킹 페이지 */
    @RequestMapping(value = "/shop/ranking_save.do", method = RequestMethod.GET)
    public ModelAndView rankingSave(Model model, HttpSession session) {    
    	
    	Member m = (Member) session.getAttribute("login");

        
        
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {
        	if (m!=null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
            // 데이터 조회하기
            output = productService.getProductListSave(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("output", output);

        return new ModelAndView("shop/ranking_save");
    }
    
    /** 판매킹 페이지 */
    @RequestMapping(value = "/shop/ranking.do", method = RequestMethod.GET)
    public ModelAndView ranking(Model model, HttpSession session) {     
    	
    	Member m = (Member) session.getAttribute("login");
        
    	List<MainCategory> outputMain = null;   // 조회결과가 저장될 객체
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {
        	
        	if (m!=null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
            // 데이터 조회하기
            output = productService.getProductListPopular(null);
            outputMain = cateService.getListMainCate(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("output", output);
        model.addAttribute("outputMain", outputMain);

        return new ModelAndView("shop/ranking");
    }
    
    /** 특급배송 페이지 */
    @RequestMapping(value = "/shop/express.do", method = RequestMethod.GET)
    public ModelAndView express(Model model, HttpSession session) {            
        
    	Member m = (Member) session.getAttribute("login");
        
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {
        	
        	if (m!=null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
            // 데이터 조회하기
            output = productService.getProductListExpress(null);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        model.addAttribute("output", output);

        return new ModelAndView("shop/express");
    }
}
 