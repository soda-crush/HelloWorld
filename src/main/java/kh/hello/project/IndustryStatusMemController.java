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
import kh.hello.dto.BambooDTO;
import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.dto.ScrapDTO;
import kh.hello.services.IndustryStatusService;

@Controller
@RequestMapping("/industry")
public class IndustryStatusMemController {
	@Autowired
	private HttpSession session;
	@Autowired
	private IndustryStatusService service;

	//대나무숲 게시판
	@RequestMapping("/industryStatusList.do")
	public String IndustryStatusListView (String page, Model m) {//업계현황 게시판목록
		//페이지네비
		int currentPage = 1;		

		if(page != null) currentPage = Integer.parseInt(page);

		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	

		List<IndustryStatusDTO> list = service.industryListByPage(start, end);
		m.addAttribute("industryStatusList", list);

		List<String> pageNavi = service.getIndustryListPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("page", currentPage);

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
	public String writeFormIndustryStatus() {
		return "/industry/industryStatusWrite";
	}

	//글쓰기 누를 때 실무자 유무 검사
	@ResponseBody
	@RequestMapping(value="/memLevel.do",produces="text/html;charset=utf8")
	public String getMemLevel(IndustryStatusDTO dto) {	
		System.out.println(Integer.toString(service.getMemLevel(dto.getId())));
		return Integer.toString(service.getMemLevel(dto.getId()));
	}

	@RequestMapping("/industryStatusWriteProc.do")
	public String writeProcIndustryStatus(IndustryStatusDTO dto) {//섬머노트
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(loginInfo.getNickName());
		dto.setId(loginInfo.getId());
		String path = session.getServletContext().getRealPath("attached");
		int result = 0;
		try {
			result = service.writeIndustry(path, dto);
			if(result > 0) {
				return "redirect:/industry/industryStatusList.do";
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}

	@RequestMapping("/industryStatusModify.do")
	public String modifyFormIndustryStatus(int seq, Model m) {
		IndustryStatusDTO result = service.industryStatusDetailView(seq);
		m.addAttribute("iPage", result);
		return "/industry/industryStatusModify";
	}

	@RequestMapping("/industryStatusModifyProc.do")
	public String modifyProcIndustryStatus(IndustryStatusDTO dto) {
		String path = session.getServletContext().getRealPath("attached");

		int result = 0;
		try {
			result = service.industryStatusModifyConfirm(dto, path);
			if(result > 0) {
				int seq = dto.getSeq();
				return "redirect:/industry/industryStatusDetailView.do?seq="+seq;
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}

	@RequestMapping("/industryStatusDeleteProc.do")
	public String deleteProcIndustryStatus(int seq) {
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		service.industryStatusDeleteConfirm(seq, loginInfo.getId());
		return "redirect:/industry/industryStatusList.do";
	}

	//댓글

	@ResponseBody
	@RequestMapping(value="/comment/writeProc.do",produces="text/html;charset=utf8")
	public String coWriteProc(IndustryStatusCoDTO dto) {
		return service.commentWriteConfirm(dto);		
	}

	@ResponseBody
	@RequestMapping(value="/comment/modifyProc.do",produces="text/html;charset=utf8")
	public String coMdfProc(IndustryStatusCoDTO dto) {
		return service.commentModifyConfirm(dto);
	}
	@ResponseBody
	@RequestMapping(value="/comment/deleteProc.do",produces="text/html;charset=utf8")
	public String coDelProc(IndustryStatusCoDTO dto) {
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setId(loginInfo.getId());
		return service.commentDeleteConfirm(dto);
	}

	//게시판 목록 검색
	@RequestMapping("/industrySearch.do")
	public String industrySearch(String search, String value, Model m, String page) {
		//검색결과 페이지 네비
		int currentPage = 1;		

		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		List<IndustryStatusDTO> list = service.industrySearchListByPage(start, end, value, search);
		m.addAttribute("industryStatusList", list);

		List<String> pageNavi = service.getIndustrySearchListPageNavi(currentPage, value, search);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("page", currentPage);

		return "/industry/industryStatusList";
	}

	//스크랩
	@RequestMapping("/scrap.do")
	@ResponseBody
	public String scrap(ScrapDTO dto, HttpSession session) {
		dto.setId(((LoginInfoDTO)session.getAttribute("loginInfo")).getId());
		return service.scrap(dto);
	}

//	게시글신고
	
	@ResponseBody
	@RequestMapping("/reportDuplCheck.do")
	public String reportDuplCheck(int seq) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();
		int result = service.reportDuplCheck(id, seq);
		if(result>0) {
			return "dupl";
		}else {
			return "possible";
		}
	}
	
	@ResponseBody
	@RequestMapping("/report.do")
	public String reportProject(ReportDTO dto) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setReporterID(sessionValue.getId());
		dto.setReporterNick(sessionValue.getNickName());		
		int result = service.reportProject(dto);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";
		}
	}
}
