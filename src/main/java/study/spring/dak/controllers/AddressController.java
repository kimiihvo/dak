package study.spring.dak.controllers;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
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
import study.spring.dak.model.Address;
import study.spring.dak.model.Member;
import study.spring.dak.service.AddressService;
import study.spring.dak.service.MemberService;

@Slf4j
@Controller
public class AddressController {
	
	/** WebHelper 주입 */
    // --> import org.springframework.beans.factory.annotation.Autowired;
    // --> import study.spring.springhelper.helper.WebHelper;
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    // --> import study.spring.springhelper.helper.RegexHelper;
    @Autowired  RegexHelper regexHelper;
    
    @Autowired MemberService memberService;
    @Autowired AddressService addressService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    // --> import org.springframework.beans.factory.annotation.Value;
    @Value("#{servletContext.contextPath}")
    String contextPath;
	
    
    /**
     * 배송지 목록 조회
     * @param model
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/mypage/address.do", method = RequestMethod.GET)
	public ModelAndView address(Model model, HttpServletRequest request, HttpSession session) {
    	
    	Member m = (Member) session.getAttribute("login");
    	int memno = m.getMemno();
    	
    	log.debug(m.toString());
    	
    	Address input = new Address();
    	input.setMemno(memno);
    	
    	List<Address> output = null;
    	

        try {
        	if (m!=null) {
				m = memberService.getMember(m);
				model.addAttribute("m", m);
			}
        	output = addressService.getListAddress(input);
        	
//        	int num_ = 0;
//        	
//        	for (Address i : output) {
//        		
//				addressService.getItemAddress(i);
//				
//				String num = Integer.toString(num_);
//				
//				model.addAttribute(num, i);
//				
//				num_++;
        	
        	
			//}
            
		} catch (Exception e) {
			
			return webHelper.redirect(null,e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		
    	
    
    	return new ModelAndView("mypage/address");
    }
    
    /** 배송지 수정 처리 */
	@RequestMapping(value = "/mypage/address_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok (Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value = "adrno", defaultValue = "0") int adrno,
			@RequestParam(value = "toName", defaultValue = "") String toName,
			@RequestParam(value = "phone1", defaultValue = "") String phone1,
			@RequestParam(value = "phone2", defaultValue = "") String phone2,
			@RequestParam(value = "zcode", defaultValue = "") String zcode,
			@RequestParam(value = "adr1", defaultValue = "") String adr1,
			@RequestParam(value = "adr2", defaultValue = "") String adr2,
			@RequestParam(value = "isDefault", defaultValue = "N") String isDefault,
			@RequestParam(value = "express", defaultValue = "N") String express
			) { 
		
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반문자열 
		if (!regexHelper.isValue(toName))				{return webHelper.redirect(null,"받는 분 이름을 입력하세요.");}
		if (!regexHelper.isKor(toName))				{return webHelper.redirect(null, "받는 분 이름은 한글만 가능합니다.");}
		if (!regexHelper.isValue(phone2))				{return webHelper.redirect(null, "휴대폰 번호를 입력하세요 ");}
		if (!regexHelper.isNum(phone2))				{return webHelper.redirect(null, "휴대폰 번호는 숫자만 가능합니다.");}
		if (!regexHelper.isValue(zcode))				{return webHelper.redirect(null, "우편번호를 입력하세요.");}
		if (!regexHelper.isValue(adr1))				{return webHelper.redirect(null, "기본주소를 입력하세요.");}
		
		
		Member m = (Member) session.getAttribute("login");
		int memno = m.getMemno();
		
		
        /** 2) 데이터 수정하기 */
        // 수정할 값들을 Beans에 담는다.
		Address input = new Address();
		input.setMemno(memno);
		
		
		

        try {
        	
        	int count = addressService.countAddressItem(memno);
        	
        	if(count != 0) {
        		
        		Address db = null;
        		
        		db = addressService.getItemAddressForCount(input);
        		
        		db.setIsDefault("N");
        		
        		log.debug(db.toString());
        		
        		addressService.updateAddressItem(db);
        	}
        	
        	
        	input.setAdrno(adrno);
        	input.setToName(toName);
        	input.setPhone(phone1+phone2);
        	input.setZcode(zcode);
        	input.setAdr1(adr1);
        	input.setAdr2(adr2);
        	input.setIsDefault(isDefault);
        	input.setExpress(express);
        	
        	// 특급배송 관련 업데이트 (배송지가 서울인 경우)
        	char exp = input.getZcode().charAt(0);
        	
        	if (exp == '0') {
        		input.setExpress("Y");
        	}
        	
        	addressService.updateAddressItem(input);
            
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        
        //ajax로 수정 요망 
        
        return webHelper.redirect("address.do", "배송지가 수정되었습니다.");	
	}
	
	/** 상세  페이지 */
	@RequestMapping(value = "/mypage/address_edit.do", method = RequestMethod.GET)
	public ModelAndView get_item (Model model, HttpSession session,
			@RequestParam (value = "adrno", defaultValue = "0") int adrno ) { 
		// 정수형 파라미터는 유효성 검사를 간결하게 처리하기 위해 require 옵션보다 기본 값을 0으로 지정하는 것이 좋음
		
		Member m = (Member) session.getAttribute("login");
		int memno = m.getMemno();
		
		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야한다.
		if (adrno == 0) { //0인 이유는 defaultValue가 0이기때문?
			return webHelper.redirect(null, "배송지번호가 없습니다.");
		}
		
		/** 1) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        Address input = new Address();
        input.setAdrno(adrno);
        input.setMemno(memno);

        // 조회결과를 저장할 객체 선언
        Address output = null;

        try {
            // 데이터 조회
            output = addressService.getItemAddress(input);
            
		} catch (Exception e) {
			return webHelper.redirect(null,e.getLocalizedMessage());
		}
		/** 3) view 처리 */
		
		model.addAttribute("output", output);
		
		return new ModelAndView("mypage/address_edit"); 
	
	}
	
	/** 배송지 삭제 처리 */
	@RequestMapping(value = "/mypage/address_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model, 
			@RequestParam(value = "adrno", defaultValue = "0") int adrno
			) {

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 빈즈에 저장하기
		Address input = new Address();
		input.setAdrno(adrno);

		try {
			// 데이터삭제
			addressService.deleteAddressItem(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동.
		return webHelper.redirect(contextPath + "/mypage/address.do", "삭제되었습니다.");

	}
	
	/** 배송지 추가 */
	@RequestMapping(value = "/mypage/address_add_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, HttpSession session,
			@RequestParam(value = "memno", defaultValue = "0") int memno,
			@RequestParam(value = "toName", defaultValue = "") String toName,
			@RequestParam(value = "phone1", defaultValue = "") String phone1,
			@RequestParam(value = "phone2", defaultValue = "") String phone2,
			@RequestParam(value = "zcode", defaultValue = "") String zcode,
			@RequestParam(value = "adr1", defaultValue = "") String adr1,
			@RequestParam(value = "adr2", defaultValue = "") String adr2,
			@RequestParam(value = "isDefault", defaultValue = "N") String isDefault,
			@RequestParam(value = "express", defaultValue = "N") String express
			) { 
		
		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		// 일반문자열 
		if (!regexHelper.isValue(toName))				{return webHelper.redirect(null,"받는 분 이름을 입력하세요.");}
		if (!regexHelper.isKor(toName))				{return webHelper.redirect(null, "받는 분 이름은 한글만 가능합니다.");}
		if (!regexHelper.isValue(phone2))				{return webHelper.redirect(null, "휴대폰 번호를 입력하세요 ");}
		if (!regexHelper.isNum(phone2))				{return webHelper.redirect(null, "휴대폰 번호는 숫자만 가능합니다.");}
		if (!regexHelper.isValue(zcode))				{return webHelper.redirect(null, "우편번호를 입력하세요.");}
		if (!regexHelper.isValue(adr1))				{return webHelper.redirect(null, "기본주소를 입력하세요.");}

		Member m = (Member) session.getAttribute("login");
		memno = m.getMemno();

		/** 2) 데이터 저장하기 */
		
		Address input = new Address();
		input.setMemno(memno);
    	

		try {
			
			int count = addressService.countAddressItem(memno);
        	
        	if(count != 0) {
        		
        		Address db = null;
        		
        		db = addressService.getItemAddressForCount(input);
        		
        		db.setIsDefault("N");
        		
        		log.debug(db.toString());
        		
        		addressService.updateAddressItem(db);
        	}
        	
        	input.setToName(toName);
        	input.setPhone(phone1+phone2);
        	input.setZcode(zcode);
        	input.setAdr1(adr1);
        	input.setAdr2(adr2);
        	input.setIsDefault(isDefault);
        	input.setExpress(express);
        	
        	// 특급배송 관련 업데이트 (배송지가 서울인 경우)
        	char exp = input.getZcode().charAt(0);
        	
        	if (exp == '0') {
        		input.setExpress("Y");
        	}
			
			addressService.addAddressItem(input);
			

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		
		/** 3) 결과를 확인하기 위한 페이지 이동 */

		return webHelper.redirect(contextPath + "/mypage/address.do", "배송지가 추가되었습니다.");
	}
	
	

}
