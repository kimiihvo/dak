package study.spring.dak.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import study.spring.dak.helper.WebHelper;

/** 로그인 처리 기능을 하는 인터셉터 */
public class LoginCheckInterceptor implements HandlerInterceptor {
	
	@Autowired
	WebHelper webHelper;
	
	private void saveDest(HttpServletRequest request) {

	    String uri = request.getRequestURI();
	    String query = request.getQueryString();
	    
	    // 기존 URI에 parameter가 있을 경우, 이를 포함
	    if(query == null || query.equals("null")) {
	    	query = "";
	    } else {
	        query = "?" + query;
	    }
	    
	    if(request.getMethod().equals("GET")) {
	        request.getSession().setAttribute("dest", uri + query);
	    }
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("login");
		
		if (obj == null) {
			
			saveDest(request);
			
			response.sendRedirect(request.getContextPath()+"/member/login.do");
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	

}
