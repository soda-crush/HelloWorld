package kh.hello.project;

import java.util.List;

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
	public String codeList(Model m,String page) {
		try {
			//session.setAttribute("loginInfo", "oh");
			//session.setAttribute("loginInfo", "jack");
			int currentPage = 1;
			if(page != null) currentPage = Integer.parseInt(page);
			int end = currentPage * Configuration.recordCountPerPage;
			int start = end - (Configuration.recordCountPerPage - 1);
			List<CodeQuestionDTO> list = sv.selectQuestionAll(start,end);
			List<String> pageNavi = sv.getPageNavi(currentPage);
//			List<CodeQuestionDTO> listCount = sv.selectAll();
			m.addAttribute("list",list);
//			m.addAttribute("listCount",listCount);
			m.addAttribute("pageNavi",pageNavi);
			m.addAttribute("page", currentPage);
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
		//System.out.println("dto:"+ dto.getSeq());
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
	public String codeDetail(int seq, Model m,CodeReplyDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		try {
			CodeQuestionDTO qResult = sv.detailQuestion(seq); //queSeq
			List<CodeReplyDTO> rResult = sv.detailReply(seq); //queSeq
			List<CodeCommentsDTO> cResult = sv.commentList(dto.getSeq()); //reqSeq  
			int count = sv.replyOneCount(seq, dto.getWriter()); //queSeq
			
			m.addAttribute("qResult", qResult);
			m.addAttribute("rResult", rResult);
			m.addAttribute("cResult", cResult);
			m.addAttribute("count", count);
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
	
	@RequestMapping("/modify.do")
	public String codeModify(int seq, Model m) {
		CodeQuestionDTO result;
		try {
			result = sv.detailQuestion(seq);
			int parent_seq = seq;
			m.addAttribute("parent_seq",parent_seq);
			m.addAttribute("result", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/code/codeQModify";
	}
	
	@RequestMapping("/modifyProc.do")
	public String codeModifyProc(CodeQuestionDTO dto) {
		try {
			sv.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int seq = dto.getSeq();
		//return "redirect:codeQList.do";
		return "redirect:/code/codeDetail.do?seq="+seq;
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
	public String codeRWriteProc(CodeReplyDTO dto) {
		int queSeq = dto.getQueSeq();
		dto.setWriter((String)session.getAttribute("loginInfo"));
		try {
			//int queSeq = sv.selectParentSeq(parent_seq);
			String path = session.getServletContext().getRealPath("files");
			sv.insertR(dto);
			sv.imageUploadR(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/code/codeDetail.do?seq="+queSeq;
	}
	
	
//	@RequestMapping("/codeRWriteProc.do")
//	public String codeRriteProc2(CodeQuestionDTO dto) {
//		System.out.println("dto:"+ dto.getSeq());
//		dto.setWriter((String)session.getAttribute("loginInfo"));
//		try {
//			String path = session.getServletContext().getRealPath("files");
//			sv.insert(dto);
//			sv.imageUpload(dto, path);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:codeQList.do";
//	}
//	
	@RequestMapping("/deleteR.do")
	public String deleteR(int seq,int queSeq) {
		//System.out.println(seq);
		//System.out.println(queSeq);
		try {
			sv.deleteR(seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/code/codeDetail.do?seq="+queSeq;
	}
	
	@RequestMapping("/modifyR.do")
	public String codeModifyR(int seq,int queSeq, Model m) {
		try {
			CodeReplyDTO dto = sv.selectOneDetail(seq);
			int parent_seq = queSeq;
			m.addAttribute("parent_seq",parent_seq);
			m.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/code/codeRModify";
	}
	
	@RequestMapping("/modifyRProc.do")
	public String codeModifyRProc(CodeReplyDTO dto) {
		try {
			sv.modifyR(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int queSeq = dto.getQueSeq();
		return "redirect:/code/codeDetail.do?seq="+queSeq;
	}
	
	//댓글 CodeComments
	
	@ResponseBody
	@RequestMapping(value="/codeCWriteProc.do",produces="text/html;charset=utf8")
	public String insertComment(CodeCommentsDTO dto) {
		//int repSeq = parent_seq;
		System.out.println(dto.getWriter());
		System.out.println(dto.getContent());
		return sv.insertComment(dto);		
	}
	
	@ResponseBody
	@RequestMapping(value="/codeCModifyProc.do",produces="text/html;charset=utf8")
	public String updateComment(CodeCommentsDTO dto) {
		return sv.updateComment(dto);
	}
	
	@RequestMapping("/codeCDeleteProc.do")
	public String deleteComment(int seq,int repSeq) {
		sv.deleteComment(seq);
		return "redirect:/code/codeQList.do?seq="+repSeq;
	}
}
