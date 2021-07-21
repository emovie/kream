package com.project.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception {
		
		HttpSession session = request.getSession();
		ModelMap modelmap = mav.getModelMap();
		
		Object dto = modelmap.get("member");
		
		System.out.println("dto: " + dto);
		System.out.println(dto != null);
		
		if (dto != null) {
			logger.info("new login success");
			session.setAttribute(LOGIN, dto);
			response.sendRedirect("../");
		}
		
		System.out.println(session.getAttribute(LOGIN));
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		// 기존 로그인 정보 제거 
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	
	

}
