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
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.services.GuestBookService;
import kh.hello.services.MemberService;

@Controller
@RequestMapping("/GuestBook")
public class GuestBookMemController {
	
	@Autowired
	private GuestBookService gs;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;

	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/insert.do")
	public String writeProcinsert(GuestBookDTO gdto) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		LoginInfoDTO loginInfo = (LoginInfoDTO)session.getAttribute("loginInfo");
		gdto.setWriterID(loginInfo.getId());
		gdto.setWriter(loginInfo.getNickName());
		gdto.setOwnerID(ownerInfo.getId());
		gdto.setOwner(ownerInfo.getNickName());
		gdto.setWriterImg(ms.selectMember(loginInfo.getId()).getProfileImg());
		gs.insert(gdto);
		return "redirect:selectList.do";
	}
	
	@RequestMapping("/selectList.do")
	public String selectList(String cpage) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		String ownerID = ownerInfo.getId();
		int currentPage = 1;
		if(cpage==null) {
			cpage="1";
		}else {
			currentPage = Integer.parseInt(cpage);
		}
		int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
		int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
		List<GuestBookDTO> list = gs.selectListByPage(ownerID,start,end);
		List<String> pageNavi = gs.getGuestBookPageNavi(ownerID, currentPage);
		request.setAttribute("cpage", currentPage);
		request.setAttribute("list", list);
		request.setAttribute("pageNavi", pageNavi);
		return "plog/guestBook";
	}
	
	@RequestMapping("delete.do")
	public String guestBookdeleteProc(int seq,String cpage) {
		gs.delete(seq);
		return "redirect:selectList.do?cpage=" + cpage;
	}
	
	@RequestMapping("update.do")
	@ResponseBody
	public void update(GuestBookDTO gdto) {
		gs.update(gdto);
	}
	
	
	
	
}
