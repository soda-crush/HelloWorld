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
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.dto.ScrapDTO;
import kh.hello.services.CodeService;
import kh.hello.utils.Utils;

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
			int currentPage = 1;
			if(page != null) currentPage = Integer.parseInt(page);
			int end = currentPage * Configuration.recordCountPerPage;
			int start = end - (Configuration.recordCountPerPage - 1);
			List<CodeQuestionDTO> list = sv.selectQuestionAll(start,end);
			List<String> pageNavi = sv.getPageNavi(currentPage);
			m.addAttribute("list",list);
			m.addAttribute("pageNavi",pageNavi);
			m.addAttribute("page", currentPage);
			return "code/codeQList";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@RequestMapping("/codeQWrite.do")
	public String writeFormCode() {
		return "code/codeQWrite";
	}

	//섬머노트
	@RequestMapping("/codeQWriteProc.do")
	public String writeProcCode(CodeQuestionDTO dto) {
		try {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setId(info.getId());
			dto.setWriter(info.getNickName());
			dto.setTitle(Utils.protectXss(dto.getTitle()));	
			String path = session.getServletContext().getRealPath("attached");
			int result = 0;	
			result = sv.writeCode(path, dto,dto.getId());		
			if(result > 0) {
				int seq = dto.getSeq();
				return "redirect:/code/codeDetail.do?seq="+seq;
			}else {
				return "redirect:/error";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@RequestMapping("/codeDetail.do")
	public String codeDetail(int seq, Model m) {
		try { 
			CodeQuestionDTO qResult = sv.detailQuestion(seq); //queSeq
			if(qResult==null) {	
				return "/code/codeDetail";
			}
			String kakaoTitle = qResult.getTitle().replace("\"", "\\\"");
			qResult.setKakaoTitle(kakaoTitle);
			List<CodeReplyDTO> rResult = sv.detailReply(seq); //queSeq
			List<CodeCommentsDTO> cResult = sv.commentList(seq); //queSeq  
			int repCount = sv.replyCount(seq); //답글 수 
			int adoptCount = sv.adoptCount(seq);	
			String ip = Configuration.ip;

			//		답글에서 실무자 비실무자 구분
			for (CodeReplyDTO c : rResult) {
				String id = c.getId();
				int level = sv.selectMem(id);
				c.setMemLevel(level); // level 세팅
			}

			m.addAttribute("qResult", qResult);
			m.addAttribute("rResult", rResult);			
			m.addAttribute("cResult", cResult);
			m.addAttribute("repCount", repCount);
			m.addAttribute("adoptCount", adoptCount);
			m.addAttribute("ip", ip);
			m.addAttribute("ad",Utils.getRandomAd());

			//비회원이 detail 들어갈수있게
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			int count = sv.replyOneCount(seq, info.getId()); //queSeq					
			m.addAttribute("count", count);		
			return "/code/codeDetail";
		} 
		catch (Exception e) {
			m.addAttribute("count", 1);
			return "/code/codeDetail";
		}
	}

	@RequestMapping("/delete.do")
	public String deleteProcCode(int seq,String id,int point) {
		try {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			sv.delete(seq,info.getId(),point);
			return "redirect:codeQList.do";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@RequestMapping("/modify.do")
	public String modifyForm(int seq, Model m) {
		try {
			CodeQuestionDTO result = sv.detailQuestion(seq);
			int parent_seq = seq;		
			String kakaoTitle = result.getTitle().replace("\"", "\\\"");
			String title = kakaoTitle.replace("\\\"", "\"");
			result.setTitle(title);	
			m.addAttribute("parent_seq",parent_seq);
			m.addAttribute("result", result);
			return "/code/codeQModify";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@RequestMapping("/modifyProc.do")
	public String modifyProcCode(CodeQuestionDTO dto,String id) {
		try {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setTitle(Utils.protectXss(dto.getTitle()));
			String kakaoTitle = dto.getTitle().replaceAll("\"", "\\\"");
			dto.setKakaoTitle(kakaoTitle);
			sv.modify(dto,info.getId());
			int seq = dto.getSeq();
			return "redirect:/code/codeDetail.do?seq="+seq;
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	//게시판 목록 검색
	@RequestMapping("/codeSearch.do")
	public String codeSearch(String search, String value, Model m, String cpage) {
		try {
			//페이지네비
			int currentPage = 1;
			search = search.replace("'", "''");
			if(cpage!= null && !cpage.equals("") && !cpage.equals("null")) currentPage = Integer.parseInt(cpage);
			int end = currentPage * Configuration.recordCountPerPage;
			int start = end - (Configuration.recordCountPerPage - 1);	
			List<CodeQuestionDTO> list = sv.codeSearchByPage(start, end, value, search);
			List<String> pageNavi = sv.getCodeSearchListPageNavi(currentPage, value, search);
			m.addAttribute("list",list);
			m.addAttribute("pageNavi", pageNavi);
			m.addAttribute("page", currentPage);
			return "/code/codeQList";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@ResponseBody
	@RequestMapping(value="/memLevel.do",produces="text/html;charset=utf8")
	public String getMemLevel(String id) {
		try {
			return Integer.toString(sv.getMemLevel(id));
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@ResponseBody
	@RequestMapping(value="/pointCheck.do",produces="text/html;charset=utf8")
	public String pointCheck(String id) {
		try {
			return Integer.toString(sv.selectPoint(id)); //현재 포인트
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	//답글 CodeReply

	@RequestMapping("/codeRWrite.do")
	public String writeFormCodeR(int seq,Model m) {
		try {
			int parent_seq = seq;
			m.addAttribute("parent_seq",parent_seq);
			return "code/codeRWrite";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	//섬머노트
	@RequestMapping("/codeRWriteProc.do")
	public String writeProcCodeR(CodeReplyDTO dto) {
		try {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setId(info.getId());
			dto.setWriter(info.getNickName());
			dto.setTitle(Utils.protectXss(dto.getTitle()));
			int queSeq = dto.getQueSeq();
			String path = session.getServletContext().getRealPath("attached");
			int result = 0;
			result = sv.writeCodeR(path, dto,dto.getId());
			if(result > 0) {
				return "redirect:/code/codeDetail.do?seq="+queSeq;
			}else {
				return "redirect:/error";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@RequestMapping("/deleteR.do")
	public String deleteProcCodeR(int seq,int queSeq) {
		try {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = info.getId();
			sv.deleteR(seq,id);
			return "redirect:/code/codeDetail.do?seq="+queSeq;
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@RequestMapping("/modifyR.do")
	public String modifyFormCodeR(int seq,int queSeq, Model m) {
		try {
			CodeReplyDTO dto = sv.selectOneDetail(seq);
			int parent_seq = queSeq;
			m.addAttribute("parent_seq",parent_seq);
			m.addAttribute("dto", dto);
			return "/code/codeRModify";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@RequestMapping("/modifyRProc.do")
	public String modifyProcCodeR(CodeReplyDTO dto) {
		try {
			sv.modifyR(dto);
			int queSeq = dto.getQueSeq();
			return "redirect:/code/codeDetail.do?seq="+queSeq;
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	//댓글 CodeComments
	@ResponseBody
	@RequestMapping(value="/codeCWriteProc.do",produces="text/html;charset=utf8")
	public String coWriteProcCode(CodeCommentsDTO dto) {
		try {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setId(info.getId());
			dto.setWriter(info.getNickName());
			return sv.insertComment(dto);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@ResponseBody
	@RequestMapping(value="/codeCModifyProc.do",produces="text/html;charset=utf8")
	public String coMdfProcCode(CodeCommentsDTO dto) {
		try {
			dto.setContent(Utils.protectXss(dto.getContent()));
			return sv.updateComment(dto);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@ResponseBody
	@RequestMapping(value="/codeCDeleteProc.do",produces="text/html;charset=utf8")
	public String coDelProcCode(CodeCommentsDTO dto) {
		try {
			LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setId(info.getId());
			dto.setWriter(info.getNickName());
			return sv.deleteComment(dto);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	//스크랩
	@RequestMapping("/scrap.do")
	@ResponseBody
	public String scrap(ScrapDTO dto, HttpSession session) {
		try {
			dto.setId(((LoginInfoDTO)session.getAttribute("loginInfo")).getId());
			return sv.scrap(dto);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	//채택
	@RequestMapping("/adopt.do")	
	public String adopt(int adoptPoint,int queSeq,String writerId,String replyId) {
		try {
			sv.adopt(adoptPoint, queSeq,writerId, replyId);
			return "redirect:/code/codeDetail.do?seq="+queSeq;
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	//카카오톡 공유
	@RequestMapping("/sharing.do")	
	public String sharing() {
		return "/code/kakaoSharing";
	}

	//작성 글 신고하기
	@ResponseBody
	@RequestMapping("/reportDuplCheck.do")
	public String reportDuplCheck(int seq) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();
			int result = sv.reportDuplCheck(id, seq);
			if(result>0) {
				return "dupl";
			}else {
				return "possible";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@ResponseBody
	@RequestMapping("/report.do")
	public String reportCode(ReportDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setReporterID(sessionValue.getId());
			dto.setReporterNick(sessionValue.getNickName());
			dto.setReason(Utils.protectXss(dto.getReason()));
			dto.setTitle(Utils.protectXss(dto.getTitle()));
			int result = sv.reportCode(dto);
			if(result>0) {
				return "success";
			}else {
				return "redirect:/home/error";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	//답글 신고하기
	@ResponseBody
	@RequestMapping("/reportDuplCheckR.do")
	public String reportDuplCheckR(int seq) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();
			int result = sv.reportDuplCheckR(id, seq);
			if(result>0) {
				return "dupl";
			}else {
				return "possible";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@ResponseBody
	@RequestMapping("/reportR.do")
	public String reportCodeR(ReportDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");	
			dto.setReporterID(sessionValue.getId());
			dto.setReporterNick(sessionValue.getNickName());
			dto.setReason(Utils.protectXss(dto.getReason()));
			int result = sv.reportCodeR(dto);
			if(result>0) {
				return "success";
			}else {
				return "redirect:/home/error";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
}
