package kh.hello.project;

import java.util.List;

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
	public String itnewsWriteFrm() {
		return "/itnews/write";
	}
	
	@RequestMapping("/detail")
	public String itnewsDetail(Model m, int seq) {
		ItnewsDTO result;
			result = is.itnewsDetail(seq);
			m.addAttribute("result", result);
			return "/itnews/itnewsView";
	}
	
}
