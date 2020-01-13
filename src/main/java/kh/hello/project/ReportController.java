package kh.hello.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import kh.hello.configuration.Configuration;
import kh.hello.dto.ReportDTO;
import kh.hello.services.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService rs;
	
	@RequestMapping("/reportList")
	public String reportMainList(String page, Model m) {
		int currentPage = 1;
		if(page!= null && !page.equals("") && !page.equals("null")) currentPage = Integer.parseInt(page);
		
		int end = currentPage * (Configuration.recordCountPerPage);
		int start = end - (Configuration.recordCountPerPage-1);
		
		List<ReportDTO> result = rs.reportListByPage(start, end);
		m.addAttribute("list", result);
		
		List<String> pageNavi = rs.getReportPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		
		m.addAttribute("page", currentPage);
		
		return "admin/reportList";
	}	
	
	@RequestMapping(value="/updateReport", produces="text/html;charset=utf8")
	@ResponseBody
	public String updateReport(int seq, String result, String page) {
		int check = rs.updateReport(seq, result);
		if(check > 0) {
			JsonObject obj = new JsonObject();
			obj.addProperty("result", true);
			obj.addProperty("page", page);
			return obj.toString();
		}else {
			JsonObject obj = new JsonObject();
			obj.addProperty("result", false);
			return obj.toString();
		}		
	}
}
