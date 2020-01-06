package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
import kh.hello.dto.InquiryDTO;
import kh.hello.services.MemberInquiryService;

@Controller
@RequestMapping("/member1")
public class MemberInquiryController {
	
	@Autowired
	private MemberInquiryService ms;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/myInquiry")
	public String getMyInquiryList(String page, Model m){
		session.setAttribute("loginInfo", "글슨사람");
		String id = (String)session.getAttribute("loginInfo");
		
		int currentPage = 1;		
		if(page != null) currentPage = Integer.parseInt(page);
				
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		
		List<InquiryDTO> list = ms.getMyInquiryByPage(id, start, end);
		m.addAttribute("list", list);
		
		List<String> pageNavi = ms.getMyInquiryPageNavi(id, currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		
		return "member/inquiryList";
	}

}
