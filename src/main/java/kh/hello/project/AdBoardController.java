package kh.hello.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.AdBoardService;

@Controller
@RequestMapping("/adBoard")
public class AdBoardController {
	@Autowired
	private AdBoardService bs;
	
	@RequestMapping("/projectList")
	public String ProejctMainList(String page, Model m) {
		
		int currentPage = 1;
		if(page!= null) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<ProjectDTO> result = bs.projectListperPage(start, end);
		m.addAttribute("list", result);
		
		List<String> pageNavi = bs.getProjectPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		
		return "/admin/boardProjectList";
	}
	
	@RequestMapping("/delProject")
	public String delProject(int seq) {
		int result = bs.delProject(seq);
		if(result > 0) {
			return "redirect:/admin/ProjectList";
		}else {
			return "redirect:/admin/error";
		}		
	}
	
	@RequestMapping("/detailViewProject")
	public String detailViewProject(String page, int seq, Model m) {
		ProjectDTO dto = bs.detailViewProject(seq);
		m.addAttribute("dto", dto);
		List<ProjectCoDTO> list = bs.getProjectCo(seq);
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		return "admin/boardProjectDetailView";
	}
	
	@RequestMapping("/delProjectCo")
	public String delProjectCo(int seq, int projectSeq) {
		int result = bs.delProjectCo(seq);
		
		if(result > 0) {
			return "redirect:detailViewProject?seq="+projectSeq;
		}else {
			return "redirect:admin/error";
		}
	}
}

