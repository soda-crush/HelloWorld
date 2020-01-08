package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.LoginInfoDTO;
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
		//session.setAttribute("loginInfo", "moon");
		//LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		
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
	public String writeIndustry(IndustryStatusDTO dto) {//섬머노트
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
	public String industryStatusModify(int seq, Model m) {
		IndustryStatusDTO result = service.industryStatusDetailView(seq);
		m.addAttribute("iPage", result);
		return "/industry/industryStatusModify";
	}

	@RequestMapping("/industryStatusModifyProc.do")
	public String industryStatusModifyConfirm(IndustryStatusDTO dto) {
		String path = session.getServletContext().getRealPath("attached");

		int result = 0;
		try {
			result = service.industryStatusModifyConfirm(dto, path);
			System.out.println(result);
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
	public String industryStatusDeleteConfirm(int seq) {
		service.industryStatusDeleteConfirm(seq);
		return "redirect:/industry/industryStatusList.do";
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
	@ResponseBody
	@RequestMapping(value="/comment/deleteProc.do",produces="text/html;charset=utf8")
	public String commentDeleteConfirm(IndustryStatusCoDTO dto) {
		return service.commentDeleteConfirm(dto);
	}

	//	//게시판 목록 검색
	//	@RequestMapping("/industrySearch.do")
	//	public String industrySearch(String search, HttpServletRequest request, Model m) {
	//		System.out.println(request.getParameter("value")+" - "+search);
	//		String value = request.getParameter("value");
	//		m.addAttribute("industryStatusList", service.industrySearch(value, search));
	//		return "/industry/industryStatusList";
	//	}
}
