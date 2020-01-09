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
import kh.hello.dto.OwnerInfoDTO;
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
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		List<IndustryStatusDTO> ilist = ss.selectIndustryStatus(ownerInfo.getId());
		List<CodeQuestionDTO> clist = ss.selectCodeQuestion(ownerInfo.getId());
		List<ProjectDTO> plist = ss.selectProject(ownerInfo.getId());
		List<ItnewsDTO> nlist = ss.selectItnews(ownerInfo.getId());
		MemberDTO mdto = ms.selectMember(ownerInfo.getId());
		request.setAttribute("point", mdto.getPoint());
		request.setAttribute("ilist", ilist);
		request.setAttribute("clist", clist);
		request.setAttribute("plist", plist);
		request.setAttribute("nlist", nlist);
		return "plog/plogScrap";
	}
	
	@RequestMapping("/itNews.do")
	public String itNews() {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		List<ItnewsDTO> nlist = ss.selectItnews(ownerInfo.getId());
		request.setAttribute("nlist", nlist);
		return "plog/scrapItNews";
	}
	
	@RequestMapping("/cohow.do")
	public String cohow() {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		List<CodeQuestionDTO> clist = ss.selectCodeQuestion(ownerInfo.getId());
		request.setAttribute("clist", clist);
		return "plog/scrapCohow";
	}
	
	@RequestMapping("/industryStatus.do")
	public String industryStatus() {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		List<IndustryStatusDTO> ilist = ss.selectIndustryStatus(ownerInfo.getId());
		request.setAttribute("ilist", ilist);
		return "plog/scrapIndustryStatus";
	}
	
	@RequestMapping("/project.do")
	public String project() {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		List<ProjectDTO> plist = ss.selectProject(ownerInfo.getId());
		request.setAttribute("plist", plist);
		return "plog/scrapProject";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
