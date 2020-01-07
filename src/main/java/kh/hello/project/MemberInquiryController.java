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
		//나중에 지우기
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
	
	@RequestMapping("/toInquiryForm")
	public String toInquiryForm(String page, Model m) {
		m.addAttribute("page", page);
		return "member/inquiryForm";
	}
	
	@RequestMapping("/writeInquiry")
	public String writeInquiry(String page, InquiryDTO dto) {
		//나중에 지우기
		session.setAttribute("loginInfo", "글슨사람");
		String id = (String)session.getAttribute("loginInfo");
		dto.setWriter(id);		
		String path = session.getServletContext().getRealPath("attached");
		
		int result = 0;
		try {
			result = ms.writeInquiry(path, dto);
			if(result > 0) {//detailView 완성하면 경로 변경하기
				return "redirect:myInquiry";
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}

	}

}
