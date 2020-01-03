package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;
import kh.hello.services.CodeService;

@Controller
@RequestMapping("/code")
public class CodeController {
	@Autowired
	private CodeService sv;

	@Autowired
	private HttpSession session; 
	
	//질문 CodeQuestion
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
			String path = session.getServletContext().getRealPath("files");
			sv.insert(dto);
			sv.imageUpload(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:codeQList.do";
	}
	
	@RequestMapping("/codeDetail.do")
	public String codeDetail(int seq, Model m) {
		CodeQuestionDTO qResult;
		List<CodeReplyDTO> rResult;
		try {
			qResult = sv.detailQuestion(seq);
			rResult = sv.detailReply(seq);
			m.addAttribute("qResult", qResult);
			m.addAttribute("rResult", rResult);
			//List<ProjectCoDTO> coResult = service.commentList(seq);  댓글
			//m.addAttribute("comments", coResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/code/codeDetail";
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
	
	//답글 CodeReply
//	@RequestMapping("/codeQList.do") List도 transaction걸어야함.
//	public String selectReplyAll(Model m) {
//		try {
//			session.setAttribute("loginInfo", "oh");
//			List<CodeReplyDTO> list = sv.selectReplyAll();
//			m.addAttribute("list",list);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "code/codeQList";
//	}
	
	@RequestMapping("/codeRWrite.do")
	public String codeRWrite(int seq,Model m) {
		int parent_seq = seq;
		m.addAttribute("parent_seq",parent_seq);
		return "code/codeRWrite";
	}
	
	@RequestMapping("/codeRWriteProc.do")
	public String codeRWriteProc(CodeReplyDTO dto,CodeQuestionDTO Qdto,int parent_seq) {
		int queSeq = parent_seq;
		dto.setQueSeq(queSeq);
		dto.setWriter((String)session.getAttribute("loginInfo"));
		try {
			//int queSeq = sv.selectParentSeq(parent_seq);
			String path = session.getServletContext().getRealPath("files");
			sv.insertR(dto);
			sv.imageUploadR(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:codeDetail.do";
	}
	
	@RequestMapping("/deleteR.do")
	public String deleteR(int seq) {
		try {
			sv.deleteR(seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:codeDetail.do";
	}
}
