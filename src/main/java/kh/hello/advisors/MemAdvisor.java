package kh.hello.advisors;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import kh.hello.dto.LoginInfoDTO;

public class MemAdvisor {
	
	@Autowired
	private HttpSession session;
	
	public String loginCheck(ProceedingJoinPoint pjp) {
		LoginInfoDTO dto = (LoginInfoDTO)session.getAttribute("loginInfo");

		
		if(dto == null) {
			
			System.out.println("advisor : " + pjp.getSignature());
			Object[] paramArr = pjp.getArgs();
			System.out.println("매개변수 : " + paramArr[0]);
			String oriMethod = pjp.toShortString();
			Pattern p = Pattern.compile("execution\\(.+Controller.(.+)\\(..\\)\\)");
			Matcher m = p.matcher(oriMethod);
			while(m.find()){
				return "redirect:../member/noMem?result="+m.group(1);
			}
		}
		String result = "";
		try {
			result = pjp.proceed(pjp.getArgs()).toString();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
