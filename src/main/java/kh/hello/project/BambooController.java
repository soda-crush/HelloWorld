package kh.hello.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hello.dto.BambooDTO;
import kh.hello.services.BambooService;

@Controller
@RequestMapping("/bamboo")
public class BambooController {
	@Autowired
	private BambooService service;
	
	@RequestMapping("/bamboolist.do")
	public String bamboolistView (Model m) {//대나무숲 게시판목록
		List<BambooDTO> list = service.bambooList();
		m.addAttribute("list", list);
		return "/bamboo/bambooList";
	}
	@RequestMapping("/bambooDetailView.do")
	public String bambooDetailView () {//대나무숲 글보기
		
		return "/bamboo/bambooDetailView";
	}
}
