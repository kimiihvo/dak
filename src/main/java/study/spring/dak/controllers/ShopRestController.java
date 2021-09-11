package study.spring.dak.controllers;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.dak.helper.PageData;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.MainCategory;
import study.spring.dak.model.Product;
import study.spring.dak.service.CartService;
import study.spring.dak.service.CateService;
import study.spring.dak.service.ProductService;

@RestController
public class ShopRestController {
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
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 상세 페이지 */
//    @RequestMapping(value = "/shop/{prdno}", method = RequestMethod.GET)
//    public Map<String, Object> get_item(@PathVariable("prdno") int prdno) {
//
//        /** 1) 데이터 조회하기 */
//        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
//        Product input = new Product();
//        input.setPrdno(prdno);
//
//        // 조회결과를 저장할 객체 선언
//        Product output = null;
//
//        try {
//            // 데이터 조회
//            output = productService.getProductItem(input);
//        } catch (Exception e) {
//            return webHelper.getJsonError(e.getLocalizedMessage());
//        }
//        
//        /** 2) JSON 출력하기 */
//        Map<String, Object> data = new HashMap<String, Object>();
//        data.put("item", output);
//        
//        return webHelper.getJsonData(data);
//    }
    
    /** 검색 목록 페이지 */
    @RequestMapping(value = "/shop/search", method = RequestMethod.GET)
    public Map<String, Object> searchResult(HttpServletResponse response,
            // 검색어
            @RequestParam(value="keyword", required=false) String keyword) {            
        
        /** 1) 페이지 구현에 필요한 변수값 생성 */
     
        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Product input = new Product();
        
        input.setTitle(keyword);
        
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {
            // 데이터 조회하기
            output = productService.getProductList(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output", output);
        data.put("keyword", keyword);

        return webHelper.getJsonData(data);
    }
    
    /** 신상품 목록 페이지 */
    @RequestMapping(value = "/shop/new", method = RequestMethod.GET)
    public Map<String, Object> listNew(
    		//페이지 구현에서 사용할 현재 페이지 번호 
			@RequestParam(value = "page", defaultValue = "1") int nowPage
    		) {           
    	
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
        	// 전체 게시글 수 조회
			totalCount = productService.getProductCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력할것이다.
			pageData = new PageData (nowPage, totalCount, listCount, pageCount);
			
			//SQL 의 LIMIT 절에서 사용될 값을 빈즈의 static 변수에 저장.
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			
			output = productService.getProductListNew(null);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }
        
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output", output);
        data.put("pageData",pageData);

        return webHelper.getJsonData(data);
    }
    
    
    
    
    
    
    /** 타임세일 목록 페이지 */
    @RequestMapping(value = "/shop/sale", method = RequestMethod.GET)
    public Map<String, Object> listSale(Model model) {            
        
     
        
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {
            // 데이터 조회하기
            output = productService.getProductListSale(null);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output", output);

        return webHelper.getJsonData(data);
    }
    
    
    /** 알뜰킹 페이지 */
    @RequestMapping(value = "/shop/save", method = RequestMethod.GET)
    public Map<String, Object> rankingSave(Model model) {            
        
     
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {
            // 데이터 조회하기
            output = productService.getProductListSave(null);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output", output);

        return webHelper.getJsonData(data);
    }
    
    /** 판매킹 페이지 */
    @RequestMapping(value = "/shop/ranking", method = RequestMethod.GET)
    public Map<String, Object> ranking(Model model) {            
        
    	
        List<Product> output = null;   // 조회결과가 저장될 객체
        List<MainCategory> outputMain = null;   // 조회결과가 저장될 객체

        try {
            // 데이터 조회하기
            output = productService.getProductListPopular(null);
            outputMain = cateService.getListMainCate(null);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output", output);
        data.put("outputMain", outputMain);

        return webHelper.getJsonData(data);
    }
    
    
    /** 특급배송 페이지 */
    @RequestMapping(value = "/shop/express", method = RequestMethod.GET)
    public Map<String, Object> express(Model model) {            
        
     
        
        List<Product> output = null;   // 조회결과가 저장될 객체

        try {
            // 데이터 조회하기
            output = productService.getProductListExpress(null);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("output", output);

        return webHelper.getJsonData(data);
                                                                 }
    
    /** 작성 폼에 대한 action 페이지 */
//    @RequestMapping(value = "/shop", method = RequestMethod.POST)
//    public Map<String, Object> post(
//    		@RequestParam(value = "memno", defaultValue = "0") int memno,
//			@RequestParam(value = "prdno", defaultValue = "0") int prdno,
//            @RequestParam(value = "regDate", defaultValue = "0") String regDate,
//			@RequestParam(value = "qty", defaultValue = "0") int qty) { 
//        
////        /** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
////        // 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
////        if (!regexHelper.isValue(name))     { return webHelper.getJsonWarning("교수 이름을 입력하세요."); }
////        if (!regexHelper.isKor(name))       { return webHelper.getJsonWarning("교수 이름은 한글만 가능합니다."); }
////        if (!regexHelper.isValue(userid))   { return webHelper.getJsonWarning("교수 아이디를 입력하세요."); }
////        if (!regexHelper.isEngNum(userid))  { return webHelper.getJsonWarning("교수 아이디는 영어와 숫자로만 가능합니다."); }
////        if (!regexHelper.isValue(position)) { return webHelper.getJsonWarning("직급을 입력하세요."); }
////        if (!regexHelper.isValue(hiredate)) { return webHelper.getJsonWarning("입사일을 입력하세요."); }
////
////        // 숫자형으로 선언된 파라미터()
////        if (sal == 0)                       { return webHelper.getJsonWarning("급여를 입력하세요."); }
////        if (sal < 0)                        { return webHelper.getJsonWarning("급여는 0보다 작을 수 없습니다."); }
////        if (comm < 0)                       { return webHelper.getJsonWarning("보직수당은 0보다 작을 수 없습니다."); }
////        if (deptno == 0)                    { return webHelper.getJsonWarning("소속 학과 번호를 입력하세요."); }
//
//        /** 2) 데이터 저장하기 */
//        // 저장할 값들을 Beans에 담는다.
//        Cart input = new Cart();
//		input.setMemno(memno);
//		input.setPrdno(prdno);
//		input.setQty(qty);
//		input.setRegDate(regDate);
//
//		try {
//			//데이터 저장 
//			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 pk값이 저장된다 
//			cartService.addCartItem(input);
//			
//		} catch (Exception e) {
//			return webHelper.getJsonError(e.getLocalizedMessage());
//		}
//
//        
//        return webHelper.getJsonData();
//    }

}
