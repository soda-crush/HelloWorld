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
			String oriMethod = pjp.toShortString();
			Pattern p = Pattern.compile("execution\\(.+Controller.(.+?)\\(..\\)\\)");
			Matcher m = p.matcher(oriMethod);

			String getSig =  pjp.getSignature().toString();
			Pattern p2 = Pattern.compile(".+\\((.+?)(,.*){0,100}\\)");
			Matcher m2 = p2.matcher(getSig);
			System.out.println("oriMethod : " + oriMethod);
			System.out.println("getSig : " + getSig);
			
			while(m.find()){
				while(m2.find()) {
				String sysMethod = m.group(1).toString();
				String sysFirstParam = m2.group(1).toString();
				System.out.println("sysMethod : " + sysMethod);
				System.out.println("sysFirstParam : " + sysFirstParam);
				
				if(sysFirstParam.contentEquals("String")) {
					return "redirect:../member/noMem1?result="+sysMethod;
				}else {
					Object[] paramArr = pjp.getArgs();
					int seq = Integer.parseInt(paramArr[0].toString());
					return "redirect:../member/noMem2?result="+sysMethod+"&seq="+seq;
				}
					
				}
			}
		}
		
		
		String result = "";
		try {
			result = pjp.proceed(pjp.getArgs()).toString();
		} catch (Throwable e) {
			System.out.println("엥 이거 나오면 안돼");
			e.printStackTrace();
		}
		return result;
	}
	
	
}
