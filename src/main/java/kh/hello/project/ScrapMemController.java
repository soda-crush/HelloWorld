package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.ScrapService;

@Controller
@RequestMapping("/Scrap")
public class ScrapMemController {
	
	@Autowired
	private ScrapService ss;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
//	@RequestMapping("/toScrap.do")
//	public String toplogScrap() {
//		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
//		List<IndustryStatusDTO> ilist = ss.selectIndustryStatusByPage(ownerInfo.getId());
//		List<CodeQuestionDTO> clist = ss.selectCodeQuestionByPage(ownerInfo.getId());
//		List<ProjectDTO> plist = ss.selectProjectByPage(ownerInfo.getId());
//		List<ItnewsDTO> nlist = ss.selectItnewsByPage(ownerInfo.getId());
//		MemberDTO mdto = ms.selectMember(ownerInfo.getId());
//		request.setAttribute("point", mdto.getPoint());
//		request.setAttribute("ilist", ilist);
//		request.setAttribute("clist", clist);
//		request.setAttribute("plist", plist);
//		request.setAttribute("nlist", nlist);
//		return "plog/plogScrap";
//	}
	
	@RequestMapping("/itNews.do")
	public String itNews(String cpage) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		String ownerID = ownerInfo.getId();
		int currentPage = 1;	
		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
		int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
		List<ItnewsDTO> nlist = ss.selectItnewsByPage(ownerID,start,end);
		List<String> pageNavi = ss.getScrapPageNavi(ownerID, currentPage, "itNews");
		request.setAttribute("cpage", currentPage);
		request.setAttribute("pageNavi", pageNavi);
		request.setAttribute("nlist", nlist);
		return "plog/scrapItNews";
	}
	
	@RequestMapping("/cohow.do")
	public String cohow(String cpage) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		String ownerID = ownerInfo.getId();
		int currentPage = 1;
		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
		int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
		List<CodeQuestionDTO> clist = ss.selectCodeQuestionByPage(ownerID,start,end);
		List<String> pageNavi = ss.getScrapPageNavi(ownerID, currentPage, "cohow");
		request.setAttribute("cpage", currentPage);
		request.setAttribute("pageNavi", pageNavi);
		request.setAttribute("clist", clist);
		return "plog/scrapCohow";
	}
	
	@RequestMapping("/industryStatus.do")
	public String industryStatus(String cpage) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		String ownerID = ownerInfo.getId();
		int currentPage = 1;	
		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
		int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
		List<IndustryStatusDTO> ilist = ss.selectIndustryStatusByPage(ownerID,start,end);
		List<String> pageNavi = ss.getScrapPageNavi(ownerID, currentPage, "industryStatus");
		request.setAttribute("cpage", currentPage);
		request.setAttribute("pageNavi", pageNavi);
		request.setAttribute("ilist", ilist);
		return "plog/scrapIndustryStatus";
	}
	
	@RequestMapping("/project.do")
	public String project(String cpage) {
		OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
		String ownerID = ownerInfo.getId();
		int currentPage = 1;
		if(cpage != null) currentPage = Integer.parseInt(cpage);
		int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
		int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
		List<ProjectDTO> plist = ss.selectProjectByPage(ownerID,start,end);
		List<String> pageNavi = ss.getScrapPageNavi(ownerID, currentPage, "project");
		request.setAttribute("cpage", currentPage);
		request.setAttribute("pageNavi", pageNavi);
		request.setAttribute("plist", plist);
		return "plog/scrapProject";
	}
	
}
