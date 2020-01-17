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


	@RequestMapping("/login")
	public String loginFrm(Model m, String result, String noMemPath, String seq){ //로그인 폼이동
		if(result != null) {
			m.addAttribute("result", result);
		}
		if(noMemPath != null) {
			m.addAttribute("noMemPath", noMemPath);
		}
		if(seq != null) {
			m.addAttribute("seq", seq);
		}
		return "member/login";
	}
	
	@RequestMapping("/loginProc")
	public String loginProc(String id, String pw, HttpSession session, String noMemPath, String seq){ //로그인 프로세스
			int result = ms.login(id, pw);
			if(result > 0) {
				LoginInfoDTO dto = new LoginInfoDTO(id, ms.selectMember(id).getNickName(), ms.selectMember(id).getMemLevel());
				session.setAttribute("loginInfo", dto);
				ms.updateLastLogin(id);
				if((seq==null)||(seq=="")){
					if(noMemPath.contentEquals("projectMainList")){
						return "redirect:../project/list";
					}else if(noMemPath.contentEquals("bamboolistView")) {
						return "redirect:../bamboo/bambooList.do";
					}else if(noMemPath.contentEquals("IndustryStatusListView")) {
						return "redirect:../industry/industryStatusList.do";
					}else if(noMemPath.contentEquals("toPlog")){
						//수정 필요
						return "redirect:../Portfolio/toPlog.do?owner="+((LoginInfoDTO)session.getAttribute("loginInfo")).getId();
					}else {
						return "redirect:/";
					}
				}else {
					if(noMemPath.contentEquals("projectDetailView")){
						return "redirect:../project/detailView?seq="+seq;
					}else if(noMemPath.contentEquals("bambooDetailView")) {
						return "redirect:../bamboo/" + noMemPath + ".do?seq="+seq;
					}else if(noMemPath.contains("industryStatusDetailView")){  
						return "redirect:../industry/" + noMemPath + ".do?seq="+seq;
					}else {
						return "redirect:/";
					}
				}
			}else {
				return "redirect:login?result=false";
			}
	}
	
	@RequestMapping("/logout")
	public String memLogout(HttpSession session){ //로그아웃 프로세스
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
	public String memModifyProc(MemberDTO mdto, String empCheck, String empEmail, String unempEmail 
			,String otherJoinPath, Timestamp birthday, String demotionMail) { 
		ms.modify(mdto, empCheck, empEmail, unempEmail, otherJoinPath, birthday, demotionMail);
		return "redirect:modifyTemp";
	}
	
	@RequestMapping("/signUpTemp")
	public String signUpTemp() {
		return "member/signUpTemp";
	}
	
	@RequestMapping("/modifyTemp")
	public String memModifyTemp() {
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
			return ms.mailSending(email);
		} catch (Exception e) {
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
	 public String memMyPage(){
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
	 public String idFindmailSending(String name, String email) {
		 return ms.idFindmailSending(name, email);
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
	 public String memWithdrawalFrm() {
		 return "member/withdrawal";
	 }
	 
	 @RequestMapping(value = "/withdrawalCheck",produces="text/html;charset=utf8")
	 @ResponseBody
	 public String memWithdrawalCheck(String pw, HttpSession session) {
		 return ms.withdrawalCheck(((LoginInfoDTO)session.getAttribute("loginInfo")).getId(), pw);
	 }
	 
	 @RequestMapping("/modifyCheck")
	 public String memToModifyCheckFrm() {
		 return "member/modifyCheck";
	 }
	
	 @RequestMapping("/modifyPwCheck")
	 @ResponseBody
		public String memModifyPwCheck(String pw, HttpSession session){ 
				int result = ms.login(((LoginInfoDTO)session.getAttribute("loginInfo")).getId(), pw);
				if(result > 0) {
					return "true";
				}else {
					return "false";
				}
		}
	 
	 @RequestMapping("/modify")
	 public String memToModifyFrm(Model m, HttpSession session) {
		 m.addAttribute("dto",ms.selectMember(((LoginInfoDTO)session.getAttribute("loginInfo")).getId()));
		 return "member/modify";
	 }
	 
	 @RequestMapping("/noMem2")
	 public String toNoMemForm1(String result, Model m, int seq) {
		 m.addAttribute("noMemPath", result);
		 m.addAttribute("seq", Integer.toString(seq));
		 return "member/noMem";
	 }
	 
	 @RequestMapping("/noMem1")
	 public String toNoMemForm2(String result, Model m) {
		 m.addAttribute("noMemPath", result);
		 return "member/noMem";
	 }
	 
	 @RequestMapping("/noMem")
	 public String toNoMemForm() {
		 return "member/noMem";
	 }
	 
	 @RequestMapping("/mLevelIs1")
	 public String mLevelIs1() {
		 return "member/memLevelIs1";
	 }
	 
	 @RequestMapping("/toMyInquiry")
	 public String toMyInquiry() {
		 return "redirect:../member1/myInquiry";
	 }
	 
}
