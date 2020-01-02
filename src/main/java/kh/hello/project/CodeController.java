package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.CodeQuestionDTO;
import kh.hello.services.CodeService;

@Controller
@RequestMapping("/code")
public class CodeController {
	@Autowired
	private CodeService sv;

	@Autowired
	private HttpSession session; 
	
	@RequestMapping("/codeList.do")
	public String codeList(Model m) {
		try {
			List<CodeQuestionDTO> list = sv.selectQuestionAll();
			m.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "code/codeQuestionList";
	}
	
	@RequestMapping("/codeWrite.do")
	public String codeWrite() {
		return "code/codeWrite";
	}
	
	@RequestMapping("/codeWriteProc.do")
	public String codeWriteProc(CodeQuestionDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		try {
			sv.insertBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "code/codeWrite";
	}
}
