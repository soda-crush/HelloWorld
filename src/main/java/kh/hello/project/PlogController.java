package kh.hello.project;

import javax.servlet.http.HttpSession;

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

	@Autowired
	private HttpSession session;
	
//	@Autowired
//	private ProjectService ps;

	@RequestMapping("/toPlogCohow.do")
	public String toPlogCohow() {
		return "/plog/plogCohow";
	}

	@RequestMapping("/toPlogProject.do")
	public String toPlogProject() {
		return "/plog/plogProject";
	}

	@RequestMapping("/toPlogScrap.do")
	public String toplogScrap() {
		return "/plog/plogScrap";
	}

	@RequestMapping("/toGuestBook.do")
	public String toGuestBook() {
		return "/plog/guestBook";
	}


//	
//	@RequestMapping("projectList.do")
//	public String getProjectList() {
//		
//		// ps. 으로 서비스 받아올것.
//		return "/plog/plogProject";
//	}
//	
}
