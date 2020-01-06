package kh.hello.project;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kh.hello.dto.MemberDTO;
import kh.hello.services.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	 @Autowired
	 private JavaMailSender mailSender;

	@RequestMapping("/login")
	public String loginFrm(){ //로그인 폼이동
		return "member/login";
	}
	
	@RequestMapping("/loginProc")
	public String loginProc(String id, String pw, HttpSession session){ //로그인 프로세스
			int result = ms.login(id, pw);
			if(result > 0) {
				session.setAttribute("loginInfo", id);
				return "redirect:/";
			}else {
				return "error";
			}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){ //로그아웃 프로세스
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/signUp")
	public String signUpFrm(){ //회원가입 폼이동
		return "member/signUp";
	}
	
	@RequestMapping(value = "/signUpProc")
	public String signUpProc(MemberDTO mdto, String empCheck, String empEmail, String unempEmail, 
			String empCode, String unempCode , String ifmOpenCheck, String otherJoinPath) { //회원가입 프로세스
		System.out.println(mdto);
		System.out.println("재직여부 : " + empCheck);
		System.out.println("재직자 메일 : " + empEmail);
		System.out.println("재직자 코드 : " + empCode);
		System.out.println("비재직자 메일 : " + unempEmail);
		System.out.println("비재직자 코드 : " + unempCode);
		System.out.println("기타 사유 " + otherJoinPath);
		
		return "얍";
		
	}
	
	
	@RequestMapping("/duplCheck")
	@ResponseBody
	public String duplCheck(String id) { //아이디 중복검사
			int result = ms.dupleCheck(id);
			if(result > 0) {
				JsonObject jobj = new JsonObject();
				jobj.addProperty("result", "true");
				return jobj.toString();
			}else {
				JsonObject jobj = new JsonObject();
				jobj.addProperty("result", "false");
				return jobj.toString();
			}
	}
	
	@RequestMapping("/nickDuplCheck")
	@ResponseBody
	public String nickDuplCheck(String nickName) { //닉네임 중복검사
			int result = ms.nickDupleCheck(nickName);
			if(result > 0) {
				JsonObject jobj = new JsonObject();
				jobj.addProperty("result", "true");
				return jobj.toString();
			}else {
				JsonObject jobj = new JsonObject();
				jobj.addProperty("result", "false");
				return jobj.toString();
			}
	}
	
	@RequestMapping("/phoneDuplCheck")
	@ResponseBody
	public String phoneDuplCheck(String phone) { //휴대폰 중복검사
			int result = ms.phoneDupleCheck(phone);
			if(result > 0) {
				JsonObject jobj = new JsonObject();
				jobj.addProperty("result", "true");
				return jobj.toString();
			}else {
				JsonObject jobj = new JsonObject();
				jobj.addProperty("result", "false");
				return jobj.toString();
			}
	}
	
	@RequestMapping("/mail")
	public String tmpForMail() {
		return "member/mailTest";
	}
	
	 @RequestMapping(value = "/mailSending", produces = "text/html; charset=utf-8")
	 @ResponseBody
	  public String mailSending(String email) {
		String ctfCode = "0000"; 
		 
	    String setfrom = "sohyunKH4862@gmail.com";         
	    String tomail  = email;     // 받는 사람 이메일
	    String title   = "[Hello World!] This is your verification code.";      // 제목
	    String content = "Please enter this code : ";    // 내용
	  
	    
	    	//디비에 이메일이랑 인증코드 저장
		    ms.insertCtfCode(email, ctfCode);
		 
		    try {
		    	 MimeMessage message = mailSender.createMimeMessage();
			      MimeMessageHelper messageHelper 
			                        = new MimeMessageHelper(message, true, "UTF-8");
			      
			      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			      messageHelper.setTo(tomail);     // 받는사람 이메일
			      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			      messageHelper.setText(content);  // 메일 내용
			     
			      mailSender.send(message);

				    return "send";
		    }catch(Exception e){
		    	System.out.println("메일 오류");
		    	e.printStackTrace();
		    	return "/WEB-INF/views/error.jsp";
		    }
	  }
	 
	 @RequestMapping("/ctfCodeProc")
	 @ResponseBody
	 public String ctfCodeProc(String email, String code) {
			int result =  ms.confirmCode(email, code);
			if(result > 0) {
				return "true";
			}else {
				return "false";
			}
		}
	
	 @RequestMapping("/mypage")
	 public String myPage(){
		 return "member/mypage";
	 }
	
}
