package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.dto.ProjectApplyDTO;
import kh.hello.dto.ProjectChartDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.dto.ProjectPLogDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.services.ProjectService;
import kh.hello.utils.Utils;

@Controller
@RequestMapping("/project")
public class ProjectMemController {

	@Autowired
	private HttpSession session;
	@Autowired
	private ProjectService svc;
	
	/*
	 * 프로젝트 모집
	 */
	
	@RequestMapping("/list")
	public String projectMainList(String page, String pageOrder, String searchOption, String keyword, Model m) {				
		try {
			int currentPage = 1;
			if(page!=null) {
				currentPage = Integer.parseInt(page);
			}
			int start = currentPage * (Configuration.recordCountPerPage)-(Configuration.recordCountPerPage-1);
			int end = currentPage * (Configuration.recordCountPerPage);
			String checkOrder = "seq";
			if(pageOrder==null||pageOrder.contentEquals("seq")) {
				checkOrder="seq";
				pageOrder="seq";
			}else if(pageOrder.contentEquals("startDate")) {
				checkOrder="startDate";
			}
			if(keyword!=null) {
				keyword.replaceAll("'", "''");
			}
			List<ProjectDTO> result = svc.projectListPerPage(start, end, pageOrder, searchOption, keyword);
			int stateCount = svc.projectStateNoneCount();
			if(searchOption!=null) {
				m.addAttribute("searchChoice", searchOption);
				m.addAttribute("keywordChoice", keyword);			
			}
			m.addAttribute("projectList", result);
			m.addAttribute("stateCount", stateCount);
			String pageNavi = svc.getPageNavi(currentPage, pageOrder, searchOption, keyword);
			m.addAttribute("pageNavi", pageNavi);
			m.addAttribute("currentPage", currentPage);
			m.addAttribute("pageOrder", checkOrder);
			return "/project/projectList";
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/chart")
	public String projectChart(String pageOrder, String searchOption, String keyword, Model m) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();	
			String checkOrder = "seq";
			if(pageOrder==null||pageOrder.contentEquals("seq")) {
				checkOrder="seq";
				pageOrder="seq";
			}else if(pageOrder.contentEquals("startDate")) {
				checkOrder="startDate";
			}
			if(keyword!=null) {
				keyword.replaceAll("'", "''");
			}
			List<ProjectChartDTO> result = svc.projectList(id, pageOrder, searchOption, keyword);
			if(searchOption!=null) {
				m.addAttribute("searchChoice", searchOption);
				m.addAttribute("keywordChoice", keyword);			
			}
			m.addAttribute("projectList", result);
			m.addAttribute("pageOrder", checkOrder);
			m.addAttribute("ip", Configuration.ip);
			return "/project/projectChart";			
		}catch(Exception e) {
			return "redirect:/error";
		}

	}
		
//	@RequestMapping("/map")
//	public String projectMap(Model m) {
//		List<ProjectDTO> result = svc.projectList();
//		m.addAttribute("projectList", result);
//		return "/project/projectMap";
//	}
	
	@RequestMapping("/detailView")
	public String projectDetailView(int seq, String page, Model m, HttpServletRequest request) {
		try {
			int listPage = 1;
			if(page!=null) {
				listPage = Integer.parseInt(page);
			}
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();				
			ProjectDTO result = svc.projectDetailView(seq);		
			String scrap = svc.checkScrap(id, seq);
			List<ProjectCoDTO> coResult = svc.commentList(seq); 
			String data = svc.projectWrite();
			ProjectApplyDTO myApply = svc.checkMyApply(seq, id);
			int checkApplyCount = svc.checkApplyCount(seq);
			m.addAttribute("page", listPage);
			m.addAttribute("data", data);
			m.addAttribute("pPage", result);
			m.addAttribute("comments", coResult);
			m.addAttribute("scrap", scrap);		
			m.addAttribute("myApply", myApply);		
			m.addAttribute("checkApplyCount", checkApplyCount);
			m.addAttribute("ip", Configuration.ip);
			m.addAttribute("adImg", Utils.getRandomAd());		
			return "/project/detailView";
		}catch(Exception e) {
			return "redirect:/error";
		}		
	}
	
	@RequestMapping("/write")
	public String projectWrite(Model m) {
		try {
			String data = svc.projectWrite();
			m.addAttribute("data", data);
			return "/project/write";
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/writeProc")
	public String writeProc(ProjectDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setWriter(sessionValue.getNickName());
			dto.setId(sessionValue.getId());		
			String path = session.getServletContext().getRealPath("attached/project");
			int seq = svc.projectWriteConfirm(dto, path);
			return "redirect:/project/detailView?seq="+seq;
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/modify")
	public String projectModify(int seq, Model m) {
		try {
			String data = svc.projectWrite();
			ProjectDTO result = svc.projectDetailView(seq);
			m.addAttribute("data", data);
			m.addAttribute("pPage", result);
			return "/project/modify";	
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/modifyProc")
	public String projectModifyConfirm(ProjectDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setWriter(sessionValue.getNickName());
			String path = session.getServletContext().getRealPath("attached/project");
			String headName = "/attached/project/";
			svc.projectModifyConfirm(dto, path, headName);
			int seq = dto.getSeq();
			return "redirect:/project/detailView?seq="+seq;	
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/deleteProc")
	public String deleteProc(int seq) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();
			String path = session.getServletContext().getRealPath("attached/project");
			svc.projectDeleteConfirm(seq, id, path);
			return "redirect:/project/list";
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/closeProject")
	public String projectClose(int seq) {
		try {
			svc.projectClose(seq);
			return "redirect:/project/detailView?seq="+seq;
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
//	@RequestMapping("/applyCheck")
//	public String projectApplyCheck(int projectSeq, Model m) {
//		List<ProjectApplyDTO> result = svc.projectApplyList(projectSeq);
//		m.addAttribute("applyList", result);
//		return "/project/applyList";
//	}
	
	@ResponseBody
	@RequestMapping("/scrap")
	public String projectScrap(int categorySeq) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();		
			int result = svc.projectScrap(id,categorySeq);
			if(result>0) {
				return "success";
			}else {
				return "fail";
			}
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/unScrap")
	public String projectUnScrap(int categorySeq) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();		
			int result = svc.projectUnScrap(id, categorySeq);
			if(result>0) {
				return "success";
			}else {
				return "fail";
			}
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	
	/*
	 * 댓글 
	 */
	
	@ResponseBody
	@RequestMapping(value="/comment/writeProc",produces="text/html;charset=utf8")
	public String coWriteProc(ProjectCoDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setWriter(sessionValue.getNickName());
			dto.setId(sessionValue.getId());
			return svc.commentWriteConfirm(dto);
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/modifyProc",produces="text/html;charset=utf8")
	public String commentModifyConfirm(ProjectCoDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setId(sessionValue.getId());
			dto.setWriter(sessionValue.getNickName());
			return svc.commentModifyConfirm(dto);
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/deleteProc",produces="text/html;charset=utf8")
	public String coDelProc(int seq, int projectSeq) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();
			return svc.commentDeleteConfirm(seq, projectSeq, id);
		}catch(Exception e) {
			return "redirect:/error";
		}	
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/replyWriteProc",produces="text/html;charset=utf8")
	public String coReplyWriteConfirm(ProjectCoDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setWriter(sessionValue.getNickName());
			dto.setId(sessionValue.getId());
			dto.setDepth(1);
			return svc.commentWriteConfirm(dto);		
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	
	/*
	 * 프로젝트 지원(신청)
	 */
	
	@ResponseBody
	@RequestMapping(value="/apply/writeProc",produces="text/html;charset=utf8")
	public String projectApplyWriteProc(ProjectApplyDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setWriter(sessionValue.getNickName());
			dto.setId(sessionValue.getId());
			return svc.projectApplyWriteProc(dto);
		}catch(Exception e) {
			return "redirect:/error";
		}
	}	
	
	@RequestMapping(method=RequestMethod.POST, value="/apply/list")
	public String projectApplyList(String page, Integer projectSeq, Model m) {
		try {
			if(projectSeq!=null) {
				session.setAttribute("applyPage", projectSeq);	
			}		
			int pageSeq = (Integer)session.getAttribute("applyPage");		
			int currentPage = 1;
			if(page!=null) {
				currentPage = Integer.parseInt(page);
			}
			int start = currentPage * (Configuration.recordCountPerPage)-(Configuration.recordCountPerPage-1);
			int end = currentPage * (Configuration.recordCountPerPage);
			List<ProjectApplyDTO> result = svc.projectApplyList(start, end, pageSeq);
			m.addAttribute("projectApplyList", result);
			String pageNavi = svc.getApplyPageNavi(currentPage, pageSeq);
			m.addAttribute("pageNavi", pageNavi);
			m.addAttribute("currentPage", currentPage);		
			return "/project/applyList";
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/apply/detailView")
	public String projectApplyDetailView(int seq, Model m) {
		try {
			ProjectApplyDTO result = svc.projectApplyDetailView(seq);
			m.addAttribute("aPage", result);
			return "/project/applyDetailView";	
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/apply/deleteProc")
	public String projectApplyDeleteConfirm(int seq) {
		try {
			int result = svc.projectApplyDeleteConfirm(seq);
			if(result>0) {
				return "success";
			}else {
				return "fail";
			}
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/apply/approveApply")
	public String projectApplyApprove(int seq) {
		try {
			int result = svc.projectApplyApprove(seq);
			if(result>0) {
				return "success";
			}else {
				return "fail";		
			}
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/apply/denyApply")
	public String projectApplyDeny(int seq) {
		try {
			int result = svc.projectApplyDeny(seq);
			if(result>0) {
				return "success";
			}else {
				return "fail";		
			}
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	
	
	
	/*
	 * 프로젝트 현황(PLog용)
	 */
	
	
	@RequestMapping("/pLog/pLogProjectList")
	public String pLogProjectList(Model m){
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();
			m.addAttribute("visitorId", id);
			return "/project/projectPLogList";
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/pLog/makeGuestProjectList")
	public String makeGuestProjectList(String page, String guestConnect, Model m){
		try {
			OwnerInfoDTO sessionValue = (OwnerInfoDTO)session.getAttribute("otherInfo");
			String id = sessionValue.getId();						
			int currentPage = 1;
			if(page!=null) {
				currentPage = Integer.parseInt(page);
			}
			int start = currentPage * (Configuration.pLogProjectRecordCountPerPage)-(Configuration.pLogProjectRecordCountPerPage-1);
			int end = currentPage * (Configuration.pLogProjectRecordCountPerPage);
			List<ProjectDTO> result = svc.makeProjectListPerPage(start, end, id, null, null);
			m.addAttribute("makeProjectList", result);
			String pageNavi = svc.getPLogProjectPageNavi(currentPage, id, "makeGuestProjectList", null, null);
			m.addAttribute("makePageNavi", pageNavi);
			m.addAttribute("makeCurrentPage", currentPage);
			m.addAttribute("guestConnect", guestConnect);
			return "/project/guestPLogMakeProject";
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/pLog/makeProjectList")
	public String makeProjectList(String page, String searchOption, String keyword, String guestConnect, Model m){
		try {
			OwnerInfoDTO sessionValue = (OwnerInfoDTO)session.getAttribute("ownerInfo");
			String id = sessionValue.getId();						
			int currentPage = 1;
			if(page!=null) {
				currentPage = Integer.parseInt(page);
			}
			int start = currentPage * (Configuration.pLogProjectRecordCountPerPage)-(Configuration.pLogProjectRecordCountPerPage-1);
			int end = currentPage * (Configuration.pLogProjectRecordCountPerPage);
			if(keyword!=null) {
				keyword.replaceAll("'", "''");
			}
			List<ProjectDTO> result = svc.makeProjectListPerPage(start, end, id, searchOption, keyword);
			if(searchOption!=null) {
				m.addAttribute("searchChoice", searchOption);
				m.addAttribute("keywordChoice", keyword);			
			}
			m.addAttribute("makeProjectList", result);
			String pageNavi = svc.getPLogProjectPageNavi(currentPage, id, "makeProjectList", searchOption, keyword);
			m.addAttribute("makePageNavi", pageNavi);
			m.addAttribute("makeCurrentPage", currentPage);
			m.addAttribute("guestConnect", guestConnect);
			return "/project/pLogMakeProject";
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/pLog/applyProjectList")
	public String applyProjectList(String page, String searchOption, String keyword, Model m){
		try {
			OwnerInfoDTO sessionValue = (OwnerInfoDTO)session.getAttribute("ownerInfo");
			String id = sessionValue.getId();				
			int currentPage = 1;
			if(page!=null) {
				currentPage = Integer.parseInt(page);
			}
			int start = currentPage * (Configuration.pLogProjectRecordCountPerPage)-(Configuration.pLogProjectRecordCountPerPage-1);
			int end = currentPage * (Configuration.pLogProjectRecordCountPerPage);
			if(keyword!=null) {
				keyword.replaceAll("'", "''");
			}
			List<ProjectPLogDTO> result = svc.applyProjectListPerPage(start, end, id, searchOption, keyword);
			if(searchOption!=null) {
				m.addAttribute("searchChoice", searchOption);
				m.addAttribute("keywordChoice", keyword);			
			}
			m.addAttribute("applyProjectList", result);
			String pageNavi = svc.getPLogProjectPageNavi(currentPage, id, "applyProjectList", searchOption, keyword);
			m.addAttribute("applyPageNavi", pageNavi);
			m.addAttribute("applyCurrentPage", currentPage);
			return "/project/pLogApplyProject";
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	
//	게시글신고
	
	@ResponseBody
	@RequestMapping("/reportDuplCheck")
	public String reportDuplCheck(int seq) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			String id = sessionValue.getId();
			int result = svc.reportDuplCheck(id, seq);
			if(result>0) {
				return "dupl";
			}else {
				return "possible";
			}
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/report")
	public String reportProject(ReportDTO dto) {
		try {
			LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
			dto.setReporterID(sessionValue.getId());
			dto.setReporterNick(sessionValue.getNickName());		
			int result = svc.reportProject(dto);
			if(result>0) {
				return "success";
			}else {
				return "fail";
			}
		}catch(Exception e) {
			return "redirect:/error";
		}
	}
	

}
