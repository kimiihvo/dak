package study.spring.dak.controllers;

import java.util.List;

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
import study.spring.dak.model.OneOnOne;
import study.spring.dak.model.UploadItem;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.OneOnOneService;
@Slf4j
@Controller
public class OneOnOneController {
	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  RegexHelper regexHelper;
    
    @Autowired MemberService memberService;
    
    @Autowired OneOnOneService oneOnOneService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    @RequestMapping(value = "/mypage/oneonone.do", method = RequestMethod.GET)
    public ModelAndView one_one_one(Model model, HttpSession session,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page",defaultValue="1") int nowPage) {
    	int totalCount = 0; //전체 게시글 수
		int listCount = 5; // 한 페이지당 표시할 목록 수
		int pageCount =5; // 한 그룹당 표시할 페이지 번호 수

    	Member m = (Member) session.getAttribute("login");
    	OneOnOne input = new OneOnOne(); // 조건 담을 객체 
		List<OneOnOne> output = null ; //  조회결과가 저장될 객체
		PageData pageData = null;
		input.setMemno(m.getMemno());
        try {
            totalCount = oneOnOneService.getOneOnOneCount(input);
    		pageData = new PageData(nowPage, totalCount,listCount,pageCount);
    		OneOnOne.setOffset(pageData.getOffset());
    		OneOnOne.setListCount(pageData.getListCount());
    		output = oneOnOneService.getOneOnOneList(input);
		} catch (Exception e) {
			return webHelper.redirect(null,e.getLocalizedMessage());
		}
       
		model.addAttribute("output",output);
		model.addAttribute("pageData",pageData);
    	return new ModelAndView("mypage/oneonone");
    }
    
    @RequestMapping(value = "/mypage/oneonone_write.do", method = RequestMethod.GET)
    public ModelAndView oneonone_write(Model model, HttpSession session,OneOnOne oneOnOne) {
    
    	Member m = (Member) session.getAttribute("login");
    	
        try {
        	
            m = memberService.getMember(m);
            
		} catch (Exception e) {
			return webHelper.redirect(null,e.getLocalizedMessage());
		}
		
		model.addAttribute("m", m);
		
    	
    	return new ModelAndView("mypage/oneonone_write");
    }
    
    @RequestMapping(value = "/mypage/oneonone_write_ok.do", method = RequestMethod.POST)
    public ModelAndView oneonone_write_ok(Model model, HttpSession session, OneOnOne oneOnOne,
    		@RequestParam(required=false) MultipartFile img) {
        
    	UploadItem item = null;
    	switch(oneOnOne.getCategory()) {
    	case "1" : 
    		oneOnOne.setCategory("상품관련");
    		break;
    	case "2" : 
    		oneOnOne.setCategory("주문 및 결제");
    		break;
    	case "3" : 
    		oneOnOne.setCategory("배송관련");
    		break;
    	case "4" : 
    		oneOnOne.setCategory("취소/반품");
    		break;
    	case "5" : 
    		oneOnOne.setCategory("기타");
    		break;
    	}
    	if(img.getSize() != 0) {
        try {
        	item = webHelper.saveMultipartFile(img);
        } catch (Exception e) {
            e.printStackTrace();
            return webHelper.redirect(null, "업로드에 실패했습니다.");
        }
        oneOnOne.setFile(item.getFileUrl());
    	}else {
    		oneOnOne.setFile("");
    	}
    	
        
    	Member m = (Member) session.getAttribute("login");
    	
    	
    	oneOnOne.setMemno(m.getMemno());
        try {
        	oneOnOneService.addOneOnOne(oneOnOne);
            m = memberService.getMember(m);
            
		} catch (Exception e) {
			return webHelper.redirect(null,e.getLocalizedMessage());
		}
		
		model.addAttribute("m", m);
		
    	
    	return webHelper.redirect("oneonone.do","1:1 문의가 등록되었습니다.");
    }
    
    
   
    
    
}
