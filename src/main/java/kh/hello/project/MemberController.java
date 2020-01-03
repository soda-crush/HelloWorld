package kh.hello.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

	@RequestMapping("/login")
	public String loginFrm(){ //로그인 폼이동
		return "member/login";
	}
	
	@RequestMapping("/loginProc")
	public String loginProc(String id, String pw, HttpSession session){ //로그인 프로세스
		try {
			int result = ms.login(id, pw);
			if(result > 0) {
				session.setAttribute("loginInfo", id);
				return "redirect:/";
			}else {
				return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
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
		try {
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
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/nickDuplCheck")
	@ResponseBody
	public String nickDuplCheck(String nickName) { //닉네임 중복검사
		try {
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
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/phoneDuplCheck")
	@ResponseBody
	public String phoneDuplCheck(String phone) { //휴대폰 중복검사
		try {
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
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/tmp")
	public String tmpForMail() {
		return "mailTest";
	}
	
	
}
