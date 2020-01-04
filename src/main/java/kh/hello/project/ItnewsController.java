package kh.hello.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.ItnewsDTO;
import kh.hello.services.ItnewsService;

@Controller
@RequestMapping("/itnews")
public class ItnewsController {

	@Autowired
	private ItnewsService is;
	
	@RequestMapping("/itnewsList")
	public String itnewsMainList(Model m) {
		try {
			List<ItnewsDTO> result = is.itnewsList();
			m.addAttribute("itnewsList", result);
			return "/itnews/itnewsList";
		}catch(Exception e) {
			e.printStackTrace();
			return "../error";
		}
	}
	
	@RequestMapping("/write")
	public String itnewsWriteFrm() {
		return "/itnews/write";
	}
	
	@RequestMapping("/detail")
	public String itnewsDetail(Model m, int seq) {
		ItnewsDTO result;
		try {
			result = is.itnewsDetail(seq);
			m.addAttribute("result", result);
			return "/itnews/itnewsView";
		} catch (Exception e) {
			e.printStackTrace();
			return "../error";
		}
	}
	
}
