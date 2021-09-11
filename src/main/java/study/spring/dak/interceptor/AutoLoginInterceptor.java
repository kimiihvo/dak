package study.spring.dak.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.service.MemberService;

/** 자동 로그인 기능 구현을 위해 로그인 페이지 접근 전에 실행되도록 하는 인터셉터 */
public class AutoLoginInterceptor implements HandlerInterceptor {

	@Autowired
	WebHelper webHelper;

	@Autowired
	MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession httpSession = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if (loginCookie != null) {
			Member member = memberService.checkUserWithSessionKey(loginCookie.getValue());
			if (member != null) httpSession.setAttribute("login", member);
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}
	
	
	
}
