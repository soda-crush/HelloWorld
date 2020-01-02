package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.CodeService;

@Controller
@RequestMapping("/code")
public class CodeController {
	@Autowired
	private CodeService sv;

	@Autowired
	private HttpSession session; 
	
	@RequestMapping("/codeQList.do")
	public String codeList(Model m) {
		try {
			session.setAttribute("loginInfo", "oh");
			List<CodeQuestionDTO> list = sv.selectQuestionAll();
			m.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "code/codeQList";
	}
	
	@RequestMapping("/codeQWrite.do")
	public String codeWrite() {
		return "code/codeQWrite";
	}
	
	@RequestMapping("/codeQWriteProc.do")
	public String codeWriteProc(CodeQuestionDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		try {
			sv.insertBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:codeQList.do";
	}
	
	@RequestMapping("/codeQDetail.do")
	public String codeDetail(int seq, Model m) {
		CodeQuestionDTO dResult;
		try {
			dResult = sv.detailQuestion(seq);
			m.addAttribute("dResult", dResult);
			//List<ProjectCoDTO> coResult = service.commentList(seq);  댓글
			//m.addAttribute("comments", coResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/code/codeQDetail";
	}
	
	@RequestMapping("/delete.do")
	public String delete(int seq) {
		try {
			sv.delete(seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:codeQList.do";
	}
}
