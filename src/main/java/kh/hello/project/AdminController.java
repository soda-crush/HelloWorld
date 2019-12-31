package kh.hello.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/adminLogin")
	public String adminLogin(String name, String password) {
		
		return "";
	}

}
