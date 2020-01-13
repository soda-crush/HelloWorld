package kh.hello.advisors;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.servlet.resource.HttpResource;

import kh.hello.dto.LoginInfoDTO;

public class MemAdvisor {
	
	@Autowired
	private HttpSession session;
	
	public Object loginCheck(ProceedingJoinPoint pjp) {
		LoginInfoDTO dto = (LoginInfoDTO)session.getAttribute("loginInfo");
		
		if(dto == null) {
			System.out.println("로그인 정보 없음");
			return "member/noMem";
		}
		
		Object result = new Object();
		try {
			result = pjp.proceed(pjp.getArgs());
		} catch (Throwable e) {
			e.printStackTrace();
			System.out.println("proceed도중 오류 발생");
		}
		
		return result;
	}
	
}
