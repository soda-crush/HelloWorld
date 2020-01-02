package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.InquiryDTO;
import kh.hello.services.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService as;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/login")
	public String login(String name, String password) {
		int result = as.validLogin(name, password);
		if(result > 0) {
			session.setAttribute("loginInfo", name);
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
	
	@RequestMapping("/modifyForm")
	public String modifyForm() {
		return "admin/modifyForm";
	}
	
	@RequestMapping("/modifyInfo")
	public String modifyInfo(String password, String email, HttpServletRequest request) {
		String adminId = (String)session.getAttribute("loginInfo");
		int result = as.modifyInfo(adminId, password, email);
		if(result > 0) {
			request.setAttribute("result", true);
		}else {
			request.setAttribute("result", false);
		}
		return "admin/modifyResult";
	}
	
	@RequestMapping("/inquiryList")
	public String inquiryList(String page, Model m) {
		int currentPage = 1;		
		
		if(page != null) currentPage = Integer.parseInt(page);
		
		if(currentPage > 0 && currentPage <= Configuration.naviCountPerPage) {
			m.addAttribute("currentPage", currentPage);
		}else if(currentPage % Configuration.naviCountPerPage == 0) {
			m.addAttribute("currentPage", Configuration.naviCountPerPage + 1);
		}else {
			m.addAttribute("currentPage", (currentPage % Configuration.naviCountPerPage + 1));
		}
		
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		
		List<InquiryDTO> list = as.selectInquiryByPage(start, end);
		m.addAttribute("list", list);
		
		List<String> pageNavi = as.getInquiryPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		return "admin/inquiryList";
	}
	
	@RequestMapping("/inquiryDetailView")
	public String inquiryDetailView(int seq, Model m) {
		InquiryDTO dto = as.inquiryDetailView(seq);
		m.addAttribute("dto", dto);
		return "admin/inquiryDetailView";
	}
	


}





