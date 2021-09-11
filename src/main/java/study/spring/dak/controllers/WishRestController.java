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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.model.Wish;
import study.spring.dak.service.WishService;

@Slf4j
@RestController
public class WishRestController {

	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired WishService wishService; 
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 찜한 상품 목록 조회 */
    @RequestMapping(value = "/mypage/wish_list", method = RequestMethod.GET)
    public Map<String, Object> get_list(HttpSession session) {

		Member m = (Member) session.getAttribute("login");

		int memno = m.getMemno();
        

        /** 2) 데이터 조회하기 */
        // 조회에 필요한 조건값을 Beans에 담는다.
        Wish input = new Wish();
        input.setMemno(memno);

        
        List<Wish> output = null;   // 조회결과가 저장될 객체

        try {
            // 데이터 조회하기
            output = wishService.getWishList(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) JSON 출력하기 */
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("item", output);

        return webHelper.getJsonData(data);
    }
    
    
    /** 찜한 상품 등록 (사용자 마이페이지) */
    @RequestMapping(value = "/mypage/wish_list", method = RequestMethod.POST)
    public Map<String, Object> post(HttpSession session,
            @RequestParam(value="prdno", defaultValue="0") int prdno
            ) {
    	
    	Member m = (Member) session.getAttribute("login");

		int memno = m.getMemno();
        
        
        /** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        Wish input = new Wish();
        input.setMemno(memno);
        input.setPrdno(prdno);
        
        try {
        	
        	//중복 상품이 있는지 검사 
        	int count = wishService.countWishExist(prdno, memno);
        	
        	// 있다면?
        	if (count != 0) {
        		// 담을 빈즈 준비 
        		Wish db = null;
        		//담아 
        		db = wishService.getWishItem(input);
        		//지워
        		wishService.deleteWish(db);
        		
        		//없다면?
        	} else {
        		// 데이터 저장
        		wishService.addWish(input);
        	}
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 JSON 출력 */
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("input", input);
        
        return webHelper.getJsonData(map);
    }
    
    
    /** 삭제 처리 */
    @RequestMapping(value = "/mypage/wish_list_delete", method = RequestMethod.POST)
    public Map<String, Object> delete(HttpSession session,
			@RequestParam(value = "chbox[]") List<String> chArr, Wish wish) {
    	
    	
        
    	Member m = (Member) session.getAttribute("login");

		int memno = m.getMemno();
		
		int wishno = 0;
		
		if (chArr == null)				{return webHelper.getJsonError(null);}
		
		
		
        try {
        	wish.setMemno(memno);
        	
        	log.debug(wish.toString());
        	
        	for (String i : chArr) {
				wishno = Integer.parseInt(i);
				wish.setWishno(wishno);
				
				wishService.deleteWish(wish);
			}
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 JSON 출력 */
        // 확인할 대상이 삭제된 결과값만 OK로 전달
        return webHelper.getJsonData();
    }

}
