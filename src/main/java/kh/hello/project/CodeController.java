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
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.ScrapDTO;
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
			//LoginInfoDTO dto = new LoginInfoDTO("test","닉네임");		
			//LoginInfoDTO dto = new LoginInfoDTO("test2","닉네임2");	
			//LoginInfoDTO dto = new LoginInfoDTO("test3","닉네임3");	
			
			//session.setAttribute("loginInfo", dto);

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
		return "code/codeQList";
	}
	
	@RequestMapping("/codeQWrite.do")
	public String codeWrite() {
		return "code/codeQWrite";
	}
	
	
//	public String codeWriteProc(CodeQuestionDTO dto,String id) { //섬머노트
//		//System.out.println("dto:"+ dto.getSeq());
//			dto.setWriter((String)session.getAttribute("loginInfo"));
//			String path = session.getServletContext().getRealPath("files");
//			sv.insert(dto,(String)session.getAttribute("loginInfo"));
//		try {
//			sv.imageUpload(dto, path);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:codeQList.do";
//	}
	@RequestMapping("/codeQWriteProc.do")
	public String codeWriteProc(CodeQuestionDTO dto) {//섬머노트
		LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setId(info.getId());
		dto.setWriter(info.getNickName());
		String path = session.getServletContext().getRealPath("attached");
		int result = 0;
		try {
			result = sv.writeCode(path, dto,dto.getId());
			if(result > 0) {
				return "redirect:codeQList.do";
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}
	
	@RequestMapping("/codeDetail.do")
	public String codeDetail(int seq, Model m) {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			CodeQuestionDTO qResult = sv.detailQuestion(seq); 
			List<CodeReplyDTO> rResult = sv.detailReply(seq);
			List<CodeCommentsDTO> cResult = sv.commentList(seq);   
			int count = sv.replyOneCount(seq, info.getId()); //queSeq
			int repSeq = sv.selectRepSeq(seq,info.getId());
			int repCount = sv.replyCount(seq); //답글 수 
//			int nowPoint = sv.selectPoint(info.getId());
			
			m.addAttribute("qResult", qResult);
			m.addAttribute("rResult", rResult);			
			m.addAttribute("cResult", cResult);
			m.addAttribute("count", count);
			m.addAttribute("repSeq", repSeq);
			m.addAttribute("repCount", repCount);
//			m.addAttribute("nowPoint", nowPoint);
		return "/code/codeDetail";
	}
	
	@RequestMapping("/delete.do")
	public String delete(int seq,String id) {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			sv.delete(seq,info.getId());
		return "redirect:codeQList.do";
	}
	
	@RequestMapping("/modify.do")
	public String codeModify(int seq, Model m) {
		CodeQuestionDTO result;
			result = sv.detailQuestion(seq);
			int parent_seq = seq;
			m.addAttribute("parent_seq",parent_seq);
			m.addAttribute("result", result);
		return "/code/codeQModify";
	}
	
	@RequestMapping("/modifyProc.do")
	public String codeModifyProc(CodeQuestionDTO dto) {
			sv.modify(dto);
		int seq = dto.getSeq();
		//return "redirect:codeQList.do";
		return "redirect:/code/codeDetail.do?seq="+seq;
	}
	
	//게시판 목록 검색
	@RequestMapping("/codeSearch.do")
	public String codeSearch(String search, HttpServletRequest request, Model m, String cpage) {
		//System.out.println(request.getParameter("value")+" - "+search);
		String value = request.getParameter("value");
		//m.addAttribute("bambooList", service.bambooSearchTotalCount(value, search));

		//페이지네비
		int currentPage = 1;		
		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		List<CodeQuestionDTO> list = sv.codeSearchByPage(start, end, value, search);
		List<String> pageNavi = sv.getCodeSearchListPageNavi(currentPage, value, search);
		m.addAttribute("list",list);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("page", currentPage);
		
		return "/code/codeQList";
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
	
//	@RequestMapping("/codeRWriteProc.do")
//	public String codeRWriteProc(CodeReplyDTO dto) {
//			int queSeq = dto.getQueSeq();
//			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
//			dto.setId(info.getId());
//			dto.setWriter(info.getNickName());
//
//			//int queSeq = sv.selectParentSeq(parent_seq);
//			String path = session.getServletContext().getRealPath("files");
//			sv.insertR(dto);
//		try {
//			sv.imageUploadR(dto, path);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/code/codeDetail.do?seq="+queSeq;
//	}
	
	@RequestMapping("/codeRWriteProc.do")
	public String codeRWriteProc(CodeReplyDTO dto) {//섬머노트
		LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setId(info.getId());
		dto.setWriter(info.getNickName());
		int queSeq = dto.getQueSeq();
		String path = session.getServletContext().getRealPath("attached");
		int result = 0;
		try {
			result = sv.writeCodeR(path, dto,dto.getId());
			if(result > 0) {
				return "redirect:/code/codeDetail.do?seq="+queSeq;
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
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
		LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = info.getId();
		//System.out.println(seq);
		//System.out.println(queSeq);
			sv.deleteR(seq,id);
		return "redirect:/code/codeDetail.do?seq="+queSeq;
	}
	
	@RequestMapping("/modifyR.do")
	public String codeModifyR(int seq,int queSeq, Model m) {
			CodeReplyDTO dto = sv.selectOneDetail(seq);
			int parent_seq = queSeq;
			m.addAttribute("parent_seq",parent_seq);
			m.addAttribute("dto", dto);
		return "/code/codeRModify";
	}
	
	@RequestMapping("/modifyRProc.do")
	public String codeModifyRProc(CodeReplyDTO dto) {
			sv.modifyR(dto);
		int queSeq = dto.getQueSeq();
		return "redirect:/code/codeDetail.do?seq="+queSeq;
	}
	
	//댓글 CodeComments
	
	@ResponseBody
	@RequestMapping(value="/codeCWriteProc.do",produces="text/html;charset=utf8")
	public String insertComment(CodeCommentsDTO dto) {
		LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setId(info.getId());
		dto.setWriter(info.getNickName());
		return sv.insertComment(dto);		
	}
	
	@ResponseBody
	@RequestMapping(value="/codeCModifyProc.do",produces="text/html;charset=utf8")
	public String updateComment(CodeCommentsDTO dto) {
		return sv.updateComment(dto);
	}
	
	@ResponseBody
	@RequestMapping(value="/codeCDeleteProc.do",produces="text/html;charset=utf8")
	public String deleteComment(CodeCommentsDTO dto) {
		LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setId(info.getId());
		dto.setWriter(info.getNickName());
		return sv.deleteComment(dto);	
	}
	
	//스크랩
	@RequestMapping("/scrap.do")
	@ResponseBody
	public String scrap(ScrapDTO dto, HttpSession session) {
		dto.setId(((LoginInfoDTO)session.getAttribute("loginInfo")).getId());
		return sv.scrap(dto);
	}
	
	//채택
	@RequestMapping("/adopt.do")	
	public String adopt(int adoptPoint,String writerId,String replyId) {
		System.out.println("채택:"+adoptPoint + " : " + writerId + " : " + replyId);
		return "";
	}
}
