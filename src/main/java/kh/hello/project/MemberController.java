package kh.hello.project;

import java.sql.Timestamp;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.services.MemberService;
import kh.hello.utils.Utils;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService ms;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/login")
	public String loginFrm(Model m, String result, String noMemPath){ //로그인 폼이동
		if(result != null) {
			m.addAttribute("result", result);
		}
		if(noMemPath != null) {
			m.addAttribute("noMemPath", noMemPath);
		}
		return "member/login";
	}
	
	@RequestMapping("/loginProc")
	public String loginProc(String id, String pw, HttpSession session, String noMemPath){ //로그인 프로세스
			int result = ms.login(id, pw);
			if(result > 0) {
				session.setAttribute("loginInfo", new LoginInfoDTO(id, ms.selectMember(id).getNickName()));
				ms.updateLastLogin(id);
				if(noMemPath != null) {
					return "redirect:../" + noMemPath;
				}
				return "redirect:/";
			}else {
				return "redirect:login?result=false";
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
	public String signUpProc(MemberDTO mdto, String empCheck, String empEmail, String unempEmail 
			,String otherJoinPath, Timestamp birthday) { //회원가입 프로세스
		ms.signUp(mdto, empCheck, empEmail, unempEmail, otherJoinPath, birthday);
		return "redirect:signUpTemp";
	}
	
	@RequestMapping(value = "/modifyProc")
	public String signUpProc(MemberDTO mdto, String empCheck, String empEmail, String unempEmail 
			,String otherJoinPath, Timestamp birthday, String demotionMail) { //회원가입 프로세스
		ms.modify(mdto, empCheck, empEmail, unempEmail, otherJoinPath, birthday, demotionMail);
		return "redirect:modifyTemp";
	}
	
	@RequestMapping("/signUpTemp")
	public String signUpTemp() {
		return "member/signUpTemp";
	}
	
	@RequestMapping("/modifyTemp")
	public String modifyTemp() {
		return "member/modifyTemp";
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
		 try {
				String ctfCode = Utils.getRandomCode();
			    String setfrom = "sohyunKH4862@gmail.com";         
			    String tomail  = email;     // 받는 사람 이메일
			    String title   = "[Hello World!] This is your verification code.";      // 제목
			    String content = "Please enter this code : " + ctfCode;    // 내용
			  
			    
			    	//디비에 이메일이랑 인증코드 저장
				    ms.insertCtfCode(email, ctfCode);
				 
				    	 MimeMessage message = mailSender.createMimeMessage();
					      MimeMessageHelper messageHelper 
					                        = new MimeMessageHelper(message, true, "UTF-8");
					      
					      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
					      messageHelper.setTo(tomail);     // 받는사람 이메일
					      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
					      messageHelper.setText(content);  // 메일 내용
					     
					      mailSender.send(message);

						  return "send";
			}catch(Exception e) {
				e.printStackTrace();
				return "에러";
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
	 
	 @RequestMapping("/findId")
	 public String goFindIdFrm(){
		 return "member/findId";
	 }
	 
	 @RequestMapping("/findPw")
	 public String goFindPwFrm(){
		 return "member/findPw";
	 }
	 
	 @RequestMapping(value = "/idFindmailSending", produces = "text/html; charset=utf-8")
	 @ResponseBody
	  public String idFindmailSending(String name, String email) { //아이디 찾기
		 int result = ms.isEmailExist(name, email);
		 if(result > 0){
			 try {
					String ctfCode = Utils.getRandomCode();
				    String setfrom = "sohyunKH4862@gmail.com";         
				    String tomail  = email;     // 받는 사람 이메일
				    String title   = "[Hello World!] This is your verification code.";      // 제목
				    String content = "Please enter this code : " + ctfCode;    // 내용
				  
				    
				    	//디비에 이메일이랑 인증코드 저장
					    ms.insertCtfCode(email, ctfCode);
					 
					    	 MimeMessage message = mailSender.createMimeMessage();
						      MimeMessageHelper messageHelper 
						                        = new MimeMessageHelper(message, true, "UTF-8");
						      
						      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
						      messageHelper.setTo(tomail);     // 받는사람 이메일
						      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
						      messageHelper.setText(content);  // 메일 내용
						     
						      mailSender.send(message);

							  return "send";
				}catch(Exception e) {
					e.printStackTrace();
					return "에러";
				}
		 }else {
			 return "false";
		 }
	}
	 
	 @RequestMapping("/isEmailALready")
	 @ResponseBody
	 public String isEmailALready(String email) {
		 int result = ms.isEmailALready(email);
		 if(result > 0) {
			 return "true";
		 }else {
			 return "false";
		 }
	 }
	 
	
	  @RequestMapping("/showId")
	  public String showId(String email, Model m) {
		  m.addAttribute("id", ms.selectIdByEmail(email));
		  return "member/showId";
	  }
	  
	  @RequestMapping("/showPw")
	  public String showPw(String email, Model m) {
		  m.addAttribute("id", ms.selectIdByEmail(email));
		  return "member/showPw";
	  }
	  
	 @RequestMapping("/showPwMdf")
	 public String showPwMdf(String id, String pw) {
		 ms.modifyPw(id, pw);
		 return "redirect:afterFindPw";
	 }
	 
	 @RequestMapping("/afterFindPw")
	 public String afterFindPw(){
		 return "member/showPwMdf";
	 }
	 
	 @RequestMapping("/withdrawal")
	 public String withdrawalFrm() {
		 return "member/withdrawal";
	 }
	 
	 @RequestMapping(value = "/withdrawalCheck",produces="text/html;charset=utf8")
	 @ResponseBody
	 public String withdrawalCheck(String pw, HttpSession session) {
		 return ms.withdrawalCheck(((LoginInfoDTO)session.getAttribute("loginInfo")).getId(), pw);
	 }
	 
	 @RequestMapping("/modifyCheck")
	 public String toModifyCheckFrm() {
		 return "member/modifyCheck";
	 }
	
	 @RequestMapping("/modifyPwCheck")
	 @ResponseBody
		public String modifyPwCheck(String pw, HttpSession session){ 
				int result = ms.login(((LoginInfoDTO)session.getAttribute("loginInfo")).getId(), pw);
				if(result > 0) {
					return "true";
				}else {
					return "false";
				}
		}
	 
	 @RequestMapping("/modify")
	 public String toModifyFrm(Model m, HttpSession session) {
		 m.addAttribute("dto",ms.selectMember(((LoginInfoDTO)session.getAttribute("loginInfo")).getId()));
		 return "member/modify";
	 }
	 
	 @RequestMapping("/noMem")
	 public String toNoMemForm(String result, Model m) {
		 System.out.println("result : " + result);
		 m.addAttribute("noMemPath", result);
		 return "member/noMem";
	 }
	 
}
