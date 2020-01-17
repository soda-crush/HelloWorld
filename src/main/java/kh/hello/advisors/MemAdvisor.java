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
			
			while(m.find()){
				while(m2.find()) {
				String sysMethod = m.group(1).toString();
				String sysFirstParam = m2.group(1).toString();
				
				if(sysFirstParam.contentEquals("String")) {
					return "redirect:../member/noMem1?result="+sysMethod;
				}else if(sysFirstParam.contentEquals("int")){
					Object[] paramArr = pjp.getArgs();
					int seq = Integer.parseInt(paramArr[0].toString());
					return "redirect:../member/noMem2?result="+sysMethod+"&seq="+seq;
				}
					
				}
			}
			return "redirect:../member/noMem";
		}
		
		
		String result = "";
		try {
			Object objresult = pjp.proceed(pjp.getArgs());
			if(objresult!=null)
				result = objresult.toString();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public String memLevelCheck(ProceedingJoinPoint pjp) {
		LoginInfoDTO dto = (LoginInfoDTO)session.getAttribute("loginInfo");
		
		if(dto.getMemLevel()==1) {
			return "redirect:../member/mLevelIs1";
		}
		
		String result = "";
		try {
			Object objresult = pjp.proceed(pjp.getArgs());
			if(objresult!=null)
				result = objresult.toString();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
