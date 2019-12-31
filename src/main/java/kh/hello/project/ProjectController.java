package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.dto.ProjectApplyDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private HttpSession session;
	@Autowired
	private ProjectService service;
	
	/*
	 * 프로젝트 모집
	 */
	
	@RequestMapping("/list")
	public String projectMainList(Model m) {
		List<ProjectDTO> result = service.projectList();
		m.addAttribute("projectList", result);
		return "/project/projectList";
	}
	
	@RequestMapping("/detailView")
	public String projectDetailView(int seq, Model m) {
		ProjectDTO result = service.ProjectDetailView(seq);
		List<ProjectCoDTO> coResult = service.commentList(seq); 
		m.addAttribute("projectPage", result);
		m.addAttribute("comments", coResult);
		return "/project/detailView";
	}
	
	@RequestMapping("/write")
	public String projectWrite() {
		return "/project/write";
	}
	
	@RequestMapping("/writeProc")
	public String projectWriteConfirm(ProjectDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		int seq = service.projectWriteConfirm(dto);
		return "redirect:/project/detailView?seq="+seq;
	}
	
	@RequestMapping("/modify")
	public String projectModify(int seq, Model m) {
		ProjectDTO result = service.ProjectDetailView(seq);
		m.addAttribute("projectPage", result);
		return "/project/modify";
	}
	
	@RequestMapping("/modifyProc")
	public String projectModifyConfirm(ProjectDTO dto) {
		service.projectModifyConfirm(dto);
		int seq = dto.getSeq();
		return "redirect:/project/detailView?seq="+seq;
	}
	
	@RequestMapping("/deleteProc")
	public String projectDeleteConfirm(int seq) {
		service.projectDeleteConfirm(seq);
		return "redirect:/project/list";
	}
	
	
	
	
	/*
	 * 댓글 
	 */
	
	@ResponseBody
	@RequestMapping(value="/comment/writeProc",produces="text/html;charset=utf8")
	public String commentWriteConfirm(ProjectCoDTO dto) {
		return service.commentWriteConfirm(dto);		
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/modifyProc",produces="text/html;charset=utf8")
	public String commentModifyConfirm(ProjectCoDTO dto) {
		return service.commentModifyConfirm(dto);
	}
	
	@RequestMapping("/comment/deleteProc")
	public void commentDeleteConfirm(int seq) {
		service.commentDeleteConfirm(seq);
	}
	
	
	
	/*
	 * 프로젝트 지원(신청)
	 */
	
	@ResponseBody
	@RequestMapping(value="/apply/writeProc",produces="text/html;charset=utf8")
	public String projectApplyWriteProc(ProjectApplyDTO dto) {
		return service.projectApplyWriteProc(dto);
	}
	
	@RequestMapping("/apply/list")
	public String projectApplyList(int projectSeq, Model m) {
		List<ProjectApplyDTO> result = service.projectApplyList(projectSeq);
		m.addAttribute("projectApplyList", result);
		return "/project/projectApplyList";
	}
	
	@RequestMapping("/apply/detailView")
	public String projectApplyDetailView(int seq, Model m) {
		ProjectApplyDTO result = service.ProjectApplyDetailView(seq);
		m.addAttribute("projectApplyPage", result);
		return "/project/applyDetailView";	
	}
	
	@RequestMapping("/apply/deleteProc")
	public void projectApplyDeleteConfirm(int seq) {
		service.ProjectApplyDeleteConfirm(seq);
	}
}
