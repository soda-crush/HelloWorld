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
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.ProjectApplyDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.dto.ProjectChartDTO;
import kh.hello.dto.ProjectPLogDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.services.ProjectService;

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
		List<ProjectDTO> result = svc.projectListPerPage(start, end, pageOrder, searchOption, keyword);
		int stateCount = svc.projectStateNoneCount();
		m.addAttribute("projectList", result);
		m.addAttribute("stateCount", stateCount);
		String pageNavi = svc.getPageNavi(currentPage, pageOrder, searchOption, keyword);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("pageOrder", checkOrder);
		return "/project/projectList";
	}
	
	@RequestMapping("/chart")
	public String projectChart(String pageOrder, Model m) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();	
		String checkOrder = "seq";
		if(pageOrder==null||pageOrder.contentEquals("seq")) {
			checkOrder="seq";
			pageOrder="seq";
		}else if(pageOrder.contentEquals("startDate")) {
			checkOrder="startDate";
		}
		List<ProjectChartDTO> result = svc.projectList(id, pageOrder);
		m.addAttribute("projectList", result);
		m.addAttribute("pageOrder", checkOrder);
		m.addAttribute("ip", Configuration.ip);
		return "/project/projectChart";
	}
	
//	@RequestMapping("/map")
//	public String projectMap(Model m) {
//		List<ProjectDTO> result = svc.projectList();
//		m.addAttribute("projectList", result);
//		return "/project/projectMap";
//	}
	
	@RequestMapping("/detailView")
	public String projectDetailView(String page, int seq, Model m, HttpServletRequest request) {
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
		return "/project/detailView";
	}
	
	@RequestMapping("/write")
	public String projectWrite(Model m) {
		String data = svc.projectWrite();
		m.addAttribute("data", data);
		return "/project/write";
	}
	
	@RequestMapping("/writeProc")
	public String writeProc(ProjectDTO dto, String sDate, String eDate) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(sessionValue.getNickName());
		dto.setId(sessionValue.getId());
		
		String path = session.getServletContext().getRealPath("attached/project");
		int seq = 0;
		try {
			seq = svc.projectWriteConfirm(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/project/detailView?seq="+seq;
	}
	
	@RequestMapping("/modify")
	public String projectModify(int seq, Model m) {
		String data = svc.projectWrite();
		ProjectDTO result = svc.projectDetailView(seq);
		m.addAttribute("data", data);
		m.addAttribute("pPage", result);
		return "/project/modify";
	}
	
	@RequestMapping("/modifyProc")
	public String projectModifyConfirm(ProjectDTO dto) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(sessionValue.getNickName());
		String path = session.getServletContext().getRealPath("attached/project");
		String headName = "/attached/project/";
		try {
			svc.projectModifyConfirm(dto, path, headName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int seq = dto.getSeq();
		return "redirect:/project/detailView?seq="+seq;
	}
	
	@RequestMapping("/deleteProc")
	public String deleteProc(int seq) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();
		String path = session.getServletContext().getRealPath("attached/project");
		svc.projectDeleteConfirm(seq, id, path);
		return "redirect:/project/list";
	}
	
	@RequestMapping("/closeProject")
	public String projectClose(int seq) {
		svc.projectClose(seq);
		return "redirect:/project/detailView?seq="+seq;
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
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();		
		int result = svc.projectScrap(id,categorySeq);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/unScrap")
	public String projectUnScrap(int categorySeq) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();		
		int result = svc.projectUnScrap(id, categorySeq);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";	
		}
	}
	
	
	/*
	 * 댓글 
	 */
	
	@ResponseBody
	@RequestMapping(value="/comment/writeProc",produces="text/html;charset=utf8")
	public String coWriteProc(ProjectCoDTO dto) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(sessionValue.getNickName());
		dto.setId(sessionValue.getId());
		return svc.commentWriteConfirm(dto);		
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/modifyProc",produces="text/html;charset=utf8")
	public String commentModifyConfirm(ProjectCoDTO dto) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setId(sessionValue.getId());
		dto.setWriter(sessionValue.getNickName());
		return svc.commentModifyConfirm(dto);
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/deleteProc",produces="text/html;charset=utf8")
	public String coDelProc(int seq, int projectSeq) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();
		return svc.commentDeleteConfirm(seq, projectSeq, id);		
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/replyWriteProc",produces="text/html;charset=utf8")
	public String coReplyWriteConfirm(ProjectCoDTO dto) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(sessionValue.getNickName());
		dto.setId(sessionValue.getId());
		dto.setDepth(1);
		return svc.commentWriteConfirm(dto);		
	}
	
	
	/*
	 * 프로젝트 지원(신청)
	 */
	
	@ResponseBody
	@RequestMapping(value="/apply/writeProc",produces="text/html;charset=utf8")
	public String projectApplyWriteProc(ProjectApplyDTO dto) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setWriter(sessionValue.getNickName());
		dto.setId(sessionValue.getId());
		return svc.projectApplyWriteProc(dto);
	}	
	
	@RequestMapping("/apply/list")
	public String projectApplyList(String page, Integer projectSeq, Model m) {
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
	}
	
	@RequestMapping("/apply/detailView")
	public String projectApplyDetailView(int seq, Model m) {
		ProjectApplyDTO result = svc.projectApplyDetailView(seq);
		m.addAttribute("aPage", result);
		return "/project/applyDetailView";	
	}
	
	@ResponseBody
	@RequestMapping("/apply/deleteProc")
	public String projectApplyDeleteConfirm(int seq) {
		int result = svc.projectApplyDeleteConfirm(seq);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";
		}
	}
	
	@ResponseBody
	@RequestMapping("/apply/approveApply")
	public String projectApplyApprove(int seq) {
		int result = svc.projectApplyApprove(seq);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";			
		}
	}
	
	@ResponseBody
	@RequestMapping("/apply/denyApply")
	public String projectApplyDeny(int seq) {
		int result = svc.projectApplyDeny(seq);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";			
		}
	}
	
	
	
	
	/*
	 * 프로젝트 현황(PLog용)
	 */
	
	
	@RequestMapping("/pLog/pLogProjectList")
	public String pLogProjectList(){
		return "/project/projectPLogList";
	}
	
	@RequestMapping("/pLog/makeProjectList")
	public String makeProjectList(String page, String searchOption, String keyword, Model m){
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();						
		int currentPage = 1;
		if(page!=null) {
			currentPage = Integer.parseInt(page);
		}
		int start = currentPage * (Configuration.pLogProjectRecordCountPerPage)-(Configuration.pLogProjectRecordCountPerPage-1);
		int end = currentPage * (Configuration.pLogProjectRecordCountPerPage);
		List<ProjectDTO> result = svc.makeProjectListPerPage(start, end, id, searchOption, keyword);
		m.addAttribute("makeProjectList", result);
		String pageNavi = svc.getPLogProjectPageNavi(currentPage, id, "makeProjectList", searchOption, keyword);
		m.addAttribute("makePageNavi", pageNavi);
		m.addAttribute("makeCurrentPage", currentPage);
		return "/project/pLogMakeProject";
	}
	
	@RequestMapping("/pLog/applyProjectList")
	public String applyProjectList(String page, String searchOption, String keyword, Model m){
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();				
		int currentPage = 1;
		if(page!=null) {
			currentPage = Integer.parseInt(page);
		}
		int start = currentPage * (Configuration.pLogProjectRecordCountPerPage)-(Configuration.pLogProjectRecordCountPerPage-1);
		int end = currentPage * (Configuration.pLogProjectRecordCountPerPage);
		List<ProjectPLogDTO> result = svc.applyProjectListPerPage(start, end, id, searchOption, keyword);
		m.addAttribute("applyProjectList", result);
		String pageNavi = svc.getPLogProjectPageNavi(currentPage, id, "applyProjectList", searchOption, keyword);
		m.addAttribute("applyPageNavi", pageNavi);
		m.addAttribute("applyCurrentPage", currentPage);
		return "/project/pLogApplyProject";
	}
	
	
//	게시글신고
	
	@ResponseBody
	@RequestMapping("/reportDuplCheck")
	public String reportDuplCheck(int seq) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();
		int result = svc.reportDuplCheck(id, seq);
		if(result>0) {
			return "dupl";
		}else {
			return "possible";
		}
	}
	
	@ResponseBody
	@RequestMapping("/report")
	public String reportProject(ReportDTO dto) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setReporterID(sessionValue.getId());
		dto.setReporterNick(sessionValue.getNickName());		
		int result = svc.reportProject(dto);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";
		}
	}
	

}
