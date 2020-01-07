package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
import kh.hello.dto.InquiryDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.services.ItnewsService;

@Controller
@RequestMapping("/itnews")
public class ItnewsController {

	@Autowired
	private ItnewsService is;
	
	@RequestMapping("/itnewsList")
	public String itnewsMainList(Model m, String cpage) {
				int realCpage = 1;
				if(cpage != null) realCpage = Integer.parseInt(cpage);
				
				if(realCpage > 0 && realCpage <= Configuration.naviCountPerPage) {
					m.addAttribute("currentPage", realCpage);
				}else if(realCpage % Configuration.naviCountPerPage == 0) {
					m.addAttribute("currentPage", Configuration.naviCountPerPage + 1);
				}else {
					m.addAttribute("currentPage", (realCpage % Configuration.naviCountPerPage + 1));
				}
				
				int end = realCpage * Configuration.recordCountPerPage;
				int start = end - (Configuration.recordCountPerPage - 1);	
				
				List<ItnewsDTO> list;
					list = is.itnewsListTrim(start, end);
					m.addAttribute("list", list);
					
					String pageNavi = is.getPageNavi(realCpage);
					m.addAttribute("navi", pageNavi);
				
				m.addAttribute("page", realCpage);
				
				return "itnews/itnewsList";
	}
	
	@RequestMapping("/write")
	public String itnewsWriteFrm(String page,Model m) {
		m.addAttribute("page", page);
		return "/itnews/write";
	}
	
	@RequestMapping("/detail")
	public String itnewsDetail(Model m, int seq) {
		ItnewsDTO result;
			result = is.itnewsDetail(seq);
			m.addAttribute("result", result);
			return "/itnews/itnewsView";
	}
	
	@RequestMapping("/writeProc")
	public String writeProc(String page, ItnewsDTO dto, HttpSession session){
		String path = session.getServletContext().getRealPath("attached");
		
		int result = 0;
		try {
			//result = is.writeItnews(path, dto);
			if(result > 0) {//detailView 완성하면 경로 변경하기
				return "redirect:myInquiry";
			}else {
				return "redirect:../error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}
	
}
