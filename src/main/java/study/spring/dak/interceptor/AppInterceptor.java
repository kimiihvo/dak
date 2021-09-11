package study.spring.dak.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;

import study.spring.dak.helper.WebHelper;
import study.spring.dak.model.Member;
import study.spring.dak.service.MemberService;

public class AppInterceptor implements HandlerInterceptor {
	
	@Autowired
	WebHelper webHelper;

    @Autowired MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		webHelper.init(request, response);
		
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}	
	
}
