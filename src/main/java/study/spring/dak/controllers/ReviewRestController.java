package study.spring.dak.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.PageData;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.ProductOrder;
import study.spring.dak.model.Review;
import study.spring.dak.service.OrderService;
import study.spring.dak.service.ProductOrderService;
import study.spring.dak.service.ReviewService;

@Slf4j
@RestController
public class ReviewRestController {
	
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired ReviewService reviewService; 
	
	@Autowired ProductOrderService productOrderService; 
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	
    @RequestMapping(value = "/shop/review_list", method = RequestMethod.GET)
    public Map<String, Object> review_list(HttpSession session, int prdno,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) { 
        
	    
  	    /** 1) 페이지 구현에 필요한 변수값 생성 */
  	    int totalCount = 0;              // 전체 게시글 수
  	    int listCount  = 4;             // 한 페이지당 표시할 목록 수
  	    int pageCount  = 1;              // 한 그룹당 표시할 페이지 번호 수
  	
  	
  	    List<Review> output = null; 
  	    Review review= new Review();
  	    review.setPrdno(prdno);
  	    PageData pageData = null;     
  	    
    try {
        // 전체 게시글 수 조회
        totalCount = reviewService.getReviewCount(review);
        // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
        pageData = new PageData(nowPage, totalCount, listCount, pageCount);

        
        // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
        Review.setOffset(pageData.getOffset());
        Review.setListCount(pageData.getListCount());
        
        // 데이터 조회하기
        output = reviewService.getReviewList(review);
    } catch (Exception e) {
        return webHelper.getJsonError(e.getLocalizedMessage());
    }

    /** 3) JSON 출력하기 */
    Map<String, Object> data = new HashMap<String, Object>();
    data.put("item", output);
    data.put("meta", pageData);

    return webHelper.getJsonData(data);
    }

    
    
    
    @RequestMapping(value = "/mypage/review_list", method = RequestMethod.GET)
    public Map<String, Object> myreview_list(HttpSession session, @RequestParam(value="odrno", defaultValue="1") int odrno) { 
        
  	
    	
  	  ProductOrder product= new ProductOrder();
  	  product.setOdrno(odrno);
  	  List<ProductOrder> output =null;  
  	  
    try {
        
        
        output = productOrderService.getProductOrderList(product);
        
    } catch (Exception e) {
        return webHelper.getJsonError(e.getLocalizedMessage());
    }

    /** 3) JSON 출력하기 */
    Map<String, Object> data = new HashMap<String, Object>();
    data.put("item", output);

    return webHelper.getJsonData(data);
    
    }
}  
