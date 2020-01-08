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
import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;
import kh.hello.services.BambooService;

@Controller
@RequestMapping("/bamboo")
public class BambooController {
	@Autowired
	private HttpSession session;
	@Autowired
	private BambooService service;


	//대나무숲 게시판
	@RequestMapping("/bambooList.do")
	public String bamboolistView (String cpage, Model m) {//대나무숲 게시판목록
		session.setAttribute("loginInfo", "moon");
		//페이지네비
		int currentPage = 1;		

		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		List<BambooDTO> list = service.bambooListByPage(start, end);
		m.addAttribute("bambooList", list);

		List<String> pageNavi = service.getBambooListPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("cpage", currentPage);

		return "/bamboo/bambooList";
	}
	@RequestMapping("/bambooDetailView.do")
	public String bambooDetailView (int seq, Model m) {//대나무숲 글보기
		BambooDTO result = service.bambooDetailView(seq);
		List<BambooCoDTO> coResult = service.commentList(seq);
		m.addAttribute("bPage", result);
		m.addAttribute("comments", coResult);
		return "/bamboo/bambooDetailView";
	}

	@RequestMapping("/bambooWrite.do")
	public String bambooWrite() {
		return "/bamboo/bambooWrite";
	}

	@RequestMapping("/bambooWriteProc.do")
	public String writeBamboo(BambooDTO dto) {//섬머노트
		dto.setWriter((String)session.getAttribute("loginInfo"));
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
	public String bambooModify(int seq, Model m) {
		BambooDTO result = service.bambooDetailView(seq);
		m.addAttribute("bPage", result);
		return "/bamboo/bambooModify";
	}

	@RequestMapping("/bambooModifyProc.do")
	public String bambooModifyConfirm(BambooDTO dto) {
		System.out.println(dto.toString());
		String path = session.getServletContext().getRealPath("attached");
		
		int result = 0;
		try {
			result = service.bambooModifyConfirm(dto, path);
			System.out.println(result);
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
	public String bambooDeleteConfirm(int seq) {
		service.bambooDeleteConfirm(seq);
		return "redirect:/bamboo/bambooList.do";
	}

	//댓글

	@ResponseBody
	@RequestMapping(value="/comment/writeProc.do",produces="text/html;charset=utf8")
	public String commentWriteConfirm(BambooCoDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		return service.commentWriteConfirm(dto);
	}

	@ResponseBody
	@RequestMapping(value="/comment/modifyProc.do",produces="text/html;charset=utf8")
	public String commentModifyConfirm(BambooCoDTO dto) {
		System.out.println("댓글수정 도착 + " + dto.getSeq() + " : " + dto.getBamSeq() + " : " +dto.getContent());
		return service.commentModifyConfirm(dto);
	}
	
	@ResponseBody
	@RequestMapping("/comment/deleteProc.do")
	public String commentDeleteConfirm(BambooCoDTO dto) {
		System.out.println("delete comment       " + dto.getSeq() + " : " + dto.getBamSeq() + " : " +dto.getContent());
		service.commentDeleteConfirm(dto);
		return service.commentDeleteConfirm(dto);
	}


	//게시판 목록 검색
	@RequestMapping("/bambooSearch.do")
	public String bambooSearch(String search, HttpServletRequest request, Model m, String cpage) {
		System.out.println(request.getParameter("value")+" - "+search);
		String value = request.getParameter("value");
		//m.addAttribute("bambooList", service.bambooSearchTotalCount(value, search));


		//페이지네비
		int currentPage = 1;		

		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		List<BambooDTO> list = service.bambooSearchListByPage(start, end, value, search);
		m.addAttribute("bambooList", list);

		List<String> pageNavi = service.getBambooSearchListPageNavi(currentPage, value, search);
		m.addAttribute("pageNavi", pageNavi);

		m.addAttribute("cpage", currentPage);


		return "/bamboo/bambooList";
	}
}
