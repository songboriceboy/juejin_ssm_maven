package school.coder.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.AdminInfo;



public class AdminLoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession hsHttpSession = request.getSession();
		AdminInfo adminInfo = (AdminInfo)hsHttpSession.getAttribute("admin_info");
		
		if(adminInfo==null)
		{
			request.getRequestDispatcher("/WEB-INF/jsp/admin/login.jsp").forward(request, response);  
			return false;
		}
		else {
			return true;
		}
		
	}
	
	
	
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
