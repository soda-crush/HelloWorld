package kh.hello.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.configuration.Configuration;
import kh.hello.dto.NoticeDTO;
import kh.hello.services.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService ns;
	
	@RequestMapping("/noticeList")
	public String noticeList(String searchOption, String keyword, String page, Model m) {
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<NoticeDTO> result = ns.noticeListByPage(start, end, searchOption, keyword);
		m.addAttribute("list", result);
		
		List<String> pageNavi = ns.getNoticePageNavi(currentPage, searchOption, keyword);
		m.addAttribute("pageNavi", pageNavi);	
		m.addAttribute("page", currentPage);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/detailViewNotice")
	public String detailViewNotice(int seq, Model m) {
		NoticeDTO dto = ns.detailViewNotice(seq);
		m.addAttribute("dto", dto);
		return "notice/noticeDetailView";
	}
}
