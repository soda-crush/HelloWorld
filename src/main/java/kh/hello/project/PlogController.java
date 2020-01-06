package kh.hello.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.GuestBookDTO;
import kh.hello.services.GuestBookService;

@Controller
@RequestMapping("/Plog")
public class PlogController {
	
	@Autowired
	private GuestBookService gs;

	@RequestMapping("/toPlogCohow.do")
	public String toPlogCohow() {
		return "/plog/plogCohow";
	}
	
	@RequestMapping("/toPlogProject.do")
	public String toPlogProject() {
		return "/plog/plogProject";
	}
	
	@RequestMapping("/toplogScrap.do")
	public String toplogScrap() {
		return "/plog/plogScrap";
	}
	
	@RequestMapping("/toGuestBook.do")
	public String toGuestBook() {
		return "/plog/guestBook";
	}
	
	@RequestMapping("/insert.do")
	public String insert(GuestBookDTO gdto) {
		gs.insert(gdto);
		return "redirect:toGuestBook.do";
	}
	
//	@Autowired
//	private ProjectService ps;
//	
//	@RequestMapping("projectList.do")
//	public String getProjectList() {
//		
//		// ps. 으로 서비스 받아올것.
//		return "/plog/plogProject";
//	}
//	
}
