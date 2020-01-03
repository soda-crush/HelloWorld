package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/bamboolist.do")
	public String bamboolistView (Model m) {//대나무숲 게시판목록
		session.setAttribute("loginInfo", "moon");
		List<BambooDTO> list = service.bambooList();
		
		m.addAttribute("bambooList", list);
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
	public String bambooWriteConfirm(BambooDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		int seq = service.bambooWriteConfirm(dto);
		return "redirect:/bamboo/bamboolist.do";
	}
	
	@RequestMapping("/bambooModify.do")
	public String bambooModify(int seq, Model m) {
		BambooDTO result = service.bambooDetailView(seq);
		m.addAttribute("bambooPage", result);
		return "/bamboo/bambooModify";
	}
	
	@RequestMapping("/bambooModifyProc.do")
	public String bambooModifyConfirm(BambooDTO dto) {
		service.bambooModifyConfirm(dto);
		int seq = dto.getSeq();
		return "redirect:/bamboo/bambooDetailView?seq="+seq;
	}
	
	@RequestMapping("/bambooDeleteProc.do")
	public String bambooDeleteConfirm(int seq) {
		service.bambooDeleteConfirm(seq);
		return "redirect:/bamboo/bambooList";
	}
	
	//댓글
	
	@ResponseBody
	@RequestMapping(value="/comment/writeProc.do",produces="text/html;charset=utf8")
	public String commentWriteConfirm(BambooCoDTO dto) {
		return 	service.commentWriteConfirm(dto);
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/modifyProc.do",produces="text/html;charset=utf8")
	public String commentModifyConfirm(BambooCoDTO dto) {
		return service.commentModifyConfirm(dto);
	}
	
	@RequestMapping("/comment/deleteProc.do")
	public String commentDeleteConfirm(int bamSeq,int seq) {
		System.out.println(bamSeq);
		service.commentDeleteConfirm(seq);
		return "redirect:/bamboo/bambooDetailView.do?seq="+bamSeq;
	}
}
