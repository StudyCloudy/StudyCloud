package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("+ + + AdminInterceptor + + +");
		
		//세션 객체
		HttpSession session = request.getSession();
		
		if( session.getAttribute("login") == null ||
				(int)session.getAttribute("authority") != 4 ) { //비로그인 상태, 관리자 등급이 아니면 접근 불가
			logger.info(" >> 접속 불가");
			
			response.sendRedirect("/login/admin");
		
			return false; //컨트롤러 접근 금지
		}
		
		logger.info(" >> 정상적인 접근 : 로그인 상태");
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}
