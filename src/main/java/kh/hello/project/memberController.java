package kh.hello.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.services.MemberService;

@Controller
@RequestMapping("/member")
public class memberController {
	
	@Autowired
	private MemberService ms;

	@RequestMapping("login")
	public String login(){ //로그인 폼으로 이동
		return "member/login";
	}
	
	@RequestMapping("loginProc")
	public String loginProc(String id, String pw, HttpSession session){
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
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
}
