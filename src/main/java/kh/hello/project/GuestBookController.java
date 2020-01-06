package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.GuestBookDTO;
import kh.hello.services.GuestBookService;

@Controller
@RequestMapping("/GuestBook")
public class GuestBookController {
	
	@Autowired
	private GuestBookService gs;
	
	@Autowired
	private HttpSession session;

	@RequestMapping("/insert.do")
	public String insertWrite(GuestBookDTO gdto) {
		gdto.setWriter(session.getAttribute("loginInfo").toString());
		gs.insert(gdto);
		return "redirect:selectList.do";
	}
	
	@RequestMapping("/selectList.do")
	public String selectList(HttpServletRequest request) {
		List<GuestBookDTO> list = gs.selectList();
		request.setAttribute("list", list);
		return "/plog/GuestBook";
	}
}
