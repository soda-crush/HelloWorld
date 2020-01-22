package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.services.BambooService;
import kh.hello.utils.Utils;

@Controller
@RequestMapping("/bamboo")
public class BambooMemController {
	@Autowired
	private HttpSession session;
	@Autowired
	private BambooService service;


	//대나무숲 게시판
	@RequestMapping("/bambooList.do")
	public String bamboolistView (String page, Model m) {//대나무숲 게시판목록
		//페이지네비
		int currentPage = 1;		
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		List<BambooDTO> list = service.bambooListByPage(start, end);
		m.addAttribute("bambooList", list);

		List<String> pageNavi = service.getBambooListPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("page", currentPage);

		return "/bamboo/bambooList";
	}
	@RequestMapping("/bambooDetailView.do")
	public String bambooDetailView (int seq, Model m) {//대나무숲 글보기
		BambooDTO result = service.bambooDetailView(seq);
		if(result == null) {
			return "/bamboo/bambooDetailView";
		}
		List<BambooCoDTO> coResult = service.commentList(seq);
		String ip = Configuration.ip;
		m.addAttribute("bPage", result);
		m.addAttribute("comments", coResult);
		m.addAttribute("ip",ip);
		m.addAttribute("ad",Utils.getRandomNum(0, 8));
		return "/bamboo/bambooDetailView";
	}

	@RequestMapping("/bambooWrite.do")
	public String writeFormBamboo() {
		return "/bamboo/bambooWrite";
	}

	//글쓰기 누를 때 실무자 유무 검사
	@ResponseBody
	@RequestMapping(value="/memLevel.do",produces="text/html;charset=utf8")
	public String getMemLevel(String id) {	
		return Integer.toString(service.getMemLevel(id));
	}

	@RequestMapping("/bambooWriteProc.do")
	public String writeProcBamboo(BambooDTO dto) {//섬머노트
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(loginInfo.getId());
		dto.setTitle(Utils.protectXss(dto.getTitle()));
		String path = session.getServletContext().getRealPath("attached");
		int result = 0;
		try {
			result = service.writeBamboo(path, dto);
			if(result > 0) {
				return "redirect:/bamboo/bambooList.do";
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}

	@RequestMapping("/bambooModify.do")
	public String modifyFormBamboo(int seq, Model m) {
		BambooDTO result = service.bambooDetailView(seq);
		m.addAttribute("bPage", result);
		return "/bamboo/bambooModify";
	}

	@RequestMapping("/bambooModifyProc.do")
	public String modifyProcBamboo(BambooDTO dto) {
		String path = session.getServletContext().getRealPath("attached");
		dto.setTitle(Utils.protectXss(dto.getTitle()));
		int result = 0;
		try {
			result = service.bambooModifyConfirm(dto, path);
			if(result > 0) {
				int seq = dto.getSeq();
				return "redirect:/bamboo/bambooDetailView.do?seq="+seq;
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}

	@RequestMapping("/bambooDeleteProc.do")
	public String deleteProcBamboo(int seq) {
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		int result = 0;
		try {
			result = service.bambooDeleteConfirm(seq,loginInfo.getId());		
			if(result > 0) {
				return "redirect:/bamboo/bambooList.do";
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}

	//댓글

	@ResponseBody
	@RequestMapping(value="/comment/writeProc.do",produces="text/html;charset=utf8")
	public String coWriteProc(BambooCoDTO dto) {
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(loginInfo.getId());
		dto.setContent(Utils.protectXss(dto.getContent()));
		return service.commentWriteConfirm(dto,dto.getWriter());
	}

	@ResponseBody
	@RequestMapping(value="/comment/modifyProc.do",produces="text/html;charset=utf8")
	public String coMdfProc(BambooCoDTO dto) {
		dto.setContent(Utils.protectXss(dto.getContent()));
		return service.commentModifyConfirm(dto);
	}

	@ResponseBody
	@RequestMapping(value="/comment/deleteProc.do",produces="text/html;charset=utf8")
	public String coDelProc(BambooCoDTO dto) {
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(loginInfo.getId());
		return service.commentDeleteConfirm(dto,dto.getWriter());
	}

	//게시판 목록 검색
	@RequestMapping("/bambooSearch.do")
	public String bambooSearch(String search, String value, Model m, String page) {
		//페이지네비
		int currentPage = 1;		

		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		List<BambooDTO> list = service.bambooSearchListByPage(start, end, value, search);
		m.addAttribute("bambooList", list);

		List<String> pageNavi = service.getBambooSearchListPageNavi(currentPage, value, search);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("page", currentPage);

		return "/bamboo/bambooList";
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
	public String reportBamboo(ReportDTO dto) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setReporterID(sessionValue.getId());
		dto.setReporterNick(sessionValue.getNickName());
		dto.setReason(Utils.protectXss(dto.getReason()));
		dto.setTitle(Utils.protectXss(dto.getTitle()));
		int result = service.reportProject(dto);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";
		}
	}
}
