package kh.hello.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dao.MemberDAO;

@Controller
@RequestMapping("/member")
public class memberController {
	
	@Autowired
	private MemberDAO mdao;

	@RequestMapping("login")
	public String login(){ //로그인 폼으로 이동
		return "member/login";
	}
	
	@RequestMapping("loginProc")
	public String loginProc(String id, String pw){
		//mdao.login(id, pw);
		return "";
	}
	
}
