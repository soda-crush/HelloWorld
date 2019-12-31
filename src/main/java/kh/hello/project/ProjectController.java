package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.ProjectDTO;
import kh.hello.services.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private HttpSession session;
	@Autowired
	private ProjectService service;
	
	@RequestMapping("/list")
	public String projectMainList(Model m) {
		List<ProjectDTO> result = service.projectList();
		m.addAttribute("projectList", result);
		return "/project/projectList";
	}
	
	@RequestMapping("/detailView")
	public String ProjectDetailView(int seq, Model m) {
		ProjectDTO result = service.ProjectDetailView(seq);
		m.addAttribute("projectPage", result);
		return "/project/detailView";
	}
	
	
}
