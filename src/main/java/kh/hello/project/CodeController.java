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
import kh.hello.dto.CodeCommentsDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;
import kh.hello.dto.ProjectCoDTO;
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
	public String codeList(Model m,HttpServletRequest request) {
		try {
			String page = request.getParameter("cpage");
			session.setAttribute("loginInfo", "oh");
			int cpage = 1;
			if(page != null) {
				cpage = Integer.parseInt(page);
			}
			int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
			int end = cpage * Configuration.recordCountPerPage;
			List<CodeQuestionDTO> list = sv.selectQuestionAll(start,end);
			String pageNavi = sv.pageNavi(page,start,end);
			m.addAttribute("list",list);
			m.addAttribute("pageNavi",pageNavi);
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
		try {
			CodeQuestionDTO qResult = sv.detailQuestion(seq);
			List<CodeReplyDTO> rResult = sv.detailReply(seq);
			List<CodeCommentsDTO> cResult = sv.commentList(seq);
			
			m.addAttribute("qResult", qResult);
			m.addAttribute("rResult", rResult);
			m.addAttribute("cResult", cResult);
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
	
	//댓글 CodeReply
	@ResponseBody
	@RequestMapping(value="/comment/writeProc",produces="text/html;charset=utf8")
	public String insertComment(CodeCommentsDTO dto) {
		return sv.insertComment(dto);		
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/modifyProc",produces="text/html;charset=utf8")
	public String updateComment(CodeCommentsDTO dto) {
		return sv.updateComment(dto);
	}
	
	@RequestMapping("/comment/deleteProc")
	public void deleteComment(int seq) {
		sv.deleteComment(seq);
	}
}
