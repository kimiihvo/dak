package study.spring.dak.controllers;



import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.PageData;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.model.OrderList;
import study.spring.dak.model.Product;
import study.spring.dak.model.Review;
import study.spring.dak.model.UploadItem;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.OrderService;
import study.spring.dak.service.ProductService;
import study.spring.dak.service.ReviewService;

@Slf4j
@Controller
public class ReviewController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;
	@Autowired MemberService memberService;
	    
	@Autowired ReviewService reviewService;
	
	@Autowired ProductService productService;
	
	@Autowired OrderService orderService;
	
	
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	
	/** 리뷰 작성 페이지 */
	@RequestMapping(value = "/mypage/review_list.do", method = RequestMethod.GET)
	public ModelAndView review_list(Model model, HttpSession session,
		// 페이지 구현에서 사용할 현재 페이지 번호
		@RequestParam(value="page",defaultValue="1") int nowPage) {
	int totalCount = 0; //전체 게시글 수
	int listCount = 5; // 한 페이지당 표시할 목록 수
	int pageCount =5; // 한 그룹당 표시할 페이지 번호 수

	Member m = (Member) session.getAttribute("login");
	
	Review input = new Review();
	PageData pageData = null;
	input.setMemno(m.getMemno());
	List<Review> review= null;
    try {
    	
    	totalCount =reviewService.getMyReviewCount(input);
		pageData = new PageData(nowPage, totalCount,listCount,pageCount);
		Review.setOffset(pageData.getOffset());
		Review.setListCount(pageData.getListCount());
		review= reviewService.getMyReviewList(input);
	} catch (Exception e) {
		
		return webHelper.redirect(null,e.getLocalizedMessage());
		
	}
	   
		model.addAttribute("review",review);
		model.addAttribute("pageData",pageData);
			
		return new ModelAndView("mypage/review_list");
	}	
	
	/** 리뷰 작성 페이지 */
	@RequestMapping(value = "/mypage/review_write.do", method = RequestMethod.GET)
	public ModelAndView review_write(Model model, HttpSession session,
		int prdno , int odrno) {
		
		Member m = (Member) session.getAttribute("login");
		Product product = new Product();
		product.setPrdno(prdno);
		ArrayList<Integer> list = new ArrayList<Integer>();
		Review review = new Review();
		
		review.setMemno(m.getMemno());
		review.setPrdno(prdno);
		review.setOdrno(odrno);
		try {
			
	    	review =reviewService.getReviewItem(review);
		} catch (Exception e) {
			
			return webHelper.redirect(null,e.getLocalizedMessage());
			
		}
		
		if (review==null) {
		try {
			
	    	product =productService.getProductItem(product);
		} catch (Exception e) {
			
			return webHelper.redirect(null,e.getLocalizedMessage());
			
		}
			list.add(odrno);
	    	model.addAttribute("list",list);
		   	model.addAttribute("product",product);
		   	
			return new ModelAndView("mypage/review_write");}
		else {
				return webHelper.redirect(null,"이미 작성된 리뷰입니다.");
			}
		
		}	
		
	
	
	@RequestMapping(value = "/mypage/review_write_ok.do", method = RequestMethod.POST)
	public ModelAndView review_write_ok(Model model, HttpSession session,
			int prdno, int odrno,
			@RequestParam(required=false) MultipartFile img,
			int memRating,
			String content ) { 
		
		
		Member m = (Member) session.getAttribute("login");
		int memno = m.getMemno();
		
		UploadItem item = new UploadItem();
		Review input = new Review();
		if(!img.isEmpty()) {
	    	   try {
	    		   item = webHelper.saveMultipartFile(img);
	    	       } catch (NullPointerException e) {
	    	           e.printStackTrace();
	    	           return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
	    	       } catch (Exception e) {
	    	           e.printStackTrace();
	    	           return webHelper.redirect(null, "업로드에 실패했습니다.");
	    	       }
	    	   		/** [신규] 파일 형식이 이미지인 경우 썸네일 이미지 생성하기 */
	           if (img != null && img.getContentType().indexOf("image") > -1) {
	               // 필요한 이미지 사이즈로 썸네일을 생성할 수 있다.
	               String thumbnailPath = null;
	               
	               try {
	                   thumbnailPath = webHelper.createThumbnail(item.getFilePath(), 240, 240, true);
	               } catch (Exception e) {
	                   e.printStackTrace();
	                   return webHelper.redirect(null, "썸네일 이미지 생성에 실패했습니다.");
	               }
	               
	               // 썸네일 경로를 URL로 변환
	               String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
	               // 리턴할 객체에 썸네일 정보 추가
	               item.setThumbnailPath(thumbnailPath);
	               item.setThumbnailUrl(thumbnailUrl);
	           }
	        
	           input.setImg(item.getThumbnailUrl());
	       }
		input.setPrdno(prdno);
		input.setMemno(memno);
		input.setOdrno(odrno);
		input.setContent(content);
		Product product = new Product();
		product.setPrdno(prdno);
		input.setMemRating(memRating);
		try {
			product=productService.getProductItem(product); 
			reviewService.addReview(input); 
			product.setRating(product.getRating()+memRating);
			product.setRct(product.getRct()+1);
			productService.editProduct(product);
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			 
			String redirectUrl = contextPath + "/mypage/review_list.do";
			return webHelper.redirect(redirectUrl, "저장되었습니다.");
		 }
}