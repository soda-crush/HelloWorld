package kh.hello.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.BambooDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.HomeService;

@Controller
public class HomeController {
	
	@Autowired
	private HomeService hs;
	
	@RequestMapping("/")
	public String home(Model m) {
		List<BambooDTO> bamList = hs.getBamList();
		List<CodeQuestionDTO> codeList = hs.getCodeList();
		List<IndustryStatusDTO> indusList = hs.getIndusList();
		List<ItnewsDTO> itList = hs.getItList();
		
		m.addAttribute("bamList", bamList);
		m.addAttribute("codeList", codeList);
		m.addAttribute("indusList", indusList);
		m.addAttribute("itList", itList);
		
		List<ProjectDTO> proList = hs.getProList();
		m.addAttribute("proList", proList);
		
		return "home";
	}
	
	@RequestMapping("/manage")
	public String adminHome() {
		return "admin/loginForm";
	}
	
	@RequestMapping("/error")
	public String error() {
		return "error";
	}
	
	@RequestMapping("/needLogin")
	public String adminNeedLogin() {
		return "admin/needLogin";
	}
		
	
	
}

