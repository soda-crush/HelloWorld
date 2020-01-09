package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.GuestBookDTO;
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.dto.PortfolioDTO;
import kh.hello.services.GuestBookService;
import kh.hello.services.MemberService;

@Controller
@RequestMapping("/GuestBook")
public class GuestBookController {
	
	@Autowired
	private GuestBookService gs;
			
	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;

	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/insert.do")
	public String insert(GuestBookDTO gdto) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		gdto.setWriter(((LoginInfoDTO)session.getAttribute("loginInfo")).getNickName());
		gdto.setOwner(ownerInfo.getId());
		gs.insert(gdto);
		return "redirect:selectList.do";
	}
	
	@RequestMapping("/selectList.do")
	public String selectList(String cpage) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		String owner = ownerInfo.getId();
		int currentPage = 1;		

		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);
		List<GuestBookDTO> list = gs.selectListByPage(owner,start,end);
		List<String> pageNavi = gs.getGuestBookPageNavi(owner, currentPage);
		request.setAttribute("list", list);
		request.setAttribute("pageNavi", pageNavi);
		return "plog/guestBook";
	}
	
	@RequestMapping("delete.do")
	public String delete(int seq) {
		gs.delete(seq);
		return "redirect:selectList.do";
	}
	
	@RequestMapping("update.do")
	@ResponseBody
	public void update(GuestBookDTO gdto) {
		gs.update(gdto);
	}
	
	
	
	
}
