package kh.hello.advisors;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

public class AdminAdvisor {

	@Autowired
	private HttpSession session;
	
	public Object loginCheck(ProceedingJoinPoint jp) {
		String id = (String)session.getAttribute("AdminInfo");
		Object result = null;
		if(id == null) {
			return "redirect:../needLogin";
		}else {
			try {
				result = jp.proceed(jp.getArgs());
				if(result!=null) result = result.toString();
				return result;
			} catch (Throwable e) {
				e.printStackTrace();
				return "redirect:../manage";
			}
			
		}
	}
}
