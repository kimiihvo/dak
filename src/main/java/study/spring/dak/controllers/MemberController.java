package study.spring.dak.controllers;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import study.spring.dak.helper.MailHelper;
import study.spring.dak.helper.RegexHelper;
import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Coupon;
import study.spring.dak.model.Member;
import study.spring.dak.model.OutMember;
import study.spring.dak.service.CouponService;
import study.spring.dak.service.MemberService;
import study.spring.dak.service.OutMemberService;

@Controller
public class MemberController {
	/** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  RegexHelper regexHelper;
    
    @Autowired 	MailHelper mailHelper;
    
    @Autowired MemberService memberService;
    @Autowired CouponService couponService;
    
    @Autowired OutMemberService outMemberService;
    
    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 로그인페이지 */
    @RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
    public ModelAndView login(Model model, HttpSession session) {
    	
    	if (session.getAttribute("login") != null) {
    		return webHelper.redirect(contextPath, null);
    	}
    	
    	return new ModelAndView("member/login");
    }
    
    /** 로그인 처리 페이지 */
    @RequestMapping(value = "/member/login_ok.do", method = RequestMethod.POST)
    public ModelAndView loginOk(Model model,
    		HttpSession session,
    		HttpServletResponse response,
    		@RequestParam(value="memId", defaultValue="") String memId,
    		@RequestParam(value="memPw", defaultValue="") String memPw,
    		@RequestParam(value="auto_login", defaultValue="0") int autoLogin) {
    	
    	if (memId.equals("") || memPw.equals("")) {
    		webHelper.redirect(null, "잘못된 접근입니닭!");
    	}
    	
    	if (session.getAttribute("login") != null){
            session.removeAttribute("login");
        }
    	
    	Member input = new Member();
    	input.setMemId(memId);
    	input.setMemPw(memPw);
    	
    	Member output = new Member();
    	
    	try {
			output = memberService.loginCheck(input);
			session.setAttribute("login", output);
			
			// 자동로그인 선택했을 시 실행
			if (autoLogin == 1) {
				// 자동 로그인 유효기간 설정 
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * 60 * 60 * 24 *7)); //7일
				
				memberService.keepLogin(memId, session.getId(), sessionLimit);
				
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7);
				response.addCookie(loginCookie);
			}
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	Object dest = session.getAttribute("dest");
    	
    	return webHelper.redirect(dest != null ? (String)dest : contextPath, output.getNick() + "님 반갑습니닭!");
    
    }
    
    /** 회원가입 페이지 */
    @RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
    public ModelAndView join(Model model) {
    	
    	return new ModelAndView("member/join");
    }
    
    
    /** 로그아웃 페이지 */
    @RequestMapping(value = "/member/logout_ok.do", method = RequestMethod.GET)
    public ModelAndView logoutOk(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
    	
    	Object object = session.getAttribute("login");
    	if (object != null) {
    		Member member = (Member) object;
    		session.removeAttribute("login");
    		session.invalidate();
    		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
    		if (loginCookie != null) {
    			loginCookie.setPath("/");
    			loginCookie.setMaxAge(0);
    			response.addCookie(loginCookie);
    			try {
    				memberService.keepLogin(member.getMemId(), "none", new Date());
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    		}
    	}
    	
    	return webHelper.redirect(contextPath + "/member/login.do", "로그아웃 되었습니닭!");
    };
    
    
    /** 회원가입 처리 페이지 */
    @RequestMapping(value = "/member/join_ok.do", method = RequestMethod.POST)
    public ModelAndView joinOk(Model model,
    		@RequestParam(value="mId", defaultValue="") String mId,
    		@RequestParam(value="mPw", defaultValue="") String mPw,
    		@RequestParam(value="mName", defaultValue="") String mName,
    		@RequestParam(value="nick", defaultValue="") String nick,
    		@RequestParam(value="phone", defaultValue="") String phone,
    		@RequestParam(value="email1", defaultValue="") String email1,
    		@RequestParam(value="email2", defaultValue="") String email2,
    		@RequestParam(value="email3", defaultValue="") String email3,
    		@RequestParam(value="birth1", defaultValue="") String birth1,
    		@RequestParam(value="birth2", defaultValue="") String birth2,
    		@RequestParam(value="birth3", defaultValue="") String birth3,
    		@RequestParam(value="gender", defaultValue="") String gender,
    		@RequestParam(defaultValue="0") int isIdChecked,
    		@RequestParam(defaultValue="0") int isNickChecked
    		) {
    	
    	// 유효성 검사
    	if (isIdChecked != 1) {
    		return webHelper.redirect(null, "아이디 중복검사를 확인해주세요.");
    	}
    	
    	if (isNickChecked != 1) {
    		return webHelper.redirect(null, "닉네임 중복검사를 확인해주세요.");
    	}
    	
    	if (!regexHelper.isKor(mName) || !regexHelper.isValue(mName)) {
    		return webHelper.redirect(null, "이름은 한글만 가능합니다.");
    	}
    	
    	if (!regexHelper.isNum(phone) || !regexHelper.isValue(phone)) {    		
    		return webHelper.redirect(null, "연락처는 숫자만 가능합니다.");
    	}
    	
    	String email = "";
    	
    	if (email2.equals("") && !email3.equals("")) {
    		email += email1 + "@" + email3;
    	} else if (email3.equals("") && !email2.equals("")) {
    		email += email1 + "@" + email2;
    	}
    	
    	
    	
    	String birthdate = String.format("%s-%s-%s", birth1, birth2, birth3);
    	
    	Member input = new Member();
    	input.setMemId(mId);
    	input.setMemPw(mPw);
    	input.setMemName(mName);
    	input.setNick(nick);
    	input.setPhone(phone);
    	input.setEmail(email);
    	input.setBirthdate(birthdate);
    	input.setGender(gender);
    	
    	// 이미 존재하는 이메일을 입력한 경우 다시 회원가입 폼으로 보내는 역할
    	try {
    		int result = memberService.emailCheck(input);
    		if (result == 1) {
    			throw new Exception("이미 존재하는 이메일입니다.");
    		}
    	} catch (Exception e) {
    		return webHelper.redirect(null, "이미 존재하는 이메일입니닭 ㅠ,ㅠ");
    	}
    	
    	try {
			memberService.doJoin(input);
			
			Coupon inputC = new Coupon();
			
			inputC.setCode("NEWMEMBER");
			inputC.setTitle("신규회원 환영 쿠폰");
			inputC.setMemno(input.getMemno());
			inputC.setDiscount(5000);
			inputC.setOrderOver(10000);
			
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DAY_OF_MONTH,30);
			
			inputC.setExpDate(String.format("%d-%d-%d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)+1, cal.get(Calendar.DATE)));
			
			couponService.addCoupon(inputC);
		} catch (Exception e) {
			return webHelper.redirect(null, "회원가입에 실패했습니닭 ㅠ,ㅠ");
		}
    	
    	
    	return webHelper.redirect(contextPath + "/member/login.do", input.getNick() + "님 회원가입을 축하드립니닭!");
    }
    
    
    /** 아이디 비밀번호 찾기 페이지 */
    @RequestMapping(value = "/member/find.do", method = RequestMethod.GET)
    public ModelAndView find(Model model) {
    	
    	return new ModelAndView("member/find");
    }
    
    /** 아이디 중복 검사 */
    @ResponseBody
    @RequestMapping(value = "/member/id_check.do", method = RequestMethod.POST)
    public int idCheck(@RequestParam String memId) throws Exception {
    	if (!regexHelper.isValue(memId)) {
    		return 2;
    	}
    	
    	if (!regexHelper.isEngNum(memId)) {
    		return 3;
    	}
    	
    	Member input = new Member();
    	input.setMemId(memId);
    	
    	int result = memberService.idCheck(input);
    	
		return result;    	
    }
    
    /** 닉네임 중복 검사 */
    @ResponseBody
    @RequestMapping(value = "/member/nick_check.do", method = RequestMethod.POST)
    public int nickCheck(@RequestParam String nick) throws Exception {
    	
    	if (!regexHelper.isValue(nick)) {
    		return 2;
    	}
    	
    	Member input = new Member();
    	input.setNick(nick);
    	
    	int result = memberService.nickCheck(input);
    	
		return result;    	
    }
    
    /** 아이디 찾기 확인 페이지 */
    @RequestMapping(value = "/member/find_id_ok.do", method = RequestMethod.POST)
    public ModelAndView findIdOk(Model model,
    		@RequestParam(value="memName") String memName,
    		@RequestParam(value="phone[]") String[] phone_) {
    	
    	String phone = phone_[0] + phone_[1] + phone_[2];
    	
    	Member input = new Member();
    	input.setMemName(memName);
    	input.setPhone(phone);
    	
    	String output = null;
    	
    	try {
			output = memberService.getMemberId(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	return webHelper.redirect(contextPath + "/member/login.do", "회원님의 ID는 [" + output + "] 입니닭!");
    }
    
    /** 비밀번호 찾기 확인 페이지 */
    @RequestMapping(value = "/member/find_pw_ok.do", method = RequestMethod.POST)
    public ModelAndView findPwOk(Model model,
    		@RequestParam(value="memId") String memId,
    		@RequestParam(value="memName") String memName,
    		@RequestParam(value="email") String email) {
    	
    	Member input = new Member();
    	input.setMemId(memId);
    	input.setMemName(memName);
    	input.setEmail(email);
    	
    	String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		
		input.setMemPw(pw);
    	
    	try {
			memberService.updatePassword(input);
			mailHelper.sendMail(email, "닭킹랭컴 임시비밀번호입니닭!", "발급 된 임시 비밀번호: " + pw);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	return webHelper.redirect(contextPath + "/member/login.do", "임시비밀번호가 발송되었습니다.");
    }
    
    
    /** 회원정보 수정 전 비밀번호 확인 페이지 */
    @RequestMapping(value = "/mypage/member_edit_check.do", method = RequestMethod.GET)
    public String memberEditCheck(Model model, HttpSession session) {
    	Member m = (Member) session.getAttribute("login");
    	
    	model.addAttribute("m", m);
    	
    	return new String("mypage/member_edit_check");
    }
    
    /** 회원정보 수정 전 비밀번호 확인을 처리하는 페이지 */
    @RequestMapping(value = "/mypage/member_edit_check_ok.do", method = RequestMethod.POST)
    public ModelAndView memberEditCheckOk(Model model, HttpSession session,
    		String memId, String memPw) {
    	
    	Member input = new Member();
    	input.setMemId(memId);
    	input.setMemPw(memPw);
    	
    	try {
			memberService.loginCheck(input);
			
			session.setAttribute("isEditChecked", true);
			
			return webHelper.redirect(contextPath + "/mypage/member_edit.do", null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return webHelper.redirect(null, "비밀번호가 일치하지 않습니닭!");
    }
    
    
    /** 회원정보 수정 페이지 */
    @RequestMapping(value = "/mypage/member_edit.do", method = RequestMethod.GET)
    public ModelAndView memberEdit(Model model, HttpSession session) {
    	
    	Object isEditChecked = session.getAttribute("isEditChecked");
    	
    	if(isEditChecked == null) {
    		return webHelper.redirect(contextPath + "/mypage/member_edit_check.do", "잘못된 접근입니닭!");
    	}
    	
    	Member m = (Member) session.getAttribute("login");
    	
    	model.addAttribute("m", m);
    	
    	return new ModelAndView("mypage/member_edit");
    }
    
    /** 회원정보 수정 처리 페이지 */
    @RequestMapping(value ="/mypage/member_edit_ok.do", method = RequestMethod.POST)
    public ModelAndView memberEditOk(Model model, HttpSession session,
    		@RequestParam(value="mPw", defaultValue="") String mPw,
    		@RequestParam(value="mName", defaultValue="") String mName,
    		@RequestParam(value="nick", defaultValue="") String nick,
    		@RequestParam(value="phone", defaultValue="") String phone,
    		@RequestParam(value="email1", defaultValue="") String email1,
    		@RequestParam(value="email2", defaultValue="") String email2,
    		@RequestParam(value="email3", defaultValue="") String email3,
    		@RequestParam(value="birth1", defaultValue="") String birth1,
    		@RequestParam(value="birth2", defaultValue="") String birth2,
    		@RequestParam(value="birth3", defaultValue="") String birth3,
    		@RequestParam(value="gender", defaultValue="") String gender) {
    	
    	Member m = (Member) session.getAttribute("login");
    	
    	Member input = new Member();
    	input.setMemno(m.getMemno());
    	input.setMemPw(mPw);
    	input.setNick(nick);
    	input.setPhone(phone);
    	
    	String email = "";
    	
    	if (email2.equals("") && !email3.equals("")) {
    		email += email1 + "@" + email3;
    	} else if (email3.equals("") && !email2.equals("")) {
    		email += email1 + "@" + email2;
    	}
    	
    	String birthdate = String.format("%s-%s-%s", birth1, birth2, birth3);
    	
    	input.setEmail(email);
    	input.setBirthdate(birthdate);
    	input.setGender(gender);
    	
    	try {
			memberService.editMember(input);
			
			session.invalidate();
		} catch (Exception e) {
			return webHelper.redirect(null, "회원정보 수정에 실패했습니닭!");
		}
    	
    	
		return webHelper.redirect(contextPath + "/member/login.do", "회원정보 수정이 완료되었습니다. 다시 로그인 해주세요닭!");
    }
    
    /** 회원 탈퇴 페이지 */
    @RequestMapping(value = "/mypage/member_del.do", method = RequestMethod.GET)
    public ModelAndView memberDelete(Model model, HttpSession session) {
    	
    	
    	
    	return new ModelAndView("mypage/member_del");
    }
    
    /** 회원 탈퇴 확인 페이지 */
    @RequestMapping(value = "/mypage/member_del_ok.do", method = RequestMethod.POST)
    public ModelAndView memberDeleteOk(Model model, HttpSession session,
    		@RequestParam String memPw,
    		@RequestParam String outWhy) {
    	Member m = (Member) session.getAttribute("login");
    	
    	m.setMemPw(memPw);
    	
    	Member result = new Member();
		try {
			result = memberService.loginCheck(m);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
    	
    	if (result != null) {
    	
	    	OutMember input = new OutMember();
	    	input.setMemId(m.getMemId());
	    	input.setMemName(m.getMemName());
	    	input.setPhone(m.getPhone());
	    	input.setEmail(m.getEmail());
	    	input.setOutWhy(outWhy);
	    	
	    	try {
	    		memberService.doOut(m);
				outMemberService.addOutMember(input);
			} catch (Exception e) {
				return webHelper.redirect(null, "탈퇴에 실패하였습니닭!");
			}
    	
    	} else {
    		return webHelper.redirect(null, "비밀번호가 일치하지 않습니닭!");
    	}
    	
    	session.invalidate();
    	
    	return webHelper.redirect(contextPath, "회원탈퇴가 정상적으로 처리되었습니닭!");
    }
    
}
