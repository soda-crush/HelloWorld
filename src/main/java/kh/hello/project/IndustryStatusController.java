package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.services.IndustryStatusService;

@Controller
@RequestMapping("/industry")
public class IndustryStatusController {
	@Autowired
	private HttpSession session;
	@Autowired
	private IndustryStatusService service;
	
	//대나무숲 게시판
	@RequestMapping("/industryStatusList.do")
	public String IndustryStatusListView (String cpage, Model m) {//업계현황 게시판목록
		session.setAttribute("loginInfo", "moon");
		//List<IndustryStatusDTO> list = service.industryStatusList();
		
		//페이지네비
				int currentPage = 1;		

				if(cpage != null) currentPage = Integer.parseInt(cpage);

				int end = currentPage * Configuration.recordCountPerPage;
				int start = end - (Configuration.recordCountPerPage - 1);	

				List<IndustryStatusDTO> list = service.industryListByPage(start, end);
				m.addAttribute("industryStatusList", list);

				List<String> pageNavi = service.getIndustryListPageNavi(currentPage);
				m.addAttribute("pageNavi", pageNavi);

				m.addAttribute("cpage", currentPage);
		
		//m.addAttribute("industryStatusList", list);
		return "/industry/industryStatusList";
	}
	@RequestMapping("/industryStatusDetailView.do")
	public String industryStatusDetailView (int seq, Model m) {//업계현황 글보기
		IndustryStatusDTO result = service.industryStatusDetailView(seq);
		List<IndustryStatusCoDTO> coResult = service.commentList(seq);
		m.addAttribute("iPage", result);
		m.addAttribute("comments", coResult);
		return "/industry/industryStatusDetailView";
	}
	
	@RequestMapping("/industryStatusWrite.do")
	public String industryStatusWrite() {
		return "/industry/industryStatusWrite";
	}
	
	@RequestMapping("/industryStatusWriteProc.do")
	public String industryStatusWriteConfirm(IndustryStatusDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		int seq = service.industryStatusWriteConfirm(dto);
		return "redirect:/industry/industryStatusList.do";
	}
	
	@RequestMapping("/industryStatusModify.do")
	public String industryStatusModify(int seq, Model m) {
		IndustryStatusDTO result = service.industryStatusDetailView(seq);
		m.addAttribute("industryPage", result);
		return "/industry/industryStatusModify";
	}
	
	@RequestMapping("/industryStatusModifyProc.do")
	public String industryStatusModifyConfirm(IndustryStatusDTO dto) {
		service.industryStatusModifyConfirm(dto);
		int seq = dto.getSeq();
		return "redirect:/industry/industryStatusDetailView?seq="+seq;
	}
	
	@RequestMapping("/industryStatusDeleteProc.do")
	public String industryStatusDeleteConfirm(int seq) {
		service.industryStatusDeleteConfirm(seq);
		return "redirect:/industry/industryList";
	}
	
	//댓글
	
	@ResponseBody
	@RequestMapping(value="/comment/writeProc.do",produces="text/html;charset=utf8")
	public String commentWriteConfirm(IndustryStatusCoDTO dto) {
		return service.commentWriteConfirm(dto);		
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/modifyProc.do",produces="text/html;charset=utf8")
	public String commentModifyConfirm(IndustryStatusCoDTO dto) {
		return service.commentModifyConfirm(dto);
	}
	
	@RequestMapping("/comment/deleteProc.do")
	public String commentDeleteConfirm(int indSeq,int seq) {
		service.commentDeleteConfirm(seq);
		return "redirect:/industry/industryStatusDetailView.do?seq="+indSeq;
	}
	
}
