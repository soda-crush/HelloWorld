package kh.hello.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.services.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService as;
	
	@RequestMapping("/login")
	public String login(String name, String password) {
		int result = as.validLogin(name, password);
		//로그인 정보 세션에 저장하기
		if(result > 0) {
			return "redirect:main";
		}else {
			return "redirect:loginFail";
		}
	}
	
	@RequestMapping("/loginFail")
	public String loginFail() {
		return "admin/loginFail";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "admin/main";
	}

}