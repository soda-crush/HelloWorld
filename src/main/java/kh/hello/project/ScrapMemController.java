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
import kh.hello.dto.MemberDTO;
import kh.hello.dto.OwnerInfoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.MemberService;
import kh.hello.services.ScrapService;

@Controller
@RequestMapping("/Scrap")
public class ScrapMemController {
	
	@Autowired
	private ScrapService ss;

	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/itNews.do")
	public String itNews(String cpage) {
		try {
			OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
			String ownerID = ownerInfo.getId();
			int currentPage = 1;	
			if(cpage != null) currentPage = Integer.parseInt(cpage);
			int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
			int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
			List<ItnewsDTO> nlist = ss.selectItnewsByPage(ownerID,start,end);
			List<String> pageNavi = ss.getScrapPageNavi(ownerID, currentPage, "itNews");
			MemberDTO mdto = ms.selectMember(ownerInfo.getId());
			request.setAttribute("point", mdto.getPoint());
			request.setAttribute("cpage", currentPage);
			request.setAttribute("pageNavi", pageNavi);
			request.setAttribute("nlist", nlist);
			return "plog/scrapItNews";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/cohow.do")
	public String cohow(String cpage) {
		try {
			OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
			String ownerID = ownerInfo.getId();
			int currentPage = 1;
			if(cpage != null) currentPage = Integer.parseInt(cpage);
			int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
			int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
			List<CodeQuestionDTO> clist = ss.selectCodeQuestionByPage(ownerID,start,end);
			List<String> pageNavi = ss.getScrapPageNavi(ownerID, currentPage, "cohow");
			MemberDTO mdto = ms.selectMember(ownerInfo.getId());
			request.setAttribute("point", mdto.getPoint());
			request.setAttribute("cpage", currentPage);
			request.setAttribute("pageNavi", pageNavi);
			request.setAttribute("clist", clist);
			return "plog/scrapCohow";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/industryStatus.do")
	public String industryStatus(String cpage) {
		try {
			OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
			String ownerID = ownerInfo.getId();
			int currentPage = 1;	
			if(cpage != null) currentPage = Integer.parseInt(cpage);
			int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
			int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
			List<IndustryStatusDTO> ilist = ss.selectIndustryStatusByPage(ownerID,start,end);
			List<String> pageNavi = ss.getScrapPageNavi(ownerID, currentPage, "industryStatus");
			MemberDTO mdto = ms.selectMember(ownerInfo.getId());
			request.setAttribute("point", mdto.getPoint());
			request.setAttribute("cpage", currentPage);
			request.setAttribute("pageNavi", pageNavi);
			request.setAttribute("ilist", ilist);
			return "plog/scrapIndustryStatus";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
	@RequestMapping("/project.do")
	public String project(String cpage) {
		try {
			OwnerInfoDTO ownerInfo = (OwnerInfoDTO)session.getAttribute("ownerInfo");
			String ownerID = ownerInfo.getId();
			int currentPage = 1;
			if(cpage != null) currentPage = Integer.parseInt(cpage);
			int end = currentPage * Configuration.pLogProjectRecordCountPerPage;
			int start = end - (Configuration.pLogProjectRecordCountPerPage - 1);
			List<ProjectDTO> plist = ss.selectProjectByPage(ownerID,start,end);
			List<String> pageNavi = ss.getScrapPageNavi(ownerID, currentPage, "project");
			MemberDTO mdto = ms.selectMember(ownerInfo.getId());
			request.setAttribute("point", mdto.getPoint());
			request.setAttribute("cpage", currentPage);
			request.setAttribute("pageNavi", pageNavi);
			request.setAttribute("plist", plist);
			return "plog/scrapProject";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}
	
}
