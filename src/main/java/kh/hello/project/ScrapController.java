package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.MemberDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.MemberService;
import kh.hello.services.ScrapService;

@Controller
@RequestMapping("/Scrap")
public class ScrapController {
	
	@Autowired
	private ScrapService ss;

	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/toScrap.do")
	public String toplogScrap() {
		LoginInfoDTO info = (LoginInfoDTO)session.getAttribute("loginInfo");
		List<IndustryStatusDTO> ilist = ss.selectIndustryStatus(info.getId());
		List<CodeQuestionDTO> clist = ss.selectCodeQuestion(info.getId());
		List<ProjectDTO> plist = ss.selectProject(info.getId());
		List<ItnewsDTO> nlist = ss.selectItnews(info.getId());
		MemberDTO mdto = ms.selectMember(info.getId());
		request.setAttribute("point", mdto.getPoint());
		request.setAttribute("ilist", ilist);
		request.setAttribute("clist", clist);
		request.setAttribute("plist", plist);
		request.setAttribute("nlist", nlist);
		return "plog/plogScrap";
	}
	
	
}
