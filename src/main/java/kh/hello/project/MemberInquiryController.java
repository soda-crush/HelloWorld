package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
import kh.hello.dto.InquiryDTO;
import kh.hello.dto.InquiryReplyDTO;
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
		if(page != null && page !="" && page !="null") currentPage = Integer.parseInt(page);
				
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
		
		try {
			int seq = ms.writeInquiry(path, dto);
			if(seq > 0) {//detailView 완성하면 경로 변경하기
				return "redirect:detailViewInquiry?page="+page+"&seq="+seq;
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}
	
	@RequestMapping("/detailViewInquiry")
	public String detailViewInquiry(String page, int seq, Model m) {
		//글 본문
		InquiryDTO dto = ms.getMyInquiryBySeq(seq);
		m.addAttribute("dto", dto);
		//댓글
		List<InquiryReplyDTO> list = ms.getMyInquiryCo(seq);
		m.addAttribute("list", list);
		//페이지
		m.addAttribute("page", page);
		return "member/inquiryDetailView";
	}
	
	@RequestMapping("/modifyForm")
	public String toModifyForm(String page, int seq, Model m) {
		InquiryDTO dto = ms.getMyInquiryBySeq(seq);
		m.addAttribute("dto", dto);
		m.addAttribute("page", page);
		return "member/inquiryModifyForm";
	}
	
	@RequestMapping("/modifyInquiry")
	public String modifyInquiry(String page, InquiryDTO dto) {
		String path = session.getServletContext().getRealPath("attached");
		try {
			int result = ms.modifyInquiry(path, dto);
			if(result > 0) {
				return "redirect:detailViewInquiry?page="+page+"&seq="+dto.getSeq();
			}else {
				return "redirect:../error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}
	
	@RequestMapping("/deleteInquiry")
	public String deleteInquiry(String page, int seq, Model m) {
		String path = session.getServletContext().getRealPath("attached/inquiry");
		try {
			int result = ms.deleteInquiry(path, seq);
			m.addAttribute("result", result);
			if(result == 0) {				
				m.addAttribute("seq", seq);
			}
			m.addAttribute("page", page);
			return "member/inquiryDeleteResult";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
		
	}

}
