package kh.hello.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

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
	
}
