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
import kh.hello.dto.LoginInfoDTO;
import kh.hello.services.MemberInquiryService;

@Controller
@RequestMapping("/member1")
public class InquiryMemController {
	
	@Autowired
	private MemberInquiryService ms;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/myInquiry")
	public String getMyInquiryList(String page, Model m){

		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = loginInfo.getId();

		int currentPage = 1;		
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
				
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
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		
		String nickName = loginInfo.getNickName();
		String id = loginInfo.getId();
		//
		dto.setWriter(nickName);		
		dto.setWriterID(id);
		String path = session.getServletContext().getRealPath("attached");
		
		try {
			int seq = ms.writeInquiry(path, dto);
			if(seq > 0) {
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
		
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
				
		String nickName = loginInfo.getNickName();
		dto.setWriter(nickName);
		
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
