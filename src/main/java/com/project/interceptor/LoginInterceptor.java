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
		String redirectUrl = " ";
		Object dto = modelmap.get("member");
		
		System.out.println("dto: " + dto);
		System.out.println(dto != null);
		
		if (dto != null) {
			logger.info("new login success");
			session.setAttribute(LOGIN, dto);
			
			redirectUrl = (String) session.getAttribute("prevPage");
			System.out.println("리다이렉트 주소 : "+redirectUrl);
			
			if (redirectUrl == null || redirectUrl.contains("loginPost"))  {
				response.sendRedirect("../");
				System.out.println("메인으로 이동");
				
			}
			else {				
				response.sendRedirect(redirectUrl);
				System.out.println("전 주소로 이동");
			}
				
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
