package kh.hello.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kh.hello.configuration.Configuration;
import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.CodeCommentsDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;
import kh.hello.dto.GuestBookDTO;
import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ItnewsCoDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.AdBoardService;

@Controller
@RequestMapping("/adBoard")
public class AdBoardController {
	@Autowired
	private AdBoardService bs;
	
	/* 
	 * 프로젝트
	 */
	@RequestMapping("/projectList")
	public String projectMainList(String page, Model m) {
		
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<ProjectDTO> result = bs.projectListperPage(start, end);
		m.addAttribute("list", result);
		
		List<String> pageNavi = bs.getProjectPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		
		return "admin/boardProjectList";
	}
	
	@RequestMapping("/delProject")
	public String delProject(int seq, String page) {
		int result = bs.delProject(seq);
		if(result > 0) {
			return "redirect:/adBoard/projectList?page="+page;
		}else {
			return "redirect:/admin/adminError";
		}		
	}
	
	@RequestMapping("/detailViewProject")
	public String detailViewProject(String page, int seq, Model m) {
		ProjectDTO dto = bs.detailViewProject(seq);
		m.addAttribute("dto", dto);
		List<ProjectCoDTO> list = bs.getProjectCo(seq);
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		return "admin/boardProjectDetailView";
	}
	
	@RequestMapping("/delProjectCo")
	public String delProjectCo(int seq, int projectSeq, String page) {
		int result = bs.delProjectCo(seq);
		
		if(result > 0) {
			return "redirect:detailViewProject?page="+page+"&seq="+projectSeq;
		}else {
			return "redirect:admin/adminError";
		}
	}
	
	/* 
	 * 방명록
	 */
	
	@RequestMapping("/guestBookList")
	public String guestBookMainList(String page, Model m) {
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<GuestBookDTO> result = bs.guestBookListByPage(start, end);
		m.addAttribute("list", result);
		
		List<String> pageNavi = bs.getGuestBookPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		return "admin/boardGuestBookList";	
	}
	
	@RequestMapping("/delGuestBook")
	public String delGuestBook(int seq, int page) {
		int result = bs.delGuestBook(seq);
		if(result > 0) {
			return "redirect:/adBoard/guestList?page="+page;
		}else {
			return "redirect:/admin/adminError";
		}	
	}
	
	/* 
	 * 대나무숲
	 */
	
	@RequestMapping("/bambooList")
	public String bambooMainList(String page, Model m) {
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<BambooDTO> result = bs.bambooListByPage(start, end);
		m.addAttribute("list", result);
		
		List<String> pageNavi = bs.getBambooPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		
		return "admin/boardBambooList";
	}
	
	@RequestMapping("/delBamboo")
	public String delBamboo(int seq, String page) {
		int result = bs.delBamboo(seq);
		if(result > 0) {
			return "redirect:/adBoard/bambooList?page="+page;
		}else {
			return "redirect:/admin/adminError";
		}			
	}
	
	@RequestMapping("/detailViewBamboo")
	public String detailViewBamboo(String page, int seq, Model m) {
		BambooDTO dto = bs.detailViewBamboo(seq);
		m.addAttribute("dto", dto);
		List<BambooCoDTO> list = bs.getBambooCo(seq);
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		return "admin/boardBambooDetailView";		
	}
	
	@RequestMapping("/delBambooCo")
	public String delBambooCo(int seq, int bamSeq, String page) {
		int result = bs.delBambooCo(seq);
		
		if(result > 0) {
			return "redirect:detailViewBamboo?page="+page+"&seq="+bamSeq;
		}else {
			return "redirect:admin/adminError";
		}
	}
	
	/* 
	 * 업계현황
	 */
	
	@RequestMapping("/industryList")
	public String industryMainList(String page, Model m) {
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<IndustryStatusDTO> result = bs.industryListByPage(start, end);
		m.addAttribute("list", result);
		
		List<String> pageNavi = bs.getIndustryPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		
		return "admin/boardIndustryList";		
	}
	
	@RequestMapping("/delIndustry")
	public String delIndustry(int seq, String page) {
		int result = bs.delIndustry(seq);
		if(result > 0) {
			return "redirect:/adBoard/industryList?page="+page;
		}else {
			return "redirect:/admin/adminError";
		}			
	}
	
	@RequestMapping("/detailViewIndustry")
	public String detailViewIndustry(String page, int seq, Model m) {
		IndustryStatusDTO dto = bs.detailViewIndustry(seq);
		m.addAttribute("dto", dto);
		List<IndustryStatusCoDTO> list = bs.getIndustryCo(seq);
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		return "admin/boardIndustryDetailView";			
	}
	
	@RequestMapping("/delIndustryCo")
	public String delIndustryCo(int seq, int indSeq, String page) {
		int result = bs.delIndustryCo(seq);
		
		if(result > 0) {
			return "redirect:detailViewIndustry?page="+page+"&seq="+indSeq;
		}else {
			return "redirect:admin/adminError";
		}
	}
		
	/* 
	 * IT뉴스 ( 완료 )
	 */
	
	@RequestMapping("/itnewsList")
	public String itnewsMainList(String page, Model m) {
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<ItnewsDTO> result = bs.itnewsListByPage(start, end);
		m.addAttribute("list", result);
		
		List<String> pageNavi = bs.getItnewsPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		return "admin/boardITnewsList";	
	}
	
	@RequestMapping("/delItnews")
	public String delItnews(int seq, String page) {
		int result = bs.delItnews(seq);
		if(result > 0) {
			return "redirect:/adBoard/itnewsList?page="+page;
		}else {
			return "redirect:/admin/adminError";
		}			
	}
	
	@RequestMapping("/detailViewItnews")
	public String detailViewItnews(String page, int seq, Model m) {
		ItnewsDTO dto = bs.detailViewItnews(seq);
		m.addAttribute("dto", dto);
		List<ItnewsCoDTO> list = bs.getItnewsCo(seq);
		m.addAttribute("list", list);
		m.addAttribute("page", page);
		return "admin/boardItnewsDetailView";			
	}
	
	@RequestMapping("delItnewsCo")
	public String delItnewsCo(int seq, int itSeq, String page) {
		int result = bs.delItnewsCo(seq);
		
		if(result > 0) {
			return "redirect:detailViewItnews?page="+page+"&seq="+itSeq;
		}else {
			return "redirect:admin/adminError";
		}		
	}
	
	/* 
	 * Code-How ( 진행중 )
	 */
	
	@RequestMapping("/cohowList")
	public String cohowMainList(String page, Model m) {
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<CodeQuestionDTO> result = bs.cohowListByPage(start, end);
		m.addAttribute("list", result);
		
		List<String> pageNavi = bs.getCohowPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		return "admin/boardCohowList";			
	}
	
	@RequestMapping("/delCohow")
	public String delCohow(int seq, String page) {
		int result = bs.delCohow(seq);
		if(result > 0) {
			return "redirect:/adBoard/cohowList?page="+page;
		}else {
			return "redirect:/admin/adminError";
		}		
	}
	
	@RequestMapping("/detailViewCohow")
	public String detailViewCohow(String page, int seq, Model m) {
		CodeQuestionDTO qdto = bs.detailViewCohow(seq);
		m.addAttribute("qdto", qdto);
		List<CodeReplyDTO> rdto = bs.getCohowReply(seq);
		m.addAttribute("rdto", rdto);
		List<CodeCommentsDTO> list = bs.getCohowCo(seq);
		m.addAttribute("list", list);
		
		m.addAttribute("page", page);
		return "admin/boardCohowDetailView";			
	}
	
	@RequestMapping(value="/delCohowCo", produces="text/html;charset=utf8")
	@ResponseBody
	public String delCohowCo(int repSeq, int seq) {
		int result = bs.delCohowCo(seq);
		if(result > 0) {
			return bs.getCohowCoByRep(repSeq);
		}else {
			JsonObject obj = new JsonObject();
			obj.addProperty("result", false);
			return obj.toString();
		}
	}

}

