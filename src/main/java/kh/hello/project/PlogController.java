package kh.hello.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.services.ProjectService;

@Controller
@RequestMapping("/Plog")
public class PlogController {
	
	
	@Autowired
	private ProjectService ps;
	
	@RequestMapping("projectList.do")
	public String getProjectList() {
		
		// ps. 으로 서비스 받아올것.
		return "/plog/plogProject";
	}
	
}
