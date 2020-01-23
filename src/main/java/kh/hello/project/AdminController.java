package kh.hello.project;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kh.hello.configuration.Configuration;
import kh.hello.dto.BoardLogDTO;
import kh.hello.dto.ChartGenderDTO;
import kh.hello.dto.ChartGenerationDTO;
import kh.hello.dto.ChartJoinPathDTO;
import kh.hello.dto.ChartVisitChangeDTO;
import kh.hello.dto.ChartWorkDTO;
import kh.hello.dto.CommentLogDTO;
import kh.hello.dto.ForcedOutMemberDTO;
import kh.hello.dto.InquiryDTO;
import kh.hello.dto.InquiryReplyDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.dto.NoticeDTO;
import kh.hello.services.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService as;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/adminError")
	public String errorPage() {
		return "adminError";
	}
	
	@RequestMapping("/login")
	public String login(String name, String password) {
		int result;
		try {
			result = as.validLogin(name, password);
			if(result > 0) {
				session.setAttribute("AdminInfo", name);
				return "redirect:main";
			}else {
				return "redirect:loginFail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:loginFail";
		}
	}
	
	@RequestMapping("/loginFail")
	public String loginFail() {
		return "admin/loginFail";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:../manage";
	}
	
	@RequestMapping("/main")
	public String adMain(Model m) {
		//1-1. 방문자 통계(today, total)
		try {
			Map<String, Integer> count = as.getVisitorCount();
			m.addAttribute("count", count);	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//1-2. 일일 방문자수 추이
		List<ChartVisitChangeDTO> visitChange = as.getVisitChange();
		m.addAttribute("visitChange", visitChange);
		
		//2-1. 회원 활동점수 TOP5
		List<MemberDTO> top5List = as.getTop5List();
		m.addAttribute("top5List", top5List);
		
		//2-2. 회원성비
		List<ChartGenderDTO> genderRatio = as.getGenderRatio();
		m.addAttribute("genderRatio", genderRatio);
		
		//3-1. 게시물 수(어제부터 5일간의 기록)
		List<BoardLogDTO> boardLog = as.getBoardLog();
		m.addAttribute("boardLog", boardLog);
		
		//3-2. 댓글 수(5일)
		List<CommentLogDTO> comLog = as.getComLog();
		m.addAttribute("comLog", comLog);
		
		//4-1. 가입경로
		List<ChartJoinPathDTO> joinPath = as.getJoinPath();
		m.addAttribute("joinPath", joinPath);
		
		//4-2. 재직자/비재직자 비율
		List<ChartWorkDTO> workRatio = as.getWorkRatio();
		m.addAttribute("workRatio", workRatio);
		
		//4-3. 나이 비율
		List<ChartGenerationDTO> generationRatio = as.getGenerationRatio();
		m.addAttribute("generationRatio", generationRatio);
		
		return "admin/main";
	}
	
	@RequestMapping("/modifyForm")
	public String adModifyForm(Model m) {
		String adminId = (String)session.getAttribute("AdminInfo");		
		String email = as.getAdminEmail(adminId);
		m.addAttribute("email", email);
		return "admin/modifyForm";
	}
	
	@RequestMapping("/modifyInfo")
	public String adModifyInfo(String password, String email, HttpServletRequest request) {
		String adminId = (String)session.getAttribute("AdminInfo");
		int result;
		try {
			result = as.modifyInfo(adminId, password, email);
			if(result > 0) {
				request.setAttribute("result", true);
			}else {
				request.setAttribute("result", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", false);
		}
		return "admin/modifyResult";
	}
	
	@RequestMapping("/inquiryList")
	public String adInquiryList(String page, Model m) {
		int currentPage = 1;		
		
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
				
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		
		List<InquiryDTO> list = as.selectInquiryByPage(start, end);
		m.addAttribute("list", list);
		
		List<String> pageNavi = as.getInquiryPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		
		return "admin/inquiryList";
	}
	
	@RequestMapping("/inquiryDetailView")
	public String adInquiryDetailView(int seq, int page, Model m) {
		//글 받아오기
		InquiryDTO dto = as.inquiryDetailView(seq);
		m.addAttribute("dto", dto);
		
		//댓글 받아오기
		List<InquiryReplyDTO> reply = as.getInquiryReply(seq);
		m.addAttribute("reply", reply);
		
		m.addAttribute("page", page);
		return "admin/inquiryDetailView";
	}
	
	@RequestMapping(value="/writeInquiry", produces="text/html; charset=utf8")
	@ResponseBody
	public String adWriteInquiry(String reply, int boardSeq) {
		InquiryReplyDTO dto = as.writeInquiry(reply, boardSeq);
		JsonObject obj = new JsonObject();
		obj.addProperty("seq", dto.getSeq());
		obj.addProperty("boardSeq", dto.getBoardSeq());
		obj.addProperty("reply", dto.getReply());
		obj.addProperty("writeDate", dto.getFormedDate());
		String result = obj.toString();
		return result;
	}
	
	@RequestMapping("/deleteInquiryReply")
	public String adDeleteInquiryReply(int seq, int boardSeq, int page) {		
		//댓글 삭제하고
		as.deleteInquiryReply(seq, boardSeq);
		//boardSeq가지고 디테일뷰로 이동하기
		return "redirect:inquiryDetailView?page="+page+"&seq="+boardSeq;
	}
	
	@RequestMapping("/memberList")
	public String adMemberList(String page, Model m) {
		//회원 목록 받아오기(byPage)
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);
		
		List<MemberDTO> list = as.memberListByPage(start, end);
		m.addAttribute("list", list);
				
		//페이지네비
		List<String> pageNavi = as.getMemberPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);

		return "admin/memberList";
	}
	
	@RequestMapping("/getMemberInfo")
	public String adGetMemberInfo(String id, Model m) {
		MemberDTO dto = as.getMemberInfo(id);
		m.addAttribute("dto", dto);
		
		return "admin/memberInfoView";
	}
	
	@RequestMapping("/memberModify")
	public String adMemberModify(String id, String email, String phone, Model m) {		
		int result = as.memberModify(id, email, phone);
		if(result == 0) {
			m.addAttribute("id", id);
		}
		m.addAttribute("result", result);
		return "admin/memberInfoResult";
	}
	
	@RequestMapping("/memberStop")
	public String adMemberStop(String id, Model m) {
		int result = as.memberStop(id);
		m.addAttribute("result", result);
		return "admin/memberStopResult";
	}
	
	@RequestMapping("/memberStart")
	public String adMemberStart(String id, Model m) {
		int result = as.memberStart(id);
		m.addAttribute("result", result);
		return "admin/memberStartResult";
	}
	
	@RequestMapping("/memberOutForm")
	public String adMemberOutForm(String id, Model m) {
		MemberDTO dto = as.getMemberInfo(id);
		m.addAttribute("dto", dto);
		return "admin/memberOutForm";
	}
	
	@RequestMapping("/memberOut")
	public String adMemberOut(String id, String reason, String etcReason, Model m) {
		if(reason.contentEquals("etc")) {
			reason = etcReason;
		}
		int result = 0;
		try {
			result = as.memberOut(id, reason);
		} catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("result", result);
		return "admin/memberOutResult";
	}
	
	@RequestMapping("/memberUp")
	public String adMemberUp(String id, Model m) {
		int result = as.memberUp(id);
		m.addAttribute("result", result);
		return "admin/memberUpResult";
	}
	
	@RequestMapping("/forcedOutList")
	public String adForcedOutList(String page, Model m) {
		//목록 받아오기(page)
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);
		
		List<ForcedOutMemberDTO> list = as.forcedOutListByPage(start, end);
		m.addAttribute("list", list);
				
		//페이지네비 받아오기
		List<String> pageNavi = as.getForcedOutPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		
		return "admin/forcedOutList";
	}
	
	@RequestMapping("/forcedOutDel")
	public String adForcedOutDel(int seq, Model m) {
		int result = as.forcedOutDel(seq);
		m.addAttribute("result", result);
		return "admin/forcedOutDelResult";
	}
	
	@RequestMapping("/searchMember")
	public String adSearchMember(String col, String searchWord, String page, Model m) {
		//검색 후 목록 받아오기
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);
		
		List<MemberDTO> list = as.getSearchMemberListByPage(col, searchWord, start, end);
		m.addAttribute("list", list);
		
		//페이지네비 받아오기
		List<String> pageNavi = as.getSearchMemberListPageNavi(currentPage, col, searchWord);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
				
		return "admin/searchMemberList";
	}
	
	@RequestMapping("/blackList")
	public String adBlackList(String page, Model m) {//활동 점수가 0점 이하
		//검색 후 목록 받아오기
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);
		
		List<MemberDTO> list = as.getBlackList(start, end);
		m.addAttribute("list", list);
		
		//페이지네비 받아오기
		List<String> pageNavi = as.getBlackListPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
				
		return "admin/blackList";		
	}
	
	@RequestMapping("/stopForBlack")
	public String adStopForBlack(String id, Model m) {
		int result = as.memberStop(id);
		m.addAttribute("result", result);
		return "admin/blackStopResult";		
	}
	
	@RequestMapping("/startForBlack")
	public String adStartForBlack(String id, Model m) {
		int result = as.memberStart(id);
		m.addAttribute("result", result);
		return "admin/blackStartResult";
	}
	
	@RequestMapping("/blackOut")
	public String adOutBlack(String id, String reason, String etcReason, Model m) {
		if(reason.contentEquals("etc")) {
			reason = etcReason;
		}
		int result = 0;
		try {
			result = as.memberOut(id, reason);
		} catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("result", result);
		return "admin/blackOutResult";
	}
	
	@RequestMapping("/searchBlack")
	public String adSearchBlack(String col, String searchWord, String page, Model m) {
		//검색 후 목록 받아오기
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);
		
		List<MemberDTO> list = as.searchBlackListByPage(col, searchWord, start, end);
		m.addAttribute("list", list);
		
		//페이지네비 받아오기
		List<String> pageNavi = as.getSearchBlackListPageNavi(currentPage, col, searchWord);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
				
		return "admin/searchBlackList";
	}
	
	@RequestMapping("/noticeList")
	public String adNoticeList(String page, Model m) {
		int currentPage = 1;		
		
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
				
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		
		List<NoticeDTO> list = as.noticeMainListByPage(start, end);
		m.addAttribute("list", list);
		
		List<String> pageNavi = as.getNoticePageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);		
		return "admin/noticeList";
	}
	
	@RequestMapping("/noticeWriteForm")
	public String adWriteNoticeForm(String page, Model m) {
		m.addAttribute("page", page);
		return "admin/noticeWriteForm";
	}
	
	@RequestMapping("/writeNotice")
	public String writeNotice(String page, NoticeDTO dto) {
		String path = session.getServletContext().getRealPath("attached");
		try {
			int seq = as.writeNotice(dto, path);
			if(seq > 0) {
				return "redirect:noticeDetailView?page="+page+"&seq="+seq;
			}else {
				return "redirect:adminError";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:adminError";
		}
	}
	
	@RequestMapping("/noticeDetailView")
	public String detailViewNotice(String page, int seq, Model m) {
		//글 본문
		NoticeDTO dto = as.noticeDetailView(seq);
		m.addAttribute("dto", dto);
		//페이지
		m.addAttribute("page", page);
		return "admin/noticeDetailView";
	}
	
	@RequestMapping("/noticeModifyForm")
	public String noticeModifyForm(String page, int seq, Model m) {
		NoticeDTO dto = as.noticeDetailView(seq);
		m.addAttribute("dto", dto);
		m.addAttribute("page", page);
		return "admin/noticeModifyForm";				
	}
	
	@RequestMapping("/modifyNotice")
	public String modifyNotice(String page, NoticeDTO dto) {
		String path = session.getServletContext().getRealPath("attached");
		try {
			int seq = as.modifyNotice(dto, path);
			if(seq > 0) {
				return "redirect:noticeDetailView?page="+page+"&seq="+dto.getSeq();
			}else {
				return "redirect:adminError";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:adminError";
		}		
	}
	
	@RequestMapping("/delNotice")
	public String delNotice(String page, int seq, Model m) {
		String path = session.getServletContext().getRealPath("attached/notice");		
		try {
			int result = as.deleteNotice(path, seq);
			m.addAttribute("result", result);
			if(result == 0) {				
				m.addAttribute("seq", seq);
			}
			m.addAttribute("page", page);
			return "admin/noticeDeleteResult";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:adminError";
		}
	}
}





