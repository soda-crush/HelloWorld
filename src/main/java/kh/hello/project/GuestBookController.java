package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.GuestBookDTO;
import kh.hello.services.GuestBookService;

@Controller
@RequestMapping("/GuestBook")
public class GuestBookController {
	
	@Autowired
	private GuestBookService gs;
	
	@Autowired
	private HttpSession session;

	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/insert.do")
	public String insert(GuestBookDTO gdto) {
//		gdto.setWriter(session.getAttribute("loginInfo").toString());	
		gdto.setOwner("test");	//바꿔줄것.
		gdto.setWriter("test");	//나중에 바꿔줄것.
		gs.insert(gdto);
		return "redirect:selectList.do";
	}
	
	@RequestMapping("/selectList.do")
	public String selectList(String cpage) {
//		String owner = session.getAttribute("loginInfo").toString();
		String owner = "test"; //바꿔줄것.
		int currentPage = 1;		

		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);
		System.out.println(start + " : " + end);
		System.out.println("owner" + owner);
		
		List<GuestBookDTO> list = gs.selectListByPage(owner,start,end);
		List<String> pageNavi = gs.getGuestBookPageNavi(currentPage);
		
		request.setAttribute("list", list);
		request.setAttribute("pageNavi", pageNavi);
		return "plog/guestBook";
	}
	
	@RequestMapping("delete")
	public String delete(int seq) {
		System.out.println(seq);
		gs.delete(seq);
		return "redirect:selectList.do";
	}
}
