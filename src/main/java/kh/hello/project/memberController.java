package kh.hello.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class memberController {

	@RequestMapping("login")
	public String login(){
		return "member/login";
	}
	
}
