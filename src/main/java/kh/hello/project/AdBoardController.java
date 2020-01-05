package kh.hello.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
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
}
