package egovframework.example.cmmn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        try {
	        	
	        	if (request.getSession().getAttribute("ccode") == "1"){
	                    response.sendRedirect("/");
	                    return false;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return true;
	    }
}
